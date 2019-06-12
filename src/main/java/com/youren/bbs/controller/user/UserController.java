package com.youren.bbs.controller.user;

import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("register")
    public String register(){
        return "register";
    }

    @GetMapping("login")
    public String login(){
        return "login";
    }

    @PostMapping("register")
    public String register(String username, String password, String sex, String email,Integer age, String tel,
                           Map<String, Object> map, RedirectAttributes redirectAttributes){
        Map<String, Object> resultMap = userService.register(username,password,sex,email,age,tel);
        if((Boolean) resultMap.get("ok")){
            redirectAttributes.addFlashAttribute("message", "注册成功！请登录！");
            return "chenggong";
        }else{
            map.put("error", resultMap.get("error"));
            return "register";
        }
    }

    @ResponseBody
    @PostMapping("login")
    public Map login(String username, String password, HttpSession session){
        Map<String, Object> resultMap = userService.login(username, password);
        if((Boolean) resultMap.get("ok")){
            //把登录成功后的用户对象保存到session中
            session.setAttribute("loginUser", resultMap.get("user"));
            return resultMap;
        }else{
            return resultMap;
        }
    }
    @GetMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/index")
    public String index(){
        return "/user/index";
    }
}
