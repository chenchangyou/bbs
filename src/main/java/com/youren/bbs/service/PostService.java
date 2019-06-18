package com.youren.bbs.service;

import com.youren.bbs.entity.Post;

import java.util.List;

public interface PostService {
    int create(Post post);
    int update(Post post);
    int updateState(int state,Long id);
    Post findById(Long id);
    List<Post> findByUserId(Long userId);
    List<Post> findAll();
    int updatebrowse(Long postId,Integer browse);
    int updatedifference(Long postId,Integer difference);
    int updateawesome(Long postId,Integer awesome);
    int updatereplynumber(Long postId,Integer replynumber);
    int updatecollectCount(Long postId,Integer collectCount);
}
