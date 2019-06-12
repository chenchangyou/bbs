package com.youren.bbs.entity;

import java.util.Date;

/**
 * 帖子
 */
public class Post {
    private long id;
    private String title;//标题
    private String content;//内容
    private Date createTime;//发贴时间
    private User user;//发帖人
    private Integer awesome; //点赞量
    private Integer browse; //浏览数
    private Integer difference;//差评数
    private Integer state;//帖子状态（1.正常，2.正在审核，3.违规被删帖
    private Category category;//帖子类别

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", user=" + user +
                ", category=" + category +
                '}';
    }

    public Integer getAwesome() {
        return awesome;
    }

    public void setAwesome(Integer awesome) {
        this.awesome = awesome;
    }

    public Integer getBrowse() {
        return browse;
    }

    public void setBrowse(Integer browse) {
        this.browse = browse;
    }

    public Integer getDifference() {
        return difference;
    }

    public void setDifference(Integer difference) {
        this.difference = difference;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
