package com.youren.bbs.dao;

import com.youren.bbs.entity.SectionCategory;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SectionCategoryDao extends CrudRepository<SectionCategory, String> {
        List<SectionCategory> findBySectionId(String id);
}
