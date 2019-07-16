package com.youren.bbs.service.impl;


import com.youren.bbs.dao.SectionCategoryDao;
import com.youren.bbs.entity.Section;
import com.youren.bbs.entity.SectionCategory;
import com.youren.bbs.service.SectionCategoryService;
import com.youren.bbs.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class SectionCategoryServiceImpl implements SectionCategoryService {

    @Autowired
    private SectionCategoryDao sectionCategoryDao;

    @Autowired
    private SectionService sectionService;

    @Override
    public SectionCategory save(String sname, String id) {
        SectionCategory sectionCategory = new SectionCategory();
        sectionCategory.setCreateTime(new Date());
        sectionCategory.setName(sname);
        sectionCategory.setId(UUID.randomUUID().toString());
        sectionCategory.setState(1);
        Section byId = sectionService.findById(id);
        sectionCategory.setSection(byId);

        return sectionCategoryDao.save(sectionCategory);
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
        List<SectionCategory> bySectionId = sectionCategoryDao.findBySectionId(sectionId);
        return bySectionId;
    }
}
