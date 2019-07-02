package com.youren.bbs.service.impl;

import com.youren.bbs.entity.User;
import com.youren.bbs.mapper.UserMapper;
import com.youren.bbs.mapper.UserSettingMapper;
import com.youren.bbs.service.UserService;
import com.youren.bbs.service.UserSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserSettingService userSettingService;

    //注册
    @Override
    public Map<String, Object> register(String username, String password, String sex, String email, int age, String tel) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("ok", false);
        String headshot = "static/images/user.png";//默认头像路径
        User user = userMapper.findByUsername(username);
        if (user == null) {
            user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setSex(sex);
            user.setAge(age);
            user.setEmail(email);
            user.setTel(tel);
            user.setHeadshot(headshot);
            user.setState(1);
            user.setType(1);
            user.setCreateTime(new Date());
            int row = userMapper.create(user);
            if (row > 0) {
                map.put("ok", true);
               user = userMapper.findByUsername(username);
                userSettingService.create(user.getId());
            } else {
                map.put("error", "注册失败！");

            }
        } else {
            map.put("error", "用户名已被注册！");
        }
        return map;
    }

    //登录
    @Override
    public Map<String, Object> login(String username, String password) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("ok", false);
        if (username != null && password != null && !username.equals("") && !password.equals("")) {
            User user = userMapper.findByUsername(username);
            if (user != null) {
                if (user.getPassword().equals(password)) {
                    map.put("ok", true);
                    map.put("user", user);
                } else {
                    map.put("error", "密码错误！");
                }
            } else {
                map.put("error", "用户不存在！");
            }
        } else {
            map.put("error", "请输入完整再登录");
        }
        return map;
    }

    /**
     * 修改个人信息
     */
    @Override
    public int update(Long uid,String nickname, String username, String sex, String email, Integer age, String tel,
                      String synopsis) {
        User user = new User();
        user.setId(uid);
        user.setUsername(username);
        user.setNickname(nickname);
        user.setSex(sex);
        user.setAge(age);
        user.setEmail(email);
        user.setTel(tel);
        user.setSynopsis(synopsis);

        return userMapper.update(user);
    }

    //更换用户头像
    @Override
    public int updateThumbnail(String thumbnail, Long uid) {
        User user = new User();
        user.setId(uid);
        user.setHeadshot(thumbnail);
        return userMapper.updateThumbnail(user);
    }


    @Override
    public int delete(Long id) {
        return userMapper.delete(id);
    }

    @Override
    public User findById(Long id) {
        return userMapper.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    /**
     * 更改密码
     */
    @Override
    public int updatepassword(Long uid, String password, String newPassword) {

        User user = userMapper.findById(uid);
        int state=0;
        if(user.getPassword().equals(password)){
            user.setId(uid);
            user.setPassword(newPassword);
            int row = userMapper.updatepassword(user);
            if(row > 0){
                state = 1;
            }else {
                state = 2;
            }
        }
        return state;
    }
}
