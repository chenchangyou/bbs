package com.youren.bbs.service;

import com.youren.bbs.entity.Category;

import java.util.List;

public interface CategoryService {

    int create(String name);

    int delete(long id);

    Category findById(long id);

    List<Category> findAll();
}
