package com.youren.bbs.mapper;

import com.youren.bbs.entity.Fabulous;

import java.util.List;

public interface FabulousMapper {
    int create(Fabulous fabulous);
    int delete(Fabulous fabulous);
    Fabulous findByPidUid(Fabulous fabulous);
    List<Fabulous> findBypid(Long pid);
    Integer findnumber(Long pid);
}
