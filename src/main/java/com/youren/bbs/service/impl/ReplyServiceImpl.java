package com.youren.bbs.service.impl;

import com.youren.bbs.dao.ReplyCommentDao;
import com.youren.bbs.dao.ReplyDao;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.ReplyComment;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    private ReplyDao replyDao;

    @Autowired
    private ReplyCommentDao replyCommentDao;

    @Override
    public int create(Reply reply) {

        return 0;
    }

    @Override
    public int delete(long id) {
        return 0;
    }

    @Override
    public Reply findById(long id) {
        return null;
    }

    @Override
    public List<Reply> findByPostId(long postId) {
        List<Reply> Replylist = new ArrayList<Reply>();
        List<Reply> replylists = replyDao.findByPostId(postId);

        long replyid = 0;
        Reply reply = null;
        for (Reply replylist:replylists){
            if(replyid == replylist.getId()){
                reply = Replylist.get(Replylist.size()-1);
            }else {
                reply = new Reply();
                reply.setContent(replylist.getContent());
                reply.setId(replylist.getId());
                reply.setUser(replylist.getUser());
                reply.setCreateTime(replylist.getCreateTime());
                reply.setPost(replylist.getPost());
            }
            long replyId = replylist.getId();
            List<ReplyComment> byReplyId = replyCommentDao.findByReplyId(replyId);
            reply.setReplyCommentList(byReplyId);

            if(replyid != replylist.getId()){
                Replylist.add(reply);
            }
                replyid = replylist.getId();
        }
        return Replylist;
    }

    @Override
    public int add(String content, long postId,long userId) {

        Reply reply = new Reply();
        Post post = new Post();
        User user = new User();
        user.setId(userId);
        post.setId(postId);
        reply.setUser(user);
        reply.setContent(content);
        reply.setPost(post);
        reply.setCreateTime(new Date());
        int id = replyDao.create(reply);

        return id;
    }

}
