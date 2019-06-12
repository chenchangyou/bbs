package com.youren.bbs.controller.admin;


import com.youren.bbs.entity.Notice;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.NoticeService;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @GetMapping("/index")
    public String admin(Model model){
        List<Notice> noticeList = noticeService.findAll();
        model.addAttribute("noticeList",noticeList);
        return "/admin/index";
    }

    @ResponseBody
    @GetMapping("/findAll")
    public Map findAll(){
        Map<String,Object> map = new HashMap<String, Object>();

        List<Notice> noticeList = noticeService.findAll();
        int count = noticeList.size();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",noticeList);
        return map;

    }

    //添加公告
    @ResponseBody
    @PostMapping("/add")
    public String addNotice(String title,String content,Model model){
        int row = noticeService.create(title, content);
        if(row > 0) {
            return "OK";
        }else {
            return "NO";
        }
    }
    @ResponseBody
    @GetMapping("/postlist")
    public Map postlist(){
        Map<String,Object> postmap = new HashMap<String, Object>();
        List<Post> postList = postService.findAll();
        int count = postList.size();
        postmap.put("code",0);
        postmap.put("msg","");
        postmap.put("count",count);
        postmap.put("data",postList);
        return postmap;
    }
    @GetMapping("/post")
    public String post(){
        return "/admin/adminpost";
    }


    @ResponseBody
    @GetMapping("/userlist")
    public Map userlist(){
        Map<String,Object> usermap = new HashMap<String, Object>();
        List<User> userList = userService.findAll();
        int count = userList.size();
        usermap.put("code",0);
        usermap.put("msg","");
        usermap.put("count",count);
        usermap.put("data",userList);
        return usermap;
    }
    @GetMapping("/user")
    public String user(){
        return "/admin/adminuser";
    }

}
