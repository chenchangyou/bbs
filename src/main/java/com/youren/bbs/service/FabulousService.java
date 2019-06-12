package com.youren.bbs.service;

import com.youren.bbs.entity.Fabulous;


public interface FabulousService {
    int create(Long pid,Long uid);
    int delete(Long id);
    Fabulous findByPidUid(Long pid,Long uid);
}
