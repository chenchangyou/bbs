package com.youren.bbs.mapper;

import com.youren.bbs.entity.Followed;

import java.util.List;

public interface FollowedMapper {
    int create(Followed followed);//添加
    int delete(Followed followed);//删除
    Followed findByFUidUid(Followed followed); //用于判断用户是否关注了该用户（判断结果集是否为空）
    List<Followed> findByUid(Long uid); //用户的关注列表
    List<Followed> findByFuid(Long fuid); //用户的粉丝列表
    Integer findNumber(Long fuid); //统计用户的关注数量
    Integer findFans(Long uid); //统计用户的粉丝数量
}
