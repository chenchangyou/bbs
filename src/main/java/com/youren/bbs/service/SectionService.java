package com.youren.bbs.service;

import com.youren.bbs.entity.Section;

import java.util.List;

public interface SectionService {

    Section save(String sname, String cname);

    Section update (String sname,String id);

    void delete (String id);

    List<Section> findAll();
}
