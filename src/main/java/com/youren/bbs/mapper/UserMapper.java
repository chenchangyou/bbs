package com.youren.bbs.mapper;

import com.youren.bbs.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int create(User user);
    int update(User user);
    int updateThumbnail(User user);
    int delete(long id);
    User findById(Long id);
    User findByUsername(String username);
    List<User> findAll();
    int updatepassword(User user);
}
