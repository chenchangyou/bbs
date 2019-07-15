package com.youren.bbs.mapper;

import com.youren.bbs.entity.ReplyLike;
import org.springframework.stereotype.Repository;


@Repository
public interface ReplyLikeMapper {

    int save(ReplyLike replyLike);
    ReplyLike findByUidRid(ReplyLike replyLike);
    int delete(ReplyLike replyLike);
}
