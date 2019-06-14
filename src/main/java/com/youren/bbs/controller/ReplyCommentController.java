package com.youren.bbs.controller;


import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.acl.LastOwnerException;

/**
 * 回复评论
 */
@Controller
@RequestMapping("/replyComment")
public class ReplyCommentController {

    @Autowired
    private ReplyCommentService replyCommentService;

    @Autowired
    private PostService postService;


    @ResponseBody
    @PostMapping("/add")
    public Long add(Long replyId, String content,Long postId, HttpSession session){

        User user = (User)session.getAttribute("loginUser");

        Post post = postService.findById(postId);
        Integer replynumber = post.getReplynumber();

        Long userid = user.getId();

        long row = replyCommentService.add(replyId, content, userid);
        postService.updatereplynumber(postId,replynumber+1);

        System.out.println(row);


        return row;
    }
}
