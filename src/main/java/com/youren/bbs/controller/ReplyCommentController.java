package com.youren.bbs.controller;


import com.youren.bbs.entity.User;
import com.youren.bbs.service.ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/replyComment")
public class ReplyCommentController {

    @Autowired
    private ReplyCommentService replyCommentService;


    @PostMapping("/add")
    public String add(long replyId,String content, HttpSession session){

        User user = (User)session.getAttribute("loginUser");

        Long userid = user.getId();

        int row = replyCommentService.add(replyId, content, userid);

        if(row > 0 ){
            return "";
        }else {
            return "";
        }
    }
}
