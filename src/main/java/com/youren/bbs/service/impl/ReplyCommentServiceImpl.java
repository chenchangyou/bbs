package com.youren.bbs.service.impl;

import com.youren.bbs.dao.ReplyCommentDao;
import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.ReplyComment;
import com.youren.bbs.entity.User;
import com.youren.bbs.service.ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;


@Service
@Transactional
public class ReplyCommentServiceImpl implements ReplyCommentService {

    @Autowired
    private ReplyCommentDao replyCommentDao;


    @Override
    public int add(long replyId, String content, long userId) {

        ReplyComment replyComment = new ReplyComment();
            Reply reply = new Reply();
                reply.setId(replyId);
            User user = new User();
                user.setId(userId);
            replyComment.setReply(reply);
            replyComment.setUser(user);
            replyComment.setContent(content);
            replyComment.setCreateTime(new Date());

        int row = replyCommentDao.create(replyComment);

        return row;
    }

    @Override
    public int delete(Integer id) {
        return replyCommentDao.delete(id);
    }
}
