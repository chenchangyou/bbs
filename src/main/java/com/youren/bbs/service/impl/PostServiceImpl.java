package com.youren.bbs.service.impl;

import com.youren.bbs.entity.User;
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
        return postMapper.update(post);
    }


    //更新状态（包括假删除)
    @Override
    public int updateState(int state, Long id) {
        Post post = new Post();
        post.setState(state);
        post.setId(id);
        return postMapper.updateState(post);
    }

    @Override
    public Post findById(Long id) {
        return postMapper.findById(id);
    }
    @Override
    public List<Post> findByUserId(Long userId) {
        return postMapper.findByUserId(userId);
    }

    @Override
    public List<Post> findAll() {
        return postMapper.findAll();
    }

    @Override
    public int updatebrowse(Long postId, Integer browse) {
        Post post = new Post();
        post.setId(postId);
        post.setBrowse(browse);
        return postMapper.updatebrowse(post);
    }

    @Override
    public int updatedifference(Long postId, Integer difference) {
        Post post = new Post();
        post.setId(postId);
        post.setDifference(difference);

        return postMapper.updatedifference(post);
    }

    @Override
    public int updateawesome(Long postId, Integer awesome) {
        Post post = new Post();
        post.setId(postId);
        post.setAwesome(awesome);
        return postMapper.updateawesome(post);
    }

    @Override
    public int updatereplynumber(Long postId, Integer replynumber) {
        Post post = new Post();
        post.setId(postId);
        post.setReplynumber(replynumber);
        return postMapper.updatereplynumber(post);
    }

    @Override
    public int updatecollectCount(Long postId, Integer collectCount) {
        Post post = new Post();
        post.setId(postId);
        post.setCollectCount(collectCount);
        return postMapper.updateCollectCount(post);
    }

    @Override
    public List<Post> findByKeyWord(String keyword) {

        return postMapper.findByKeyWord("%"+keyword+"%");
    }

    @Override
    public List<Post> findAllByPopular() {
        return postMapper.findAllByPopular();
    }

    @Override
    public List<Post> ByKeyword(String Field, String keyword) {

        return postMapper.ByKeyWord(Field,"%"+keyword+"%");
    }

    @Override
    public List<Post> findAllByToDay() {
        return postMapper.findAllByToDay();
    }
}
