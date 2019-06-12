package com.youren.bbs.mapper;

import com.youren.bbs.entity.Category;

import java.util.List;

public interface CategoryMapper {
    int create(Category category);
    int delete(long id);
    Category findById(long id);
    List<Category> findAll();
}
