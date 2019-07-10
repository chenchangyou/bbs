package com.youren.bbs.controller.user;


import com.youren.bbs.entity.AlbumCategory;
import com.youren.bbs.service.AlbumCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user/albumCategory/")
public class AlbumCategoryController {

    @Autowired
    private AlbumCategoryService albumCategoryService;


    @ResponseBody
    @PostMapping("add")
    public AlbumCategory add(Long uid,String name){

        AlbumCategory albumCategory = albumCategoryService.save(uid, name);

        return albumCategory;
    }
}
