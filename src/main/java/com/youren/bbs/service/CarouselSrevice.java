package com.youren.bbs.service;

import com.youren.bbs.entity.Carousel;

import java.util.List;

public interface CarouselSrevice {

    List<Carousel> findAl();
    Carousel add(String url);
    int delete(String id);
}
