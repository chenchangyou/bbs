package com.youren.bbs.mapper;

import com.youren.bbs.entity.Fabulous;

public interface FabulousMapper {
    int create(Fabulous fabulous);
    int delete(Fabulous fabulous);
    Fabulous findByPidUid(Fabulous fabulous);
}
