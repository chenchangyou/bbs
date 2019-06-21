package com.youren.bbs.service;

import com.youren.bbs.entity.UserBackground;


public interface UserBackgroundService {

    int save(Long uid,String url);

    int delete (String id);

    int deleteByUid (Long uid);

    int update(Long uid, String url);

    UserBackground findByUid(Long uid);

}
