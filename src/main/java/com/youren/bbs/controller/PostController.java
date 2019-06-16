package com.youren.bbs.controller;

import com.youren.bbs.entity.*;
import com.youren.bbs.service.FabulousService;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.ReplyService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


/**
 * 贴子
 */
@Controller
public class PostController {

    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;
    @Autowired
    private FabulousService fabulousService;
    @Autowired
    private ReplyService replyService;

    @GetMapping("addpost")
    public String addpost(){
        return "user/addpost";
    }


    /**
     * 获取帖子详情页的数据
     * @param postlistId 帖子Id
     * @param model 传值到浏览器
     * @param session 获取HttpSession对象
     * @return 帖子详情页
     */
    @GetMapping("postdetails")
    public String postdetails(long postlistId,Model model,HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        int state =0;//用于判断当前用户是否点赞过该帖子（0 无，1有）
        if(loginUser!=null) {
            Fabulous fabulous = fabulousService.findByPidUid(postlistId, loginUser.getId());
            if(fabulous!=null){
                state = 1;
            }
        }

        Post post = postService.findById(postlistId);
        //获取访问量
        Integer browse = post.getBrowse();
        //更新访问量加1
        int i = postService.updatebrowse(postlistId,  browse+1);

        Long userId = post.getUser().getId();

        //获取发帖者的信息
        User user = userService.findById(userId);

        //获取当前帖子的所有评论
        List<Reply> replyLists = replyService.findByPostId(postlistId);

        model.addAttribute("state",state);//
        model.addAttribute("count",fabulousService.findnumber(postlistId));
        model.addAttribute("replyList",replyLists);
        model.addAttribute("user",user);
        model.addAttribute("post",post);
        return "postdetails";
    }

    /**
     * 发表帖子（添加帖子）
     * @param title 标题
     * @param content 内容
     * @param session 获取HttpSession对象
     * @param model 传值到浏览器
     * @return 成功或者失败
     */
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

    /**
     * 删除帖子
     * @param postId id
     */
    @ResponseBody
    @PostMapping("/admin/deletePost")
    public String daletepost(Long postId){

        int row = postService.updateState(0, postId);
        if(row > 0){
            return "ok";
        }else {
            return "删除失败！";
        }
    }
}
