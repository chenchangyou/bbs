package com.youren.bbs.dao;

import com.youren.bbs.entity.Category;

import java.util.List;

public interface CategoryDao {
    int create(Category category);
    int delete(long id);
    Category findById(long id);
    List<Category> findAll();
}
