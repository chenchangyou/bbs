package com.youren.bbs.mapper;

import com.youren.bbs.entity.Fabulous;

public interface FabulousMapper {
    int create(Fabulous fabulous);
    int delete(long id);
    Fabulous findByPidUid(Fabulous fabulous);
}
