package com.youren.bbs.service;

import com.youren.bbs.entity.User;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface UserService {
    Map<String, Object> register(String username, String password, String sex, String email,int age, String tel,String EvalidCode,String  validCode);
    Map<String, Object> login(String username, String password);
    Map<String, Object> adminlogin(String username, String password);

    int update(Long uid,String nickname,String username, String sex, String email, Integer age, String tel,
               String synopsis);

    int updateThumbnail(String thumbnail,Long uid);

    int delete(Long id);

    int restore(Long id);

    User findById(Long id);

    List<User> findAll();

    List<User> findByKeyword( String Field,String keyword);

    int updatepassword(Long uid, String password,String newPassword);

}
