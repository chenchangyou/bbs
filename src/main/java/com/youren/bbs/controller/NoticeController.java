package com.youren.bbs.controller;


import com.youren.bbs.dao.NoticeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {


    @Autowired
    private NoticeDao noticeDao;

    @GetMapping("/detail")
    public String detail(String nid, Model model){

        model.addAttribute("notice",noticeDao.findById(nid).get());

        return "/noticedetail";
    }

}
