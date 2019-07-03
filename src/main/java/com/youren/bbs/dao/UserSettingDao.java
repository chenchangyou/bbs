package com.youren.bbs.dao;

import com.youren.bbs.entity.UserSetting;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


/**
 * 更新用户设置的状态
 */
@Repository
public interface UserSettingDao extends CrudRepository<UserSetting,String> {
            UserSetting findByUserId(Long id);
}
