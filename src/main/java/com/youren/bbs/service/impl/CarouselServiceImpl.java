package com.youren.bbs.service.impl;

import com.youren.bbs.dao.CarouselDao;
import com.youren.bbs.entity.Carousel;
import com.youren.bbs.service.CarouselSrevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class CarouselServiceImpl implements CarouselSrevice {

    @Autowired
    private CarouselDao carouselDao;


    @Override
    public List<Carousel> findAl() {
        List<Carousel> carousels = (List<Carousel>)carouselDao.findAll();
        return carousels;
    }

    @Override
    public Carousel add(String url) {

        Carousel carousel = new Carousel();
        carousel.setId(UUID.randomUUID().toString());
        carousel.setCreateTime(new Date());
        carousel.setState(1);
        carousel.setUrl(url);

        return carouselDao.save(carousel);
    }
}
