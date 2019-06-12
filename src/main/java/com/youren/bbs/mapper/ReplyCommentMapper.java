package com.youren.bbs.mapper;

import com.youren.bbs.entity.ReplyComment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyCommentMapper {
        int create(ReplyComment replyComment);
        int update(ReplyComment replyComment);
        int delete(Integer id);
        ReplyComment findById(Long id);
        List<ReplyComment> findAll();
        List<ReplyComment> findByUserId(long userId);
        List<ReplyComment> findByReplyId(long userId);
}
