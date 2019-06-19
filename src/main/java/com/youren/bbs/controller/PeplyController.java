package com.youren.bbs.controller;

import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.ReplyService;
import com.youren.bbs.service.UserService;
import com.youren.bbs.util.Constant;
import com.youren.bbs.util.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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

}
