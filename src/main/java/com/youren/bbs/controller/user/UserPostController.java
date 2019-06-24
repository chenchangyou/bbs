package com.youren.bbs.controller.user;

import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserBackground;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.UserBackgroundService;
import com.youren.bbs.service.UserService;
import com.youren.bbs.util.Constant;
import com.youren.bbs.util.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user/post/")
public class UserPostController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserBackgroundService userBackgroundService;
    @Autowired
    private PostService postService;

    @GetMapping("/list")
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


}
