package com.youren.bbs.controller;

import com.youren.bbs.entity.Carousel;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.entity.Post;
import com.youren.bbs.service.CarouselSrevice;
import com.youren.bbs.service.NoticeServiceJpa;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


/**
 * 首页
 */
@Controller
public class HomeController {

    @Autowired
    private PostService postService;
    @Autowired
    private NoticeServiceJpa noticeServiceJpa;
    @Autowired
    private CarouselSrevice carouselSrevice;

    @GetMapping("home")
    public String home(Model model){
        List<Post> postList = postService.findAll();

        List<Notice> noticeList = noticeServiceJpa.findAll();

        List<Carousel> carouselList = carouselSrevice.findAl();

        model.addAttribute("carouselList",carouselList);
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("postlist",postList);
        return "home";
    }
}
