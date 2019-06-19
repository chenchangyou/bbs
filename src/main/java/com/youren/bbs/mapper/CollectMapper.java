package com.youren.bbs.mapper;

import com.youren.bbs.entity.Collect;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectMapper {
    int create(Collect collect);
    int delete(Collect collect);
    Collect findByPidUid(Collect collect); //用于判断用户是否收藏了该贴（判断结果集是否为空）
    List<Collect> findByuid(Long uid); //用户的收藏列表
    Integer findNumber(Long pid); //统计帖子的收藏数量
}
