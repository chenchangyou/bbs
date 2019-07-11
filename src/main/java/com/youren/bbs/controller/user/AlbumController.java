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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户照片
 */
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

    //跳转
    @GetMapping("/")
    public String album(Long uid, Model model){

        List<AlbumCategory> albumCategoryList = albumCategoryService.findByUserId(uid);
        UserBackground byUid = userBackgroundService.findByUid(uid);
        User byId = userService.findById(uid);

        model.addAttribute("setting", getSetting(uid));
        model.addAttribute("albumCategoryList",albumCategoryList);
        model.addAttribute("user",byId);
        model.addAttribute("userbg",byUid);
        return "/user/Album";
    }

    /**
     * 添加照片
     * @param uid 用户ID
     * @param url 照片链接
     * @param acid 所属相册ID
     * @return
     */
    @ResponseBody
    @PostMapping("/add")
    public Map<String, Object> add(Long uid , String url, String acid){

        Album album = albumService.save(uid, url, acid);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("url",album.getUrl());
        map.put("id",album.getId());
        map.put("createTime",album.getCreateTime());
        return  map;
    }

    /**
     * 获取用户的相册及包含的照片
     * @param uid 用户ID
     * @return JOIN格式
     */
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

    /**
     * 删除照片
     * @param id 照片的ID
     */
    @ResponseBody
    @PostMapping("/delete")
    public void delete(String id){
        albumService.delete(id);
    }
}
