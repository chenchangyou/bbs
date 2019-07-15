package com.youren.bbs.service;

import com.youren.bbs.entity.SectionCategory;

import java.util.List;

public interface SectionCategoryService {

    SectionCategory save(String sname,String cname);

    SectionCategory update (String sname,String id);

    void delete (String id);

   List<SectionCategory> findBySection(String sectionId);
}
