package com.youren.bbs.mapper;

import com.youren.bbs.entity.Reply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyMapper {
    int create(Reply reply);
    int delete(long id);
    Reply findById(long id);
    List<Reply> findByPostId(long postId);
    List<Reply> findAll();
    int update(Reply reply);
}
