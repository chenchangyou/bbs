package com.youren.bbs.controller.user;

import com.youren.bbs.entity.*;
import com.youren.bbs.mapper.UserSettingMapper;
import com.youren.bbs.service.AlbumCategoryService;
import com.youren.bbs.service.AlbumService;
import com.youren.bbs.service.UserBackgroundService;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @Autowired
    private UserBackgroundService userBackgroundService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserSettingMapper userSettingMapper;

    @Autowired
    private AlbumCategoryService albumCategoryService;

    @GetMapping("/")
    public String album(Long uid, Model model){

        List<AlbumCategory> albumCategoryList = albumCategoryService.findByUserId(uid);
        UserBackground byUid = userBackgroundService.findByUid(uid);
        User byId = userService.findById(uid);

        model.addAttribute("albumCategoryList",albumCategoryList);
        model.addAttribute("user",byId);
        model.addAttribute("userbg",byUid);
        return "/user/Album";
    }

    /**
     * 添加相片
     * @param uid 用户ID
     * @param url 相片链接
     * @param acid 所属相册ID
     * @return
     */
    @ResponseBody
    @PostMapping("/add")
    public Album add(Long uid ,String url,String acid){

        return albumService.save(uid,url,acid);
    }

    @ResponseBody
    @GetMapping("/list")
    public List<AlbumCategory> list(Long uid){

        List<AlbumCategory> albumCategoryList = albumCategoryService.findByUserId(uid);

        return albumCategoryList;
    }
    private UserSetting getSetting(Long uid){

        UserSetting setting = userSettingMapper.findByUid(uid);

        return setting;
    }
}
