package com.youren.bbs.service.impl;

import com.youren.bbs.dao.NoticeDao;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.NoticeServiceJpa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class NoticeServiceJpaImpl implements NoticeServiceJpa {

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public Notice save(Long uid, String title, String content) {

        Notice notice = new Notice();
        notice.setNid(UUID.randomUUID().toString());
        notice.setState(1);
        notice.setCreateTime(new Date());
        notice.setTitle(title);
        notice.setContent(content);

        User user = new User();
        user.setId(uid);
        notice.setUser(user);

        return noticeDao.save(notice);
    }

    @Override
    public List<Notice> findAll() {
        List<Notice> notices = (List<Notice>)noticeDao.findAll();
        return notices;
    }
}
