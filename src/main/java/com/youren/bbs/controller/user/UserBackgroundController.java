package com.youren.bbs.controller.user;


import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserBackground;
import com.youren.bbs.service.UserBackgroundService;
import com.youren.bbs.util.Constant;
import com.youren.bbs.util.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/upload/")
public class UserBackgroundController {

    @Autowired
    private UserBackgroundService userBackgroundService;

    /**
     * 用户主页背景的更换
     * @param file 上传的文件
     * @throws IOException
     */
    @ResponseBody
    @PostMapping("updatebg")
    public Map<String,Object> updatebg(MultipartFile file, HttpSession session) throws IOException {
        User user = (User)session.getAttribute("loginUser");

        int state = 0;

        Map<String,Object> map = new HashMap<String, Object>();
        Map<String, String> imgmap = new HashMap<String, String>();
            String newName = UploadFileUtil.files(file);
            File saveFile = new File(Constant.POST_USERBACKGROUND_SAVE_PATH + newName);
        if(user!=null){
            UserBackground byUid = userBackgroundService.findByUid(user.getId());
                if(byUid!=null){
                    int update = userBackgroundService.update(user.getId(), Constant.POST_USERBACKGROUND_PATH + newName);
                    if(update>0){
                        File deletefile = new File(Constant.CONSTANT_DELETE_PATH + byUid.getUrl());


                        deletefile.delete();
                        map.put("msg","OK");
                        state = 1;
                    }else {
                        map.put("msg","NO");
                        state = 0;
                    }
                }else {
                    int save = userBackgroundService.save(user.getId(), Constant.POST_USERBACKGROUND_PATH + newName);
                    if(save>0){
                        state = 1;
                    }else {
                        state = 0;
                    }
                }
            if(!saveFile.exists()&&!saveFile.isDirectory()) {
                saveFile.mkdirs();
            }
            file.transferTo(saveFile);
        }else {
            map.put("msg","未登录");
            state = 2;
        }
        imgmap.put("src",Constant.POST_USERBACKGROUND_PATH + newName);
        map.put("data", imgmap);
        map.put("state",state);
        return map;
    }
}
