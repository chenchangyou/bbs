package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Collect;
import com.youren.bbs.entity.Followed;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.mapper.FollowedMapper;
import com.youren.bbs.service.CollectService;
import com.youren.bbs.service.FollowedService;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class FolloewdServiceImpl implements FollowedService {

    @Autowired
    private FollowedMapper followedMapper;
    @Autowired
    private PostService postService;
    @Autowired
    private CollectService collectService;

    //关注自己的用户（粉丝）
    private Followed Followed(Long fid,Long uid){
        Followed followed = new Followed();

            User user = new User();
                user.setId(uid);

            User fuser = new User();
                fuser.setId(fid);

        followed.setUserId(user);
        followed.setFolloweId(fuser);

        return followed;
    }


    //添加关注
    @Override
    public int create(Long fid, Long uid) {

        Followed followed = Followed(fid,uid);
            followed.setCreateTime(new Date());
        return followedMapper.create(followed);

    }

    //取消关注
    @Override
    public int delete(Long id) {
        return 0;
    }

    @Override
    public Followed findByPidUid(Long fid, Long uid) {
        return null;
    }

    @Override
    public List<Followed> findByUid(Long uid) {

        return followedMapper.findByUid(uid);
    }

    @Override
    public Integer findNumber(Long fid) {

        return followedMapper.findNumber(fid);
    }

    @Override
    public Integer findFuser(Long fid) {

        return followedMapper.findFans(fid);
    }

    @Override
    public int judgeFollowed(Long fid, Long uid) {
        Followed followed = Followed(fid,uid);

        int i;

        if (fid!=null&&uid!=null){

            Followed fUidUid = followedMapper.findByFUidUid(followed);

            if(fUidUid!=null){

                int delete = followedMapper.delete(followed);

                i=0;

            }else {

                followed.setCreateTime(new Date());

                followedMapper.create(followed);

                i=1;
            }
        }else {
             i=2;
        }
        return i;
    }

    @Override
    public Map<String, Object> followedmap(Long fid, User user) {
        Map<String, Object> map = new HashMap<String, Object>();

        if(user!=null){
            Followed followed = Followed(fid,user.getId());
            Followed byFUidUid = followedMapper.findByFUidUid(followed);
            if(byFUidUid!=null){
                map.put("state",1);
            }else {
                map.put("state",0);
            }
        }else {
            map.put("state",0);
        }
        List<Post> postList = postService.findByUserId(fid);
        List<Collect> collectList = collectService.findByUid(fid);
        List<Followed> followedList = followedMapper.findByUid(fid);
        Integer number = findNumber(fid);

        map.put("followedcount",followedList.size());//粉丝数
        map.put("collectcount",collectList.size());//收藏数
        map.put("postcount",postList.size());//贴子数
        map.put("collectNumber",number);//关注数

        return map;
    }
}
