package com.youren.bbs.controller.user;

import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserBackground;
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
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserBackgroundService userBackgroundService;

    @GetMapping("register")
    public String register() {
        return "register";
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

    //注册
    @PostMapping("register")
    public String register(String username, String password, String sex, String email, Integer age, String tel,
                           Map<String, Object> map, RedirectAttributes redirectAttributes,HttpSession session) {
        Map<String, Object> resultMap = userService.register(username, password, sex, email, age, tel);
        if ((Boolean) resultMap.get("ok")) {

            Map<String, Object> loginMap = userService.login(username, password);
            session.setAttribute("loginUser", loginMap.get("user"));
            redirectAttributes.addFlashAttribute("message", "注册成功！请登录！");

            return "chenggong";
        } else {
            map.put("error", resultMap.get("error"));
            return "register";
        }
    }

    @ResponseBody
    @PostMapping("login")
    public Map login(String username, String password, HttpSession session) {
        Map<String, Object> resultMap = userService.login(username, password);
        if ((Boolean) resultMap.get("ok")) {
            //把登录成功后的用户对象保存到session中
            session.setAttribute("loginUser", resultMap.get("user"));
            return resultMap;
        } else {
            return resultMap;
        }
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/index")
    public String index(HttpSession session, Model model) {

        User user = (User)session.getAttribute("loginUser");

        if(user!=null){
            User byId = userService.findById(user.getId());

            UserBackground userBgByuid = userBackgroundService.findByUid(user.getId());

            model.addAttribute("userbg",userBgByuid);
            model.addAttribute("user",byId);
        }
        return "/user/HomePage";

    }

    @ResponseBody
    @PostMapping("/uploadThumbnail")
    public Map<String, Object> upload(MultipartFile file,HttpSession session) throws IOException {
        //获取当前登录的用户
        User suser = (User)session.getAttribute("loginUser");

        User byId = userService.findById(suser.getId());


        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, String> imgmap = new HashMap<String, String>();

        //返回的提示信息
        String message = null;

        int state = 0;

        //代替下面注释的代码
        String newName = UploadFileUtil.files(file);

       /* String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String newName =  UUID.randomUUID() + suffix;*/

       //本地的文件
        File saveFile = new File(Constant.HEADSHOT_SAVE_PATH + newName);
        //获取原来的头像
        File deleteimg = new File(Constant.CONSTANT_DELETE_PATH+byId.getHeadshot());
//        System.err.println(Constant.CONSTANT_DELETE_PATH+suser.getHeadshot());
        int i = userService.updateThumbnail( Constant.HEADSHOT_PATH+newName,byId.getId());
        if(i > 0){

            if(!saveFile.exists()&&!saveFile.isDirectory()) {
                saveFile.mkdirs();
            }

            //把上传的文件保存到本地磁盘文件
            file.transferTo(saveFile);
            map.put("code", 0);
            state = 1;
            message = "保存成功！,";
            //删除原来存在本地的头像
            boolean delete = deleteimg.delete();
            if(delete){
                message += "删除原文件成功";
            }else {
                message += "删除原件失败";
            }
        }else {
          message= "保存失败！";
            state = 0;
            map.put("code", 1);
        }

        imgmap.put("src", Constant.HEADSHOT_PATH+newName);
        map.put("msg",message);
        map.put("data", imgmap);
        map.put("state",state);

        return map;
    }
}
