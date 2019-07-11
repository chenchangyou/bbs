package com.youren.bbs.controller.user;


import com.youren.bbs.entity.User;
import com.youren.bbs.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * 收藏
 */
@Controller
@RequestMapping("/user/")
public class CollectController {

    @Autowired
    private CollectService collectService;

    //判断用户是否收藏有该帖子
    @ResponseBody
    @PostMapping("collect")
    public int judgeCollect(Long pid, HttpSession session){

        User user = (User)session.getAttribute("loginUser");

        if(user!=null){
            return collectService.judgeCollect(pid, user.getId());
        }
        return 2;
    }
}
