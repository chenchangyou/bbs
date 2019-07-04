package com.youren.bbs.service;


import com.youren.bbs.entity.Notice;

import java.util.List;

public interface NoticeServiceJpa {
    Notice save(String nid, Long uid, String title, String content);
    List<Notice> findAll();
    Notice findById(String id);
}
