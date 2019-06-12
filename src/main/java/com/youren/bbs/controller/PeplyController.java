package com.youren.bbs.controller;

import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.ReplyService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


@Controller
public class PeplyController {

    @Autowired
    private UserService userService;
    @Autowired
    private ReplyService replyService;
    public void post(){

    }

    @PostMapping("addReply")
    public String add(long postId, String content, HttpSession httpSession){

        User user = (User)httpSession.getAttribute("loginUser");

        int id = replyService.add(content, postId,user.getId());
        if(id > 0){
            return "";
        }else {
            return "";
        }
    }

}
