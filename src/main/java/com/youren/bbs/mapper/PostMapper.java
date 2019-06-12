package com.youren.bbs.mapper;

import com.youren.bbs.entity.Post;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostMapper {
    int create(Post post);
    int update(Post post);
    int updateState(Post post);
    Post findById(long id);
    List<Post> findByUserId(long userId);
    List<Post> findAll();
    int updatebrowse(Post post);
    int updatedifference(Post post);
    int updateawesome(Post post);
    int updatereplynumber(Post post);
}
