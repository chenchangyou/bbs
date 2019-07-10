package com.youren.bbs.entity;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * 用户相片
 */
//@Data
@Entity
@Table(name = "t_album")
public class Album {
    @Id
    private String id;
    private String url;
    @OneToOne
    @JoinColumn(name = "uid",referencedColumnName = "id")
    private User user;
    private Integer state;
    @Temporal(TemporalType.DATE)
    @Column(name="create_time")
    private Date createTime;
    @ManyToOne
    @JoinColumn(name = "album_category")
    private AlbumCategory albumCategory;//所属相册名

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public AlbumCategory getAlbumCategory() {
        return albumCategory;
    }

    public void setAlbumCategory(AlbumCategory albumCategory) {
        this.albumCategory = albumCategory;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id='" + id + '\'' +
                ", url='" + url + '\'' +
                ", user=" + user +
                ", state=" + state +
                ", createTime=" + createTime +
                '}';
    }
}
