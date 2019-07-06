package com.youren.bbs.controller.admin;


import com.sun.org.apache.xpath.internal.operations.Mod;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.service.NoticeService;
import com.youren.bbs.service.NoticeServiceJpa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {

    @Autowired
    private NoticeServiceJpa noticeServiceJpa;

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/")
    public String NOticelist(){
        return "/admin/notice";
    }

    @ResponseBody
    @GetMapping("/list")
    public Map findAllNotice(){
        Map<String,Object> map = new HashMap<String, Object>();

        List<Notice> noticeList = noticeServiceJpa.findAll();
        int count = noticeList.size();
        map.put("code",0);
        map.put("count",count);
        map.put("data",noticeList);
        return map;
    }
    //添加或保存
    @ResponseBody
    @PostMapping("/add")
    public Notice add(String nid, Long uid,String title,String content){
        Notice notice = null;
        if(uid!=null&&!uid.equals("")){
           notice = noticeServiceJpa.save(nid, uid, title, content);
        }
        return notice;
    }

    @GetMapping("/edit")
    public String edit(String nid,Model model){

        if(!nid.equals("null")){
            model.addAttribute("notice",noticeServiceJpa.findById(nid));
        }

        return "/admin/noticeEdit";
    }
    @ResponseBody
    @PostMapping("/delete")
    public int delete(String nid){

        return noticeService.delete(nid);
    }

}
