package com.youren.bbs.service;

import com.youren.bbs.entity.Fabulous;

import java.util.List;


public interface FabulousService {
    int create(Long pid,Long uid);
    int delete(Long pid,Long uid);
    Fabulous findByPidUid(Long pid,Long uid);
    List<Fabulous> findBypid(Long pid);
    Integer findnumber(Long pid);

}
