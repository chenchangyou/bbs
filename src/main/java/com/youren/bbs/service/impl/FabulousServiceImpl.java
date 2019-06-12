package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.mapper.FabulousMapper;
import com.youren.bbs.service.FabulousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FabulousServiceImpl implements FabulousService {

    @Autowired
    private FabulousMapper fabulousMapper;

    @Override
    public int create(Long pid, Long uid) {

        Fabulous fabulous = new Fabulous();
        fabulous.setPid(pid);
        fabulous.setUid(uid);

        return fabulousMapper.create(fabulous);
    }

    @Override
    public int delete(Long id) {
        return fabulousMapper.delete(id);
    }

    @Override
    public Fabulous findByPidUid(Long pid, Long uid) {

        Fabulous fabulous = new Fabulous();
        fabulous.setPid(pid);
        fabulous.setUid(uid);

        return fabulousMapper.findByPidUid(fabulous);
    }
}
