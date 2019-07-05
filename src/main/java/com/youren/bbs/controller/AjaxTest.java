package com.youren.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.youren.bbs.dao.VacationTabDao;
import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.VacationTab;
import com.youren.bbs.mapper.FabulousMapper;
import com.youren.bbs.service.FabulousService;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Ajax测试
 */
@Controller
public class AjaxTest {
    @Autowired
    private  PostService postService;

    @Autowired
    private FabulousService fabulousService;

    @Autowired
    private VacationTabDao vacationTabDao;
    @ResponseBody
    @GetMapping("/getpostlist")
    public Map home(@RequestParam(name = "page",defaultValue = "1") int pageNum,
                    @RequestParam(name = "limit",defaultValue = "5") int pageSize){

        Map<String,Object> map = new HashMap<String, Object>();

            PageHelper.startPage(pageNum, pageSize);

            List<Post>  postList = postService.findAll();

            PageInfo<Post> page = new PageInfo<Post>(postList);
        map.put("date",page.getList());
        map.put("pages",page.getPages());

        return map;
    }
    @ResponseBody
    @GetMapping("getnumber")
    public List getnumber(Long pid){
        List<Fabulous> bypid = fabulousService.findBypid(pid);
        System.out.println(bypid);
        return bypid;
    }
    @ResponseBody
    @GetMapping("getnumbers")
    public Integer getnumbers(Long pid){
        Integer count = fabulousService.findnumber(pid);
        System.out.println(count);
        return count;
    }
    @ResponseBody
    @GetMapping("/vacationTab")
    public Map<String,Object> fanAll(){

        Map<String,Object> usermap = new HashMap<String, Object>();

        List<VacationTab> tabList = vacationTabDao.findAll();
        usermap.put("code",0);
        usermap.put("msg","");
        usermap.put("data",tabList);
        return usermap;
    }
    @GetMapping("/vacation")
    public String vacationTab(){

        return "/vacation";
    }
}
