package com.youren.bbs.service;

import com.youren.bbs.entity.Collect;
import com.youren.bbs.entity.User;

import java.util.List;
import java.util.Map;


public interface CollectService {
    int create(Long pid, Long uid);
    int delete(Long id);
    Collect findByPidUid(Long pid, Long uid);
    List<Collect> findByUid(Long uid);
    Integer findNumber(Long pid); //统计该贴的收藏量
    int judgeCollect(Long pid, Long uid);//判断是否收藏
    Map<String,Object> collectmap(Long pid, User user);
}
