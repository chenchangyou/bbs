package com.youren.bbs.controller.user;


import com.youren.bbs.dao.UserSettingDao;
import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserSetting;
import com.youren.bbs.service.UserService;
import com.youren.bbs.service.UserSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserSettingController {

    @Autowired
    private UserSettingService userSettingService;

    @Autowired
    private UserSettingDao userSettingDao;

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

    //保存用户的设置
    @ResponseBody
    @PostMapping("/saveUserSetting")
    public void saveUserSetting(Long uid,String sname,String state){
        UserSetting userSetting = userSettingService.jpafindByUid(uid);

       switch (sname){
           case "collect":
               userSetting.setCollect(state);
               break;
           case "followed":
               userSetting.setFollowed(state);
               break;
           case "fans":
               userSetting.setFans(state);
               break;
           case "sex":
               userSetting.setSex(state);
               break;
           case "usetting":
               userSetting.setUsetting(state);

       }
        UserSetting setting = userSettingDao.save(userSetting);

    }
}
