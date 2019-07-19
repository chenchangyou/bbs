package com.youren.bbs.service.impl;

import com.youren.bbs.mapper.ReplyCommentMapper;
import com.youren.bbs.mapper.ReplyMapper;
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
    private ReplyMapper replyMapper;

    @Autowired
    private ReplyCommentMapper replyCommentDao;

    @Override
    public int create(Reply reply) {

        return 0;
    }

    @Override
    public int delete(long id) {
        return replyMapper.delete(id);
    }

    @Override
    public Reply findById(long id) {
        return replyMapper.findById(id);
    }

    @Override
    public List<Reply> findByPostId(long postId) {
        List<Reply> Replylist = new ArrayList<Reply>();
        List<Reply> replylists = replyMapper.findByPostId(postId);

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
                reply.setLikecont(replylist.getLikecont());
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
        int id = replyMapper.create(reply);

        return id;
    }

    @Override
    public List<Reply> findAll() {

        return replyMapper.findAll();
    }

    @Override
    public int update(Long rid, String content) {

        Reply reply = new Reply();
        reply.setId(rid);
        reply.setContent(content);

        return replyMapper.update(reply);
    }

    @Override
    public int updateLikeCont(Long rid, Integer likeNum) {
        Reply reply = new Reply();
        reply.setId(rid);
        reply.setLikecont(likeNum);
        return replyMapper.updateLikeCont(reply);
    }

    @Override
    public List<Reply> findByReply(String Field, String keyword) {

        return replyMapper.findBykeyword(Field,"%"+keyword+"%");
    }
}
