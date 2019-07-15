package com.youren.bbs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.youren.bbs.entity.Post;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 帖子搜索及分页
 */

@Controller
@RequestMapping("/post/searchResult")
public class SearchResultController {

    @Autowired
    private PostService postService;


    @GetMapping("/")
    public String searchResult(String keyword, Model model,@RequestParam(name = "page",defaultValue = "1") int pageNum,
                               @RequestParam(name = "limit",defaultValue = "10") int pageSize){

        Map<String,Object> map = new HashMap<String, Object>();

        PageHelper.startPage(pageNum, pageSize);

        List<Post> byKeyWord = postService.findByKeyWord(keyword);

        PageInfo<Post> page = new PageInfo<Post>(byKeyWord);

        map.put("cont",page.getTotal());
        map.put("keyword",keyword);
        map.put("byKeyWord",page.getList());
        model.addAttribute("keywordMap",map);
        return "/searchResult";
    }
    @ResponseBody
    @PostMapping("/bykeyword")
    public Map<String,Object> bykeyword(String keyword,@RequestParam(name = "page",defaultValue = "1") int pageNum,
                                        @RequestParam(name = "limit",defaultValue = "10") int pageSize){

        Map<String,Object> map = new HashMap<String, Object>();

        PageHelper.startPage(pageNum, pageSize);

        List<Post> byKeyWord = postService.findByKeyWord(keyword);

        PageInfo<Post> page = new PageInfo<Post>(byKeyWord);

        map.put("keyword",keyword);
        map.put("date",page.getList());
        map.put("cont",page.getPages());

        return map;
    }
}
