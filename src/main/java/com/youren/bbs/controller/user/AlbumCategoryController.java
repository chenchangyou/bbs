package com.youren.bbs.controller.user;


import com.youren.bbs.entity.AlbumCategory;
import com.youren.bbs.service.AlbumCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户相册
 */
@Controller
@RequestMapping("/user/albumCategory/")
public class AlbumCategoryController {

    @Autowired
    private AlbumCategoryService albumCategoryService;


    //添加相册
    @ResponseBody
    @PostMapping("add")
    public AlbumCategory add(Long uid,String name){

        return albumCategoryService.save(uid, name);
    }

    //修改用户相册状态（是否公开）
    @ResponseBody
    @PostMapping("updateState")
    public void updateState(String id,String state){
        albumCategoryService.upadteState(id,state);
    }
}
