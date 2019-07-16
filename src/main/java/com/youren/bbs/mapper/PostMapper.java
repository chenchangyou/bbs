package com.youren.bbs.mapper;

import com.youren.bbs.entity.Post;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.persistence.Column;
import java.util.List;

@Repository
public interface PostMapper {
    int create(Post post);
    int update(Post post);
    int updateState(Post post);
    Post findById(Long id);
    List<Post> findByUserId(Long userId);
    List<Post> findAll();
    List<Post> findAllByToDay();
    int updatebrowse(Post post);
    int updatedifference(Post post);
    int updateawesome(Post post);
    int updatereplynumber(Post post);
    int updateCollectCount(Post post);
    List<Post> findByKeyWord(@Param("keyword") String keyword);
    List<Post> ByKeyWord(@Param("field") String Field,@Param("keyword") String keyword);
    List<Post> findAllByPopular();
}
