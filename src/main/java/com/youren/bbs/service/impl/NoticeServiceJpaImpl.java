package com.youren.bbs.service.impl;

import com.youren.bbs.dao.NoticeDao;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.service.NoticeServiceJpa;
import com.youren.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class NoticeServiceJpaImpl implements NoticeServiceJpa {

    @Autowired
    private NoticeDao noticeDao;
    @Autowired
    private UserService userService;

    @Override
    public Notice save(String nid, Long uid, String title, String content) {

        Notice notice = null;

        //如果不为空则更新
        if(nid!=null&&!nid.equals("")){
             notice = findById(nid);
             notice.setTitle(title);
             notice.setContent(content);
        }else {     //否则添加
            notice = new Notice();
            notice.setNid(UUID.randomUUID().toString());
            notice.setState(1);
            notice.setCreateTime(new Date());
            notice.setTitle(title);
            notice.setContent(content);
            notice.setUser(userService.findById(uid));
        }
        return noticeDao.save(notice);
    }

    @Override
    public List<Notice> findAll() {
        List<Notice> notices = (List<Notice>)noticeDao.findAll();
        return notices;
    }

    @Override
    public Notice findById(String id) {
        Notice notice = noticeDao.findById(id).get();
        return notice;
    }
}
