package com.youren.bbs.service.impl;

import com.youren.bbs.mapper.PostMapper;
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
    private PostMapper postMapper;

    @Override
    public int create(Post post) {
        int row = postMapper.create(post);
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
        return postMapper.findById(id);
    }
    @Override
    public List<Post> findByUserId(int userId) {
        return postMapper.findByUserId(userId);
    }

    @Override
    public List<Post> findAll() {
        return postMapper.findAll();
    }

    @Override
    public int updatebrowse(long postId, Integer browse) {
        Post post = new Post();
        post.setId(postId);
        post.setBrowse(browse);
        return postMapper.updatebrowse(post);
    }

    @Override
    public int updatedifference(long postId, Integer difference) {
        Post post = new Post();
        post.setId(postId);
        post.setDifference(difference);

        return postMapper.updatedifference(post);
    }

    @Override
    public int updateawesome(long postId, Integer awesome) {
        Post post = new Post();
        post.setId(postId);
        return postMapper.updateawesome(post);
    }
}
