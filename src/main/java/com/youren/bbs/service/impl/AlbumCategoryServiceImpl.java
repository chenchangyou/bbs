package com.youren.bbs.service.impl;

import com.youren.bbs.dao.AlbumCategoryDao;
import com.youren.bbs.entity.AlbumCategory;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.AlbumCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumCategoryServiceImpl implements AlbumCategoryService {

    @Autowired
    private AlbumCategoryDao albumCategoryDao;

    @Override
    public AlbumCategory save(Long uid, String name) {

        AlbumCategory albumCategory = new AlbumCategory();
        albumCategory.setId(UUID.randomUUID().toString());
        albumCategory.setName(name);
        User user = new User();
        user.setId(uid);
        albumCategory.setUser(user);
        albumCategory.setCreateTime(new Date());

        return albumCategoryDao.save(albumCategory);
    }

    @Override
    public void delete(String id) {

        albumCategoryDao.delete(albumCategoryDao.findById(id).get());
    }

    @Override
    public AlbumCategory update(String id, String name) {

        AlbumCategory albumCategory = albumCategoryDao.findById(id).get();
            albumCategory.setName(name);

        return albumCategoryDao.save(albumCategory);
    }

    @Override
    public List<AlbumCategory> findByUserId(Long uid) {

        return albumCategoryDao.findByUserId(uid);
    }
}
