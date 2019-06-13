package com.youren.bbs.controller;


import com.youren.bbs.entity.User;
import com.youren.bbs.service.ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 回复评论
 */
@Controller
@RequestMapping("/replyComment")
public class ReplyCommentController {

    @Autowired
    private ReplyCommentService replyCommentService;


    @ResponseBody
    @PostMapping("/add")
    public Long add(Long replyId,String content, HttpSession session){

        User user = (User)session.getAttribute("loginUser");

        Long userid = user.getId();

        long row = replyCommentService.add(replyId, content, userid);

        System.out.println(row);


        return row;
    }
}
