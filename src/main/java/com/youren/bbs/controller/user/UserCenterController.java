package com.youren.bbs.controller.user;

import com.youren.bbs.entity.*;
import com.youren.bbs.mapper.UserSettingMapper;
import com.youren.bbs.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserCenterController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserBackgroundService userBackgroundService;
    @Autowired
    private PostService postService;
    @Autowired
    private UserSettingMapper userSettingMapper;
    @Autowired
    private FollowedService followedService;
    @Autowired
    private CollectService collectService;
    @Autowired
    private UserSettingService userSettingService;


    private static User getuser(HttpSession session){
        return (User)session.getAttribute("loginUser");
    }

    @GetMapping("followed")
    public String followed(Long uid,HttpSession session,Model model){

       /* User user = getuser(session);
        User byId = userService.findById(user.getId());*/
        List<Followed> followedList = followedService.findByUid(uid);
        UserBackground byUid = userBackgroundService.findByUid(uid);
        User byId = userService.findById(uid);

        model.addAttribute("setting", getSetting(uid));
        model.addAttribute("followedList",followedList);
        model.addAttribute("user",byId);
        model.addAttribute("userbg",byUid);

        return "/user/myfollow";
    }
    @GetMapping("/fans")
    public String userfans(Long uid,Model model){

        User user = userService.findById(uid);
        List<Followed> fuidlist = followedService.findByFuid(uid);
        UserBackground userBackground = userBackgroundService.findByUid(uid);

        model.addAttribute("setting", getSetting(uid));
        model.addAttribute("followedList",fuidlist);
        model.addAttribute("user",user);
        model.addAttribute("userbg",userBackground);
        return "/user/myfans";
    }
    @GetMapping("/collection")
    public String usercollection(Long uid,Model model){
        User user = userService.findById(uid);
        List<Collect> collectList = collectService.findByUid(uid);
        UserBackground userBackground = userBackgroundService.findByUid(uid);

        model.addAttribute("setting", getSetting(uid));
        model.addAttribute("collectList",collectList);
        model.addAttribute("user",user);
        model.addAttribute("userbg",userBackground);
        return "/user/mycollection";
    }
    @GetMapping("/setting")
    public String setting(Long uid,Model model){
        User user = userService.findById(uid);
        UserBackground userBackground = userBackgroundService.findByUid(uid);

        model.addAttribute("setting", getSetting(uid));
        model.addAttribute("userSetting", userSettingService.findByUid(uid));
        model.addAttribute("user",user);
        model.addAttribute("userbg",userBackground);
        return "/user/setting";
    }

    private UserSetting getSetting(Long uid){

        UserSetting setting = userSettingMapper.findByUid(uid);

        return setting;
    }
}
