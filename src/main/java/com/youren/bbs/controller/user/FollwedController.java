package com.youren.bbs.controller.user;

import com.youren.bbs.entity.User;
import com.youren.bbs.service.FabulousService;
import com.youren.bbs.service.FollowedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class FollwedController {

    @Autowired
    private FollowedService followedService;

    @ResponseBody
    @GetMapping("followed")
    public int judgeFollowed(Long fid, HttpSession session){

        User user = (User)session.getAttribute("loginUser");
        Long userId=null;
        if(user!=null){
            userId=user.getId();
        }
        int i = followedService.judgeFollowed(fid,userId);

        return i;
    }

}
