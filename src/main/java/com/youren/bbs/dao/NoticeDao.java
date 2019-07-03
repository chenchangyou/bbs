package com.youren.bbs.dao;

import com.youren.bbs.entity.Notice;
import org.springframework.data.repository.CrudRepository;

public interface NoticeDao extends CrudRepository<Notice,String> {
}
