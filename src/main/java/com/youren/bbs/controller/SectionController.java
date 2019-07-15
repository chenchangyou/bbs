package com.youren.bbs.controller;


import com.youren.bbs.entity.Section;
import com.youren.bbs.service.SectionCategoryService;
import com.youren.bbs.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/section")
public class SectionController {

    @Autowired
    private SectionService sectionService;
    @Autowired
    private SectionCategoryService sectionCategoryService;

    @GetMapping("/")
    public String section(){
        return "section";
    }

    @GetMapping("/sectionDetail")
    public String sectionDetail(String id){

        return "sectiondetail";
    }

    @ResponseBody
    @GetMapping("/getAllSection")
    public List<Section> findAll(){

        return sectionService.findAll();
    }

}
