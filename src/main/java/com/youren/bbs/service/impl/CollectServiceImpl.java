package com.youren.bbs.service.impl;

import com.youren.bbs.entity.Collect;
import com.youren.bbs.entity.Fabulous;
import com.youren.bbs.entity.Post;
import com.youren.bbs.entity.User;
import com.youren.bbs.mapper.CollectMapper;
import com.youren.bbs.service.CollectService;
import com.youren.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户收藏的实现
 */

@Service
@Transactional
public class CollectServiceImpl implements CollectService {

    @Autowired
    private CollectMapper collectMapper;

    @Autowired
    private PostService postService;

    //
    private Collect coll(Long pid, Long uid){

        Collect collect = new Collect();
        User user = new User();
        user.setId(uid);
        Post post = new Post();
        post.setId(pid);
        collect.setUser(user);
        collect.setPost(post);
        return collect;

    }

    /**
     * 添加收藏
     * @param pid 帖子ID
     * @param uid 用户ID
     */
    @Override
    public int create(Long pid, Long uid) {

        Collect collect = coll(pid, uid);
        collect.setCreateTime(new Date());

        return collectMapper.create(collect);
    }

    /**
     * 删除收藏
     * @param id 收藏ID
     */
    @Override
    public int delete(Long id) {
//        return collectMapper.delete();
        return 0;
    }

    /**
     * 查询用户是否收藏有该贴
     * @param pid 帖子ID
     * @param uid 用户ID
     */
    @Override
    public Collect findByPidUid(Long pid, Long uid) {
        Collect collect = coll(pid, uid);
        return collectMapper.findByPidUid(collect);
    }

    /**
     * 查询用户的收藏
     * @param uid 用户ID
     */
    @Override
    public List<Collect> findByUid(Long uid) {
        return null;
    }


    /**
     * 统计帖子的收藏量
     */
    @Override
    public Integer findNumber(Long pid) {
        return collectMapper.findNumber(pid);
    }


    /**
     * 判断用户是否有收藏
     */
    @Override
    public int judgeCollect(Long pid, Long uid) {

        Collect collect = coll(pid, uid);

        Post post;

        int i;

        if (pid!=null&&uid!=null){

            post = postService.findById(pid);
            Integer collectCount = post.getCollectCount();

            Collect ByPidUid = collectMapper.findByPidUid(collect);

            if(ByPidUid!=null){
                collectMapper.delete(collect);
                postService.updatecollectCount(pid,collectCount-1);
                i = 0;
            }else {
                collect.setCreateTime(new Date());
                collectMapper.create(collect);
                postService.updatecollectCount(pid, collectCount + 1);
                i = 1;
            }
        }else {
            i=2;
        }
        return i;
    }


    @Override
    public Map<String, Object> collectmap(Long pid,User user) {

        Map<String, Object> map = new HashMap<String, Object>();

        if(user!=null){
            Collect  collect = findByPidUid(pid, user.getId());
            if(collect!=null){
                map.put("state",1);
            }else {
                map.put("state",0);
            }
        }else {
            map.put("state",0);
        }

        Integer number = findNumber(pid);

        map.put("collectNumber",number);

        return map;
    }
}
