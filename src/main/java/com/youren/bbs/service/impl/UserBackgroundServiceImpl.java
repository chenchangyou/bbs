package com.youren.bbs.service.impl;

import com.youren.bbs.entity.User;
import com.youren.bbs.entity.UserBackground;
import com.youren.bbs.mapper.UserBackgroundMapper;
import com.youren.bbs.service.UserBackgroundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;


@Service
@Transactional
public class UserBackgroundServiceImpl implements UserBackgroundService {

    @Autowired
    private UserBackgroundMapper userBackgroundMapper;

    @Override
    public int save(Long uid, String url) {

        User user = new User();
        user.setId(uid);
        UserBackground userbg = new UserBackground(UUID.randomUUID().toString(),user,url);

        return userBackgroundMapper.save(userbg);
    }

    @Override
    public int delete(String id) {

        return userBackgroundMapper.delete(id);
    }

    @Override
    public int deleteByUid(Long uid) {
        User user = new User();
        user.setId(uid);
        UserBackground userBackground = new UserBackground(user);

        userBackgroundMapper.deleteByUid(userBackground);
        return 0;
    }

    @Override
    public int update(Long uid, String url) {
        User user = new User();
        user.setId(uid);
        UserBackground userBackground = new UserBackground(user);
        userBackground.setUrl(url);
        return userBackgroundMapper.update(userBackground);
    }

    @Override
    public UserBackground findByUid(Long uid) {

        User user = new User();
        user.setId(uid);
        UserBackground userbg = new UserBackground(user);

        return userBackgroundMapper.findByUid(userbg);
    }
}
