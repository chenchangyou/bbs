package com.youren.bbs.service.impl;

import com.youren.bbs.dao.SectionDao;
import com.youren.bbs.entity.Section;
import com.youren.bbs.service.SectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class SectionServiceImpl implements SectionService {

    @Autowired
    private SectionDao sectionDao;

    @Override
    public Section save(String sname, String cname) {

        Section section = new Section();
        section.setId(UUID.randomUUID().toString());
        section.setCreateTime(new Date());
        section.setName(sname);
        

        return sectionDao.save(section);
    }

    @Override
    public Section update(String sname, String id) {

        Section byId = sectionDao.findById(id).get();

        byId.setName(sname);
        return sectionDao.save(byId);
    }

    @Override
    public void delete(String id) {
        sectionDao.deleteById(id);
    }

    @Override
    public List<Section> findAll() {
        return (List<Section>)sectionDao.findAll();
    }
}
