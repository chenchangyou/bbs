package com.youren.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.ReplyService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 评论
 */
@Controller
public class PeplyController {

    @Autowired
    private UserService userService;
    @Autowired
    private ReplyService replyService;

    @Autowired
    private PostService postService;

    @ResponseBody
    @PostMapping("addReply")
    public int add(long postId, String content, HttpSession httpSession){
        Post post =null;
        User user = (User)httpSession.getAttribute("loginUser");

        post = postService.findById(postId);
        Integer replynumber = post.getReplynumber();

        int id = replyService.add(content, postId,user.getId());
        if(id > 0){
            postService.updatereplynumber(postId,replynumber+1);
            return 1;
        }else {
            return 0;
        }
    }

    @ResponseBody
    @PostMapping("deletereply")
    public int deletereply(Long replyId){
        int row = replyService.delete(replyId);
        return row;
    }
    @ResponseBody
    @GetMapping("/admin/reply/list")
    public Map<String, Object> findAll(@RequestParam(name = "page",defaultValue = "1") int pageNum,
                                       @RequestParam(name = "limit",defaultValue = "10") int pageSize){
        Map<String,Object> replymap = new HashMap<String, Object>();

        PageHelper.startPage(pageNum, pageSize);

        List<Reply> replyList = replyService.findAll();

        PageInfo<Reply> page = new PageInfo<Reply>(replyList);

        replymap.put("code",0);
        replymap.put("count",page.getTotal());
        replymap.put("data",page.getList());

        return replymap;
    }
    @GetMapping("/admin/reply")
    public String reply(){
      return "/admin/replyList";
    }

    @GetMapping("/admin/reply/edit")
    public String replyEdit(Long rid, Model model){

        model.addAttribute("reply",replyService.findById(rid));

        return "/admin/replyEdit";
    }

    @ResponseBody
    @PostMapping("/admin/reply/edit")
    public int replyEditSave(Long rid,String content){

        return replyService.update(rid,content);
    }
}
