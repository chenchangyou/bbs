package com.youren.bbs.controller;


import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.service.FabulousService;
import com.youren.bbs.service.PostService;
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

    @Autowired
    private PostService postService;

    @ResponseBody
    @PostMapping("fabulous")
    public int click(Long pid, Long uid) {

        Fabulous fabulous = fabulousService.findByPidUid(pid, uid);

        if (fabulous != null) {//不为空，则点过赞了就删除记录
            int row = fabulousService.delete(fabulous.getPid(), fabulous.getUid());
            
            return 0;
        } else {//没点过赞则添加记录
            int row = fabulousService.create(pid, uid);
            return 1;
        }
    }

}
