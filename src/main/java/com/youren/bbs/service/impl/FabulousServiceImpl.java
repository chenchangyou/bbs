package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.mapper.FabulousMapper;
import com.youren.bbs.service.FabulousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public int delete(Long pid, Long uid) {
        Fabulous fabulous = new Fabulous();
        fabulous.setPid(pid);
        fabulous.setUid(uid);
        return fabulousMapper.delete(fabulous);
    }

    @Override
    public Fabulous findByPidUid(Long pid, Long uid) {

        Fabulous fabulous = new Fabulous();
        fabulous.setPid(pid);
        fabulous.setUid(uid);

        return fabulousMapper.findByPidUid(fabulous);
    }

    @Override
    public List<Fabulous> findBypid(Long pid) {

        return fabulousMapper.findBypid(pid);
    }

    @Override
    public Fabulous findnumber(Long pid) {
        return fabulousMapper.findnumber(pid);
    }
}
