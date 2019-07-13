package com.youren.bbs.mapper;

import com.youren.bbs.entity.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {
    int create(Category category);
    int delete(long id);
    Category findById(long id);
    List<Category> findAll();
    int update(Category category);
}
