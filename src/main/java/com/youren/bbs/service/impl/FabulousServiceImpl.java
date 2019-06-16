package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.mapper.FabulousMapper;
import com.youren.bbs.service.FabulousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class FabulousServiceImpl implements FabulousService {

    @Autowired
    private FabulousMapper fabulousMapper;

    //
    private Fabulous fabulous(Long pid,Long uid){
        Fabulous fabulous = new Fabulous();
            Post post = new Post();
                post.setId(pid);
            User user = new User();
                user.setId(uid);
        fabulous.setPost(post);
        fabulous.setUser(user);
        return fabulous;
    }

    @Override
    public int create(Long pid, Long uid) {

        Fabulous fabulous = fabulous(pid, uid);
        fabulous.setCreateTime(new Date());
       /* Fabulous fabulous = new Fabulous();
        post.setId(pid);
        user.setId(uid);
        fabulous.setPost(post);
        fabulous.setUser(user);*/

        return fabulousMapper.create(fabulous);
    }

    @Override
    public int delete(Long pid, Long uid) {
        Fabulous fabulous = fabulous(pid, uid);
        return fabulousMapper.delete(fabulous);
    }

    @Override
    public Fabulous findByPidUid(Long pid, Long uid) {
        Fabulous fabulous = fabulous(pid, uid);
        return fabulousMapper.findByPidUid(fabulous);
    }

    @Override
    public List<Fabulous> findBypid(Long pid) {
        List<Fabulous> list = fabulousMapper.findBypid(pid);
        return list;
    }

    @Override
    public Integer findnumber(Long pid) {
        return fabulousMapper.findnumber(pid);
    }
}
