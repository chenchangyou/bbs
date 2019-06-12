package com.youren.bbs.service;

import com.youren.bbs.entity.Notice;

import java.util.List;

public interface NoticeService {

    int create(String title,String content);
    int update(String title,String content);
    int delete(long id);
    Notice findById(long id);
    List<Notice> findAll();
}
