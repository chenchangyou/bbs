package com.youren.bbs.dao;

import com.youren.bbs.entity.Reply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {
    int create(Reply reply);
    int delete(long id);
    Reply findById(long id);
    List<Reply> findByPostId(long postId);
}
