package com.youren.bbs.controller.admin;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.NoticeService;
import com.youren.bbs.service.PostService;
import com.youren.bbs.service.ReplyService;
import com.youren.bbs.service.UserService;
import lombok.extern.flogger.Flogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.management.StandardEmitterMBean;
import javax.servlet.http.HttpSession;
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

    @Autowired
    private ReplyService replyService;

    @GetMapping("/")
    public String admin(){
        return "/admin/adminlogin";
    }

    @ResponseBody
    @PostMapping("/login")
    public  Map<String, Object> adminlogin(String adname, String password, HttpSession session){

        Map<String, Object> adminlogin = userService.adminlogin(adname, password);
        if ((Boolean) adminlogin.get("ok")) {
            //把登录成功后的用户对象保存到session中
            session.setAttribute("loginAdmin", adminlogin.get("user"));
            return adminlogin;
        } else {
            return adminlogin;
        }
    }
    @GetMapping("/out")
    public String adminout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/";
    }
    //跳转
    @GetMapping("/index")
    public String admin(Model model){
        List<Notice> noticeList = noticeService.findAll();
        model.addAttribute("noticeList",noticeList);
        return "/admin/index";
    }

    /**
     * 站内所有帖子
     * @param pageNum 页数
     * @param pageSize 一页条数
     * @return JSON格式数据
     */
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

    //跳转
    @GetMapping("/post")
    public String post(){
        return "/admin/adminpost";
    }

    /**
     * 站内所有用户
     * @param pageNum 页数
     * @param pageSize 一页条数
     * @return JSON格式数据
     */
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
    //跳转
    @GetMapping("/user")
    public String user(){
        return "/admin/adminuser";
    }
    //跳转
    @GetMapping("/indexs")
    public String indexs(){
        return "adminSystem/index";
    }
    //跳转
    @GetMapping("main")
     public String main(){

        return "/adminSystem/main";
    }

    @ResponseBody
    @GetMapping("/getUserNum")
    public int findUserNum(){
        List<User> list = userService.findAll();

        return list.size();
    }
    @ResponseBody
    @GetMapping("/getPostNum")
    public int findPostNum(){
        List<Post> list = postService.findAll();
        return list.size();
    }

    @ResponseBody
    @GetMapping("/getReplyNum")
    public int findReplyNum(){

        List<Reply> replyList = replyService.findAll();
        return replyList.size();
    }
    @ResponseBody
    @GetMapping("/getToday")
    public int getToday(){
        List<Post> allByToDay = postService.findAllByToDay();
        return allByToDay.size();

    }

    @ResponseBody
    @GetMapping("/findHighest")
    public List<Post> findHighest(){

        List<Post> postList = postService.findAllByPopular();
        return postList;
    }
    @ResponseBody
    @GetMapping("/findBykeyword")
    public Map<String,Object> findBykeyword(String field,String keyword,
            @RequestParam(name = "page",defaultValue = "1") int pageNum,
                                            @RequestParam(name = "limit",defaultValue = "10") int pageSize){

        Map<String,Object> usermap = new HashMap<String, Object>();

        //开始分页，在执行这个方法后，下一个数据库的查询操作，将会被拦截，加上分页语句
        PageHelper.startPage(pageNum, pageSize);

        List<User> byKeyword = userService.findByKeyword(field, keyword);

        PageInfo<User> page = new PageInfo<User>(byKeyword);

        usermap.put("code",0);
        usermap.put("msg","");
        usermap.put("count",page.getTotal());
        usermap.put("data",page.getList());

        return usermap;
    }

    @ResponseBody
    @GetMapping("/bypostkeyword")
    public Map<String,Object> bypostkeyword(String field,String keyword,
                                            @RequestParam(name = "page",defaultValue = "1") int pageNum,
                                            @RequestParam(name = "limit",defaultValue = "10") int pageSize){

        Map<String,Object> postmap = new HashMap<String, Object>();

        PageHelper.startPage(pageNum, pageSize);
        List<Post> postList = postService.ByKeyword(field, keyword);
        PageInfo<Post> page = new PageInfo<Post>(postList);

        postmap.put("code",0);
        postmap.put("msg","");
        postmap.put("count",page.getTotal());
        postmap.put("data",page.getList());
        return postmap;
    }


}
