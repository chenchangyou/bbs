package com.youren.bbs.controller.user;

import com.youren.bbs.entity.Followed;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserBackground;
import com.youren.bbs.service.FollowedService;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.UserBackgroundService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    private FollowedService followedService;


    private static User getuser(HttpSession session){
        return (User)session.getAttribute("loginUser");
    }

    @GetMapping("followed")
    public String followed(Long uid,HttpSession session,Model model){

        User user = getuser(session);
        User byId = userService.findById(user.getId());
        List<Followed> followedList = followedService.findByUid(uid);
        UserBackground byUid = userBackgroundService.findByUid(user.getId());
        model.addAttribute("followedList",followedList);
        model.addAttribute("user",byId);
        model.addAttribute("userbg",byUid);

        return "/user/myfollow";
    }
   /* @GetMapping("/list")
    public String register(Long uid,Model model) {
        List<Post> postList = postService.findByUserId(uid);
        User user = userService.findById(uid);
        UserBackground userBgByuid = userBackgroundService.findByUid(user.getId());

        model.addAttribute("userbg",userBgByuid);
        model.addAttribute("user",user);
        model.addAttribute("postlist",postList);

        return "/user/mypost";
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

*/
}
