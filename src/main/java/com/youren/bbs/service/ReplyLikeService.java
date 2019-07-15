package com.youren.bbs.service;

import com.youren.bbs.entity.ReplyLike;

public interface ReplyLikeService {

    int save(Long rid,Long uid);
    ReplyLike findByUidRid(Long rid,Long uid);
    int delete(Long rid,Long uid);
}
