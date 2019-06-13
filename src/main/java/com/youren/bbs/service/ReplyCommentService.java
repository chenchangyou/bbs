package com.youren.bbs.service;

import com.youren.bbs.entity.ReplyComment;

public interface ReplyCommentService {

    int add(long replyId,String content,long userId);

    int delete(Integer id);

    ReplyComment findById(Long id);

}
