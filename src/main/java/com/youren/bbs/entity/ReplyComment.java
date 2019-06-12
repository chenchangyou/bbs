package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;

/**
 * 回复评论
 */
@Data
public class ReplyComment {
    private Integer id;             //id
    private User user;              //回复人
    private String content;         //回复内容
    private Date createTime;        //时间
    private Reply reply;            //回复的评论的信息
}
