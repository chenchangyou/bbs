package com.youren.bbs.service.impl;

import com.youren.bbs.dao.PostDao;
import com.youren.bbs.entity.Post;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Override
    public int create(Post post) {
        int row = postDao.create(post);
        return row;
    }

    @Override
    public int update(Post post) {
        return 0;
    }

    @Override
    public int delete(long id) {
        return 0;
    }

    @Override
    public Post findById(long id) {
        return postDao.findById(id);
    }
    @Override
    public List<Post> findByUserId(int userId) {
        return postDao.findByUserId(userId);
    }

    @Override
    public List<Post> findAll() {
        return postDao.findAll();
    }

    @Override
    public int updatebrowse(long postId, Integer browse) {
        Post post = new Post();
        post.setId(postId);
        post.setBrowse(browse);
        return postDao.updatebrowse(post);
    }

    @Override
    public int updatedifference(long postId, Integer difference) {
        Post post = new Post();
        post.setId(postId);
        post.setDifference(difference);

        return postDao.updatedifference(post);
    }

    @Override
    public int updateawesome(long postId, Integer awesome) {
        Post post = new Post();
        post.setId(postId);
        return postDao.updateawesome(post);
    }
}
