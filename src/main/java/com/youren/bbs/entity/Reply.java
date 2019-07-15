package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 *评论类
 */
@Data
public class Reply {
    private Long id;
    private String content;//回复内容
    private Date createTime;//回复时间
    private User user;//回复人的信息
    private Post post;//回复的帖子
    private Integer likecont;// 获赞数
    private List<ReplyComment> replyCommentList;//评论里面的评论的list
    private ReplyLike replyLike;
}
