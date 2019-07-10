package com.youren.bbs.service;


import com.youren.bbs.entity.Album;

public interface AlbumService {
    Album save(Long uid, String url,String catename);
    void delete(String id);
}
