package com.youren.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.entity.Post;
import com.youren.bbs.mapper.FabulousMapper;
import com.youren.bbs.service.FabulousService;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    private FabulousService fabulousService;

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
    public String getnumber(Long pid){
        List<Fabulous> bypid = fabulousService.findBypid(pid);
        System.out.println(bypid);
        return "list";
    }
    @ResponseBody
    @GetMapping("getnumbers")
    public String getnumbers(Long pid){
        Fabulous findnumber = fabulousService.findnumber(pid);
        System.out.println(findnumber);
        return "list";
    }

    @PostMapping("")
    public String upload(){
    return""; 
    }
}
