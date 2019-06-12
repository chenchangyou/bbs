package com.youren.bbs.service;

public interface ReplyCommentService {

    int add(long replyId,String content,long userId);

    int delete(Integer id);

}
