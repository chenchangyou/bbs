package com.youren.bbs.controller;

import com.youren.bbs.entity.User;
import com.youren.bbs.service.ReplyLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/replyLike")
public class ReplyLikeController {

    @Autowired
    private ReplyLikeService replyLikeService;

    @ResponseBody
    @PostMapping("/add")
    public int save(Long rid, HttpSession session){

        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser!=null){
            Long uid = loginUser.getId();

            return replyLikeService.save(rid, uid);
    }else {
        return 2;
        }
    }
}
