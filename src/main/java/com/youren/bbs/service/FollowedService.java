package com.youren.bbs.service;

import com.youren.bbs.entity.Followed;
import com.youren.bbs.entity.User;

import java.util.List;
import java.util.Map;

public interface FollowedService {
    int create(Long fid, Long uid);
    int delete(Long id);
    Followed findByPidUid(Long fid, Long uid);
    List<Followed> findByUid(Long uid);
    Integer findNumber(Long fid); //统计该用户的关注量
    Integer findFuser(Long fid); //统计该用户的粉丝数量
    int judgeFollowed(Long fid, Long uid);//判断是否有关注
    Map<String,Object> followedmap(Long fid, User user);
}
