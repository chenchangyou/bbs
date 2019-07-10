package com.youren.bbs.dao;

import com.youren.bbs.entity.Album;
import org.springframework.data.repository.CrudRepository;

public interface AlbumDao extends CrudRepository<Album, String> {

}
