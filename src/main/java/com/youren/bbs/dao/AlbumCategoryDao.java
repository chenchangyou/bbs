package com.youren.bbs.dao;

import com.youren.bbs.entity.AlbumCategory;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AlbumCategoryDao extends CrudRepository<AlbumCategory, String> {

        List<AlbumCategory> findByUserId(Long uid);
}
