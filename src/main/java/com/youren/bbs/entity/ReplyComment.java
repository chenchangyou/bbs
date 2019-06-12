package com.youren.bbs.entity;

import java.util.Date;

/**
 * 回复评论
 */

public class ReplyComment {
    private Integer id;             //id
    private User user;              //回复人
    private String content;         //回复内容
    private Date createTime;        //时间
    private Reply reply;            //回复的评论的信息

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }
}
