package com.youren.bbs.controller;


import com.youren.bbs.entity.Section;
import com.youren.bbs.entity.SectionCategory;
import com.youren.bbs.service.SectionCategoryService;
import com.youren.bbs.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    @PostMapping("/addSection")
    public Section addSection(String cname){
        return sectionService.save(cname,1L);
    }


    @ResponseBody
    @GetMapping("/getAllSection")
    public List<Section> findAll(){

        return sectionService.findAll();
    }

    @ResponseBody
    @PostMapping("/addcategory")
    public SectionCategory addcategory(String cname,String sectionId){

    return sectionCategoryService.save(cname,sectionId);
    }
    @GetMapping("/sectionCategory")
    public String sectionCategory(String id, Model model){

        Section section = sectionService.findById(id);

        model.addAttribute("section",section);
        return "/admin/adminSectionCategory";
    }
}
