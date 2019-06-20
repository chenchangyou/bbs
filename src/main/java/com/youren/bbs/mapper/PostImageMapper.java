package com.youren.bbs.mapper;

import com.youren.bbs.entity.PostImage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostImageMapper {

    int save(PostImage postImge);
    int delete(String id);
    List<PostImage> findAllByPid (Long pid);

}
