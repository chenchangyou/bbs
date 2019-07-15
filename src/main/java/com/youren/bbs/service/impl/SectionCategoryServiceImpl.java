package com.youren.bbs.service.impl;


import com.youren.bbs.entity.SectionCategory;
import com.youren.bbs.service.SectionCategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SectionCategoryServiceImpl implements SectionCategoryService {
    @Override
    public SectionCategory save(String sname, String cname) {
        return null;
    }

    @Override
    public SectionCategory update(String sname, String id) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public List<SectionCategory> findBySection(String sectionId) {
        return null;
    }
}
