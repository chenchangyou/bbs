package com.youren.bbs.service;

import com.youren.bbs.entity.UserSetting;

public interface UserSettingService {
    int create(Long uid);
    int updatecollect (Long pid,String state);
    int updatefollowed (Long pid,String state);
    int updatefans (Long pid,String state);
    int updatesex (Long pid,String state);
    UserSetting findByUid(Long uid);
}
