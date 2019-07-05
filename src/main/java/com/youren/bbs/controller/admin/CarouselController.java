package com.youren.bbs.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 轮播图
 */
@Controller
@RequestMapping("/admin/carousel")
public class CarouselController {

    @GetMapping("/")
    public String carouse(){
        return "/admin/carousel";
    }

}
