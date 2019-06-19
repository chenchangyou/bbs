package com.youren.bbs.mapper;

import com.youren.bbs.entity.PostImge;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostImageMapper {

    int save(PostImge postImge);
    int delete(String id);
    List<PostImge> findAllByPid (Long pid);

}
