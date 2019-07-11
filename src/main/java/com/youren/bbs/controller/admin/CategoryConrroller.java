package com.youren.bbs.controller.admin;


import com.youren.bbs.entity.Category;
import com.youren.bbs.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 贴子类别（添加\修改\删除）
 */
@Controller
@RequestMapping("/admin/category/")
public class CategoryConrroller {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public String category(){
        return "admin/admincategory";
    }

    @ResponseBody
    @GetMapping("list")
    public Map categorylist(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Category> categoryList = categoryService.findAll();

        map.put("code",0);
        map.put("msg","");
        map.put("data",categoryList);

        return map;
    }
    @ResponseBody
    @PostMapping("add")
    public int add(String cname){
        int row = categoryService.create(cname);
        return row;
    }
}
