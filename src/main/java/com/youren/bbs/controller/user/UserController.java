package com.youren.bbs.controller.user;

import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserBackground;
import com.youren.bbs.entity.UserSetting;
import com.youren.bbs.mapper.UserMapper;
import com.youren.bbs.mapper.UserSettingMapper;
import com.youren.bbs.service.UserBackgroundService;
import com.youren.bbs.service.UserService;
import com.youren.bbs.util.Constant;
import com.youren.bbs.util.UploadFileUtil;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserBackgroundService userBackgroundService;
    @Autowired
    private UserSettingMapper userSettingMapper;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private Configuration configuration;
    @Autowired
    private UserMapper userMapper;

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/success")
    public String success(){
       return "/chenggong";
    }
    @GetMapping("/Retrieve")
    public String Retrieve(){
        return "Retrieve";
    }
    //注册
    @ResponseBody
    @PostMapping("/register")
    public  Map<String, Object> register(String username, String password, String sex, String email, Integer age, String tel,
                            RedirectAttributes redirectAttributes,HttpSession session,String validCode) {

        String validCode1 = (String)session.getAttribute("validCode");
        Map<String, Object> resultMap = userService.register(username, password, sex, email, age, tel,validCode,validCode1);
        if ((Boolean) resultMap.get("ok")) {

            Map<String, Object> loginMap = userService.login(username, password);
            session.setAttribute("loginUser", loginMap.get("user"));
            redirectAttributes.addFlashAttribute("message", "注册成功！请登录！");
        }
        return resultMap;
    }

    /**
     *  登录
     */
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

    /**
     * 退出登录
     */
    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    /**
     * 跳转到用户中心
     * @param uid userID
     */
    @GetMapping("/index")
    public String index(Long uid, Model model) {

            User byId = userService.findById(uid);

            UserBackground userBgByuid = userBackgroundService.findByUid(uid);

            model.addAttribute("setting", getSetting(uid));
            model.addAttribute("userbg",userBgByuid);
            model.addAttribute("user",byId);
        return "/user/HomePage";

    }

    /**
     * 更用户的头像
     * @param file 上传头像
     * @throws IOException 保存异常
     */
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
        //获取新的文件名
        String newName = UploadFileUtil.files(file);

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

    //跳转修改页
    @GetMapping("/update")
    public String update(Long uid,Model model){
        User user = userService.findById(uid);

        model.addAttribute("user",user);

        return "/user/updateuser";
    }

    //修改个人信息
    @ResponseBody
    @PostMapping("/update")
    public int update(Long uid,String nickname,String username, String sex, String email, Integer age, String tel,
                      String synopsis){
        int row = userService.update(uid, nickname, username, sex, email, age, tel, synopsis);

        return row;
    }
    //修改密码
    @ResponseBody
    @PostMapping("/updatepassword")
    public int updatepassword(HttpSession session, Long uid,String password,String newPassword){

        int i = userService.updatepassword(uid, password, newPassword);
        if (i>0){
            session.invalidate();
        }
        return i;
    }
    //删除用户
    @ResponseBody
    @PostMapping("/delete")
    public int delete(Long id){

        return userService.delete(id);
    }

    //恢复用户
    @ResponseBody
    @PostMapping("/restore")
    public int restore(Long id){

        return userService.restore(id);
    }

    private UserSetting getSetting(Long uid){

        UserSetting setting = userSettingMapper.findByUid(uid);

        return setting;
    }
    @ResponseBody
    @PostMapping("/reset")
    public Map<String,Object> resetPassword(HttpSession session,String username, String newPassword,String validCode){

        String validCode1 = (String) session.getAttribute("validCode");
        User byUsername = userMapper.findByUsername(username);

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("ok",false);
        if(validCode!=null&&!validCode.equals("")){
          if(validCode1.equals(validCode)){
            if(newPassword!=null&&!newPassword.equals("")){
                if(!newPassword.equals(byUsername.getPassword())){
                    int row = userService.updatepassword(byUsername.getId(), byUsername.getPassword(), newPassword);
                    if(row > 0){
                        map.put("ok",true);
                    }else {
                        map.put("error","修改失败，系统出错");
                    }
                }else {
                    map.put("error","修改失败，与之前的密码一致");
                }
            }else {
                map.put("error","密码不能为空");
            }
            }else {
                map.put("error","验证码不正确");
            }
        }else {
            map.put("error","验证码不能为空");
        }
        return map;
    }
}
