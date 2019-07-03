package com.youren.bbs.controller.admin;


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
public class NoticeController {

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

//        List<Notice> noticeList = noticeService.findAll();

        List<Notice> noticeList = noticeServiceJpa.findAll();
        int count = noticeList.size();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",noticeList);
        return map;
    }

   /* //添加公告
    @ResponseBody
    @PostMapping("/add")
    public String addNotice(String title, String content, Model model){
        int row = noticeService.create(title, content);
        if(row > 0) {
            return "OK";
        }else {
            return "NO";
        }
    }
*/
    @ResponseBody
    @PostMapping("/add")
    public Notice add(Long uid,String title,String content){

        return noticeServiceJpa.save(uid,title,content);
    }
}
