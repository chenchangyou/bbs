package com.youren.bbs.service.impl;

import com.youren.bbs.mapper.NoticeMapper;
import com.youren.bbs.entity.Notice;
import com.youren.bbs.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public int create(String title, String content) {

        Notice notice = new Notice();
            notice.setTitle(title);
            notice.setContent(content);
            notice.setCreateTime(new Date());
            notice.setState(1);
        int row = noticeMapper.create(notice);
        return row;
    }

    @Override
    public int update(String title, String content) {
        return 0;
    }

    @Override
    public int delete(long id) {
        return 0;
    }

    @Override
    public Notice findById(long id) {
        return noticeMapper.findById(id);
    }

    @Override
    public List<Notice> findAll() {

        return noticeMapper.findAll();
    }
}
