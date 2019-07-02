package com.youren.bbs.mapper;

import com.youren.bbs.entity.UserSetting;
import org.springframework.stereotype.Repository;


/**
 * 更新用户设置的状态
 */
@Repository
public interface UserSettingMapper {
    int create(UserSetting userSetting);
    int updatecollect (UserSetting userSetting);
    int updatefollowed (UserSetting userSetting);
    int updatefans (UserSetting userSetting);
    int updatesex (UserSetting userSetting);
    UserSetting findByUid(Long uid);
}
