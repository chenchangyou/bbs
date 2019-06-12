package com.youren.bbs.controller;

import com.youren.bbs.entity.Category;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.ReplyService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class PostController {

    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;

    @Autowired
    private ReplyService replyService;

    @GetMapping("addpost")
    public String addpost(){
        return "user/addpost";
    }

    @GetMapping("postdetails")
    public String postdetails(long postlistId,Model model){
        Post post = postService.findById(postlistId);

        Integer browse = post.getBrowse();

        int i = postService.updatebrowse(postlistId,  browse+1);

        Long userId = post.getUser().getId();
        User user = userService.findById(userId);

        List<Reply> replyLists = replyService.findByPostId(postlistId);

        model.addAttribute("replyList",replyLists);
        model.addAttribute("user",user);
        model.addAttribute("post",post);
        return "postdetails";
    }

    @PostMapping("addpost")
    public String addpost(String title,String content, HttpSession session, Model model){

        User user = (User)session.getAttribute("loginUser");
        Date datetime = new Date();
        Category category = new Category();
        category.setId(1);
        Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setCreateTime(datetime);
        post.setCategory(category);
        post.setUser(user);
        post.setState(1);

        int row = postService.create(post);
        if( row > 0){
            model.addAttribute("ok","发表成功");
            return "redirect:/";
        }else {
            model.addAttribute("error","发表失败");
            return "user/addpost";
        }
    }
}
