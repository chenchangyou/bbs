package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Reply;
import com.youren.bbs.entity.ReplyLike;
import com.youren.bbs.entity.User;
import com.youren.bbs.mapper.ReplyLikeMapper;
import com.youren.bbs.service.ReplyLikeService;
import com.youren.bbs.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class ReplyLikeServiceImpl implements ReplyLikeService {

    @Autowired
    private ReplyLikeMapper replyLikeMapper;

    @Autowired
    private ReplyService replyService;

    @Override
    public int save(Long rid, Long uid) {

        ReplyLike replyLike = findByUidRid(rid, uid);
        Reply byId = replyService.findById(rid);

        int state;

        if(replyLike==null){

            ReplyLike replyLike1 = replyL(rid, uid);
            replyLike1.setCreateTime(new Date());

            int save = replyLikeMapper.save(replyLike1);
            if(save > 0){
                System.out.println("saveOK");

                replyService.updateLikeCont(rid,byId.getLikecont()+1);
                state = 1;
            }else {
                System.out.println("saveNO");
                state = 0;
            }

            }else {
            int delete = replyLikeMapper.delete(replyLike);
            if(delete > 0){
                state = 1;
                System.out.println("delok");
                replyService.updateLikeCont(rid,byId.getLikecont()-1);
            }else {
                System.out.println("delON");
                state = 0;
            }
            }

        return state;
    }

    @Override
    public ReplyLike findByUidRid(Long rid, Long uid) {
        ReplyLike replyLike = replyL(rid, uid);
        return replyLikeMapper.findByUidRid(replyLike);
    }

    @Override
    public int delete(Long rid, Long uid) {
        ReplyLike replyLike = replyL(rid, uid);
        return replyLikeMapper.delete(replyLike);
    }

    private ReplyLike replyL(Long rid, Long uid){

        ReplyLike replyLike = new ReplyLike();
        User user = new User();
        user.setId(uid);
        replyLike.setUser(user);
        Reply reply = new Reply();
        reply.setId(rid);
        replyLike.setReply(reply);

        return replyLike;
    }
}
