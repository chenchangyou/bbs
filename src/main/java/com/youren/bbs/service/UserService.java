package com.youren.bbs.service;

import com.youren.bbs.entity.User;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface UserService {
    Map<String, Object> register(String username, String password, String sex, String email,int age, String tel);
    Map<String, Object> login(String username, String password);

    int update(User user);

    int updateThumbnail(String thumbnail,Long uid);

    int delete(Long id);

    User findById(Long id);
    List<User> findAll();
}
