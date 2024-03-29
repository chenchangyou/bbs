package com.youren.bbs.mapper;

import com.youren.bbs.entity.Reply;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyMapper {
    int create(Reply reply);
    int delete(long id);
    Reply findById(long id);
    List<Reply> findByPostId(long postId);
    List<Reply> findAll();
    List<Reply> findBykeyword(@Param("field") String Field, @Param("keyword") String keyword);
    int update(Reply reply);
    int updateLikeCont(Reply reply);
}
