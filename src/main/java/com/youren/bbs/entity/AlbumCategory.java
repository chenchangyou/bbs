package com.youren.bbs.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * 相册名
 */
//@Data
@Entity
@Table(name = "t_album_category")
public class AlbumCategory {
    @Id
    private String id;
    private String name;
    @OneToOne
    @JoinColumn(name = "uid",referencedColumnName = "id")
    private User user; //相册所属用户
    @Temporal(TemporalType.DATE)
    @Column(name="create_time")
    private Date createTime;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "albumCategory")
    private List<Album> album; //拥有的照片

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<Album> getAlbum() {
        return album;
    }

    public void setAlbum(List<Album> album) {
        this.album = album;
    }
}
