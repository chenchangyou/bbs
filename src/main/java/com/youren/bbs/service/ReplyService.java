package com.youren.bbs.service;


import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.ReplyComment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReplyService {
    int create(Reply reply);
    int delete(long id);
    Reply findById(long id);
    List<Reply> findByPostId(long postId);

    Map<String,Object> postlist = new HashMap<String, Object>();

    int add(String content,long postId,long userId);
    int update(Long rid,String content);
    List<Reply> findAll();
    int updateLikeCont(Long rid,Integer likeNum);
    List<Reply> findByReply(String Field, String keyword);
}
