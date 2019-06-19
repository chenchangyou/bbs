package com.youren.bbs.service;

import com.youren.bbs.entity.PostImge;

import java.util.List;

public interface PostImageService {

    int save(Long pid,String url);
    int delete(String id);
    List<PostImge> findAllByPid (Long pid);

}
