package com.youren.bbs.service.impl;

import com.youren.bbs.dao.AlbumDao;
import com.youren.bbs.entity.Album;
import com.youren.bbs.entity.AlbumCategory;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {

    @Autowired
    private AlbumDao albumDao;

    @Override
    public Album save(Long uid, String url, String cid) {

        Album album = new Album();
        album.setId(UUID.randomUUID().toString());
        album.setCreateTime(new Date());
        album.setUrl(url);
        album.setState(1);
        User user = new User();
        user.setId(uid);
        album.setUser(user);
        AlbumCategory albumCategory = new AlbumCategory();
             albumCategory.setId(cid);
        album.setAlbumCategory(albumCategory);


        return albumDao.save(album);
    }

    @Override
    public void delete(String id) {
        albumDao.delete(albumDao.findById(id).get());
    }
}
