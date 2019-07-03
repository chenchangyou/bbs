package com.youren.bbs.service;

import com.youren.bbs.entity.UserSetting;

public interface UserSettingService {
    int create(Long uid);
    int updatecollect (Long pid,String state);
    int updatefollowed (Long pid,String state);
    int updatefans (Long pid,String state);
    int updatesex (Long pid,String state);
    UserSetting findByUid(Long uid);
    UserSetting jpafindByUid(Long uid);
    UserSetting updateUserSetting(String id,Long userId,String collect,String followed,String fans,String sex,String usetting);
    UserSetting save(UserSetting userSetting);
}
