package com.youren.bbs.entity;

import java.util.Date;

/**
 * 首页公告
 */

public class Notice {
    private long nid;
    private String title;
    private String content;
    private Date createTime;
    private int state;

    public long getNid() {
        return nid;
    }

    public void setNid(long nid) {
        this.nid = nid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
