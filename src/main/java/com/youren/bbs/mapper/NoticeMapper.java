package com.youren.bbs.mapper;

import com.youren.bbs.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeMapper {

    int create(Notice notice);
    int update(Notice notice);
    int delete(String id);
    Notice findById(String id);
    List<Notice> findAll();

}
