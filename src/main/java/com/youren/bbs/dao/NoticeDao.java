package com.youren.bbs.dao;

import com.youren.bbs.entity.Notice;

import java.util.List;

public interface NoticeDao {

    int create(Notice notice);
    int update(Notice notice);
    int delete(long id);
    Notice findById(long id);
    List<Notice> findAll();

}
