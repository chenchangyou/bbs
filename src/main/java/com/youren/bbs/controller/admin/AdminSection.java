package com.youren.bbs.controller.admin;


import com.youren.bbs.entity.Section;
import com.youren.bbs.service.SectionCategoryService;
import com.youren.bbs.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin/section")
public class AdminSection {

    @Autowired
    private SectionService sectionService;

    @Autowired
    private SectionCategoryService sectionCategoryService;

    @GetMapping("/")
    public String adminSection(){
        return "/admin/adminSection";
    }

    @ResponseBody
    @GetMapping("/getSection")
    public List<Section> getSection(){
        return sectionService.findAll();
    }

    @ResponseBody
    @PostMapping("/add")
    public String add(){

        return "";
    }
}
