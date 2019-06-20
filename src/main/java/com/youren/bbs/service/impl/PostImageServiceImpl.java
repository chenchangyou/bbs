package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.PostImage;
import com.youren.bbs.mapper.PostImageMapper;
import com.youren.bbs.service.PostImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class PostImageServiceImpl implements PostImageService {

    @Autowired
    private PostImageMapper postImageMapper;

    @Override
    public int save(Long pid, String url) {

        PostImage postImge = new PostImage();
            postImge.setId(UUID.randomUUID().toString());
            postImge.setUrl(url);
                Post post = new Post();
                    post.setId(pid);
            postImge.setPost(post);
        return postImageMapper.save(postImge);
    }

    @Override
    public int delete(String id) {
        return postImageMapper.delete(id);
    }

    @Override
    public List<PostImage> findAllByPid(Long pid) {
        return postImageMapper.findAllByPid(pid);
    }
}
