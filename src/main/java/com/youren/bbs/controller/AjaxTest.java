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
    @RequestMapping("/upload")
    public Map<String,Object> upload(MultipartFile file)  throws IOException {

        Map<String,Object> map = new HashMap<String, Object>();
        Map<String,String> imgmap = new HashMap<String, String>();
            String paht = "D:\\uploads\\file\\";
            String newpaht = null;
            String originalFilename = file.getOriginalFilename();
            //获取上传文件的后缀名
            String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
            //新文件名
            String newName = System.currentTimeMillis() + suffix;
            //本地的文件
            File saveFile = new File(paht + newName);
            //把上传的文件保存到本地磁盘文件
            file.transferTo(saveFile);
            newpaht = paht+newName;
            imgmap.put("src",newpaht);

            map.put("code",0);
            map.put("msg","");
            map.put("data",imgmap);

        return map;

    }
}
