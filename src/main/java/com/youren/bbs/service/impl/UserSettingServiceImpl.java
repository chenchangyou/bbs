package com.youren.bbs.service.impl;

import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserSetting;
import com.youren.bbs.mapper.UserSettingMapper;
import com.youren.bbs.service.UserSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class UserSettingServiceImpl implements UserSettingService {

    @Autowired
    private UserSettingMapper userSettingMapper;

    @Override
    public int create(Long uid) {

        UserSetting userSetting = new UserSetting();
        userSetting.setId(UUID.randomUUID().toString());
        userSetting.setCollect("true");
        userSetting.setFans("true");
        userSetting.setFollowed("true");
        userSetting.setSex("true");
        User user = new User();
        user.setId(uid);
        userSetting.setUid(user);

        System.out.println(userSetting);
        return userSettingMapper.create(userSetting);
    }

    @Override
    public int updatecollect(Long uid,String state) {
        UserSetting userSetting = userSetting(uid);
        userSetting.setCollect(state);
        return userSettingMapper.updatecollect(userSetting);
    }

    @Override
    public int updatefollowed(Long uid,String state) {
        UserSetting userSetting = userSetting(uid);
        userSetting.setFollowed(state);
        return userSettingMapper.updatefollowed(userSetting);
    }

    @Override
    public int updatefans(Long uid,String state) {
        UserSetting userSetting = userSetting(uid);
        userSetting.setFans(state);
        return userSettingMapper.updatefans(userSetting);
    }

    @Override
    public int updatesex(Long uid,String state) {
        UserSetting userSetting = userSetting(uid);
        userSetting.setSex(state);
        return userSettingMapper.updatesex(userSetting);
    }

    @Override
    public UserSetting findByUid(Long uid) {

        return userSettingMapper.findByUid(uid);
    }
    private UserSetting userSetting(Long uid){
        UserSetting userSetting = new UserSetting();
        User user = new User();

        user.setId(uid);
        userSetting.setUid(user);
        return userSetting;
    }
}
