package com.youren.bbs.service;


import com.youren.bbs.entity.AlbumCategory;

import java.util.List;

public interface AlbumCategoryService {

    AlbumCategory save(Long uid,String name);
    void delete(String id);
    AlbumCategory update(String id,String name);
    List<AlbumCategory> findByUserId(Long uid);
}
