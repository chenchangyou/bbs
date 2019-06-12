package com.youren.bbs.dao;

import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostDao {
    int create(Post post);
    int update(Post post);
    int delete(long id);
    Post findById(long id);
    List<Post> findByUserId(long userId);
    List<Post> findAll();
    int updatebrowse(Post post);
    int updatedifference(Post post);
    int updateawesome(Post post);
}
