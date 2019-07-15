package com.youren.bbs.mapper;

import com.youren.bbs.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int create(User user);
    int update(User user);
    int updateThumbnail(User user);
    int delete(User user);
    User findById(Long id);
    User findByUsername(String username);
    List<User> findAll();
    List<User> findByKeyword(@Param("field") String Field,@Param("keyword") String keyword);
    int updatepassword(User user);

}
