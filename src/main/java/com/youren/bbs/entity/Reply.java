package com.youren.bbs.entity;

import java.util.Date;
import java.util.List;

/**
 *回复帖子类
 */
public class Reply {
    private long id;
    private String content;//回复内容
    private Date createTime;//回复时间
    private User user;//回复人的信息
    private Post post;//回复的帖子
    private List<ReplyComment> replyCommentList;

    public List<ReplyComment> getReplyCommentList() {
        return replyCommentList;
    }

    public void setReplyCommentList(List<ReplyComment> replyCommentList) {
        this.replyCommentList = replyCommentList;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}
