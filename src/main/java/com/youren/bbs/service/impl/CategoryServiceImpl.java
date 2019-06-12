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
    private CategoryMapper categoryDao;

    @Override
    public int create(String name) {

        Category category = new Category();
        category.setName(name);

        return categoryDao.create(category);
    }

    @Override
    public int delete(long id) {
        return categoryDao.delete(id);
    }

    @Override
    public Category findById(long id) {
        return null;
    }

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }
}
