package com.youren.bbs.service;

import com.youren.bbs.entity.Category;
import com.youren.bbs.entity.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryService {

    int create(String name);

    int delete(long id);

    Category findById(long id);

    List<Category> findAll();

    int update(Long id,String name);

}
