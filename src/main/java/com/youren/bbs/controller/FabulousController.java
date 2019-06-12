package com.youren.bbs.controller;


import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.service.FabulousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 点赞的方法
 */
@Controller
@RequestMapping("/user/")
public class FabulousController {

    @Autowired
    private FabulousService fabulousService;


    @ResponseBody
    @PostMapping("fabulous")
    public int click(Long pid,Long uid){

        Fabulous fabulous = fabulousService.findByPidUid(pid, uid);

        if(fabulous!=null && !fabulous.equals("")){
            int row = fabulousService.create(pid, uid);
            return 1;
        }else {
            int row = fabulousService.delete(fabulous.getId());
            return 0;
        }
    }

}
