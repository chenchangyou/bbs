package com.youren.bbs.controller.admin;


import com.youren.bbs.entity.Carousel;
import com.youren.bbs.service.CarouselSrevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 轮播图
 */
@Controller
@RequestMapping("/admin/carousel")
public class CarouselController {

    @Autowired
    private CarouselSrevice carouselSrevice;

    @GetMapping("/")
    public String carouse(){
        return "/admin/carousel";
    }

    @ResponseBody
    @GetMapping("/list")
    public List<Carousel> list(){

        return carouselSrevice.findAl();
    }

    @ResponseBody
    @PostMapping("/add")
    public Carousel add(String url){

        Carousel carousel = carouselSrevice.add(url);

        return carousel;
    }

    @ResponseBody
    @PostMapping("/delete")
    public int delete(String id){

      return carouselSrevice.delete(id);
    }
}
