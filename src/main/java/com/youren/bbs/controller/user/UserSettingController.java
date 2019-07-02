package com.youren.bbs.controller.user;


import com.youren.bbs.entity.User;
import com.youren.bbs.service.UserService;
import com.youren.bbs.service.UserSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class UserSettingController {

    @Autowired
    private UserSettingService userSettingService;

    @Autowired
    private UserService userService;

    @GetMapping("/createSetting")
    public void createSetting(){
        List<User> userList = userService.findAll();

        for(User user :userList){
            System.out.println("ID："+user.getId()+"用户名："+user.getUsername());
            int i = userSettingService.create(user.getId());
            if(i > 0){
                System.out.println(user.getUsername()+"插入成功");
            }else {
                System.err.println(user.getUsername()+"插入失败");
            }
        }
    }
}
