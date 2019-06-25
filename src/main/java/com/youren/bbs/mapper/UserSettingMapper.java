package com.youren.bbs.mapper;

import com.youren.bbs.entity.UserSetting;
import org.springframework.stereotype.Repository;


/**
 * 更新用户设置的状态
 */
@Repository
public interface UserSettingMapper {
    int create(UserSetting userSetting);
//    List<UserSetting> findByuid(Long pid);
    int updatecollect (String collect);
    int updatefollowed (String followed);
    int updatefans (String fans);
    int updatesex (String sex);

}
