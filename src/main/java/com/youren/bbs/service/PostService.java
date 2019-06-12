package com.youren.bbs.service;

import com.youren.bbs.entity.Post;

import java.util.List;

public interface PostService {
    int create(Post post);
    int update(Post post);
    int updateState(int state,long id);
    Post findById(long id);
    List<Post> findByUserId(int userId);
    List<Post> findAll();
    int updatebrowse(long postId,Integer browse);
    int updatedifference(long postId,Integer difference);
    int updateawesome(long postId,Integer awesome);
}
