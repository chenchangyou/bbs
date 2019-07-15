package com.youren.bbs.entity;




import java.util.Date;

/**
 * 评论点赞表
 */
//@Data
public class ReplyLike {

    private User user;
    private Reply reply;
    private Date createTime;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
