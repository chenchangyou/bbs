package com.youren.bbs.dao;

import com.youren.bbs.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    int create(User user);
    int update(User user);
    int delete(long id);
    User findById(Long id);
    User findByUsername(String username);
    List<User> findAll();
}
