package com.youren.bbs.service.impl;

import com.youren.bbs.dao.UserSettingDao;
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
    @Autowired
    private UserSettingDao userSettingDao;

    @Override
    public int create(Long uid) {

        UserSetting userSetting = new UserSetting();
        userSetting.setId(UUID.randomUUID().toString());
        userSetting.setCollect("true");
        userSetting.setFans("true");
        userSetting.setFollowed("true");
        userSetting.setSex("true");
        userSetting.setUsetting("true");
        User user = new User();
        user.setId(uid);
        userSetting.setUser(user);

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
    public UserSetting jpafindByUid(Long uid) {
        UserSetting userSetting = userSettingDao.findByUserId(uid);
        return userSetting;
    }
    private UserSetting userSetting(Long uid){
        UserSetting userSetting = new UserSetting();
        User user = new User();

        user.setId(uid);
        userSetting.setUser(user);
        return userSetting;
    }

    @Override
    public UserSetting updateUserSetting(String id, Long userId, String collect, String followed, String fans, String sex,String usetting) {

        UserSetting userSetting = userSetting(userId);
        userSetting.setId(id);
        userSetting.setCollect(collect);
        userSetting.setFollowed(followed);
        userSetting.setFans(fans);
        userSetting.setSex(sex);
        userSetting.setUsetting(usetting);

        UserSetting save = userSettingDao.save(userSetting);

        return userSetting;
    }
    //保存设置
    @Override
    public UserSetting save(UserSetting userSetting) {
        UserSetting setting = userSettingDao.save(userSetting);
        return setting;
    }

    @Override
    public UserSetting findByUid(Long uid) {

        return userSettingMapper.findByUid(uid);
    }
}
