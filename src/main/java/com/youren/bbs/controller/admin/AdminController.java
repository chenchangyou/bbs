package com.youren.bbs.controller.admin;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.NoticeService;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public Map postlist(@RequestParam(name = "page",defaultValue = "1") int pageNum,
                        @RequestParam(name = "limit",defaultValue = "10") int pageSize){
        Map<String,Object> postmap = new HashMap<String, Object>();
        PageHelper.startPage(pageNum, pageSize);

        List<Post> postList = postService.findAll();

        PageInfo<Post> page = new PageInfo<Post>(postList);

        postmap.put("code",0);
        postmap.put("msg","");
        postmap.put("count",page.getTotal());
        postmap.put("data",page.getList());
        return postmap;
    }
    @GetMapping("/post")
    public String post(){
        return "/admin/adminpost";
    }


    @ResponseBody
    @GetMapping("/userlist")
    public Map userlist(@RequestParam(name = "page",defaultValue = "1") int pageNum,
                        @RequestParam(name = "limit",defaultValue = "10") int pageSize){
        Map<String,Object> usermap = new HashMap<String, Object>();

        //开始分页，在执行这个方法后，下一个数据库的查询操作，将会被拦截，加上分页语句
        PageHelper.startPage(pageNum, pageSize);

        List<User> userList = userService.findAll();

        PageInfo<User> page = new PageInfo<User>(userList);

        usermap.put("code",0);
        usermap.put("msg","");
        usermap.put("count",page.getTotal());
        usermap.put("data",page.getList());
        return usermap;
    }
    @GetMapping("/user")
    public String user(){
        return "/admin/adminuser";
    }

}
