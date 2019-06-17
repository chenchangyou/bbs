package com.youren.bbs.controller.user;


import com.youren.bbs.entity.User;
import com.youren.bbs.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class CollectController {

    @Autowired
    private CollectService collectService;

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
