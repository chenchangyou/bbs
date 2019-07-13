package com.youren.bbs.service.impl;

import com.youren.bbs.mapper.CategoryMapper;
import com.youren.bbs.entity.Category;
import com.youren.bbs.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public int create(String name) {

        Category category = new Category();
        category.setName(name);

        return categoryMapper.create(category);
    }

    @Override
    public int delete(long id) {
        return categoryMapper.delete(id);
    }

    @Override
    public Category findById(long id) {
        return null;
    }

    @Override
    public List<Category> findAll() {
        return categoryMapper.findAll();
    }

    @Override
    public int update(Long id, String name) {
        Category category = new Category();
        category.setId(id);
        category.setName(name);

        return categoryMapper.update(category);
    }
}
