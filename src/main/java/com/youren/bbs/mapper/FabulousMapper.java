package com.youren.bbs.mapper;

import com.youren.bbs.entity.Fabulous;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FabulousMapper {
    int create(Fabulous fabulous);
    int delete(Fabulous fabulous);
    Fabulous findByPidUid(Fabulous fabulous);
    List<Fabulous> findBypid(Long pid);
    Integer findnumber(Long pid);//统计该帖子获赞数量
}
