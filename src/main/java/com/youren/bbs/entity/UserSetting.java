package com.youren.bbs.entity;


import lombok.Data;

import javax.persistence.*;

/**
 * 用户功能表(存入true,false，默认都为true)
 */
//@Data
@Entity
@Table(name = "t_user_setting")
public class UserSetting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//主键生成策略
    private String id;
    @OneToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "uid",referencedColumnName = "id")
    private User user;
    private String collect;
    private String followed;
    private String fans;
    private String sex;
    private String usetting;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCollect() {
        return collect;
    }

    public void setCollect(String collect) {
        this.collect = collect;
    }

    public String getFollowed() {
        return followed;
    }

    public void setFollowed(String followed) {
        this.followed = followed;
    }

    public String getFans() {
        return fans;
    }

    public void setFans(String fans) {
        this.fans = fans;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getUsetting() {
        return usetting;
    }

    public void setUsetting(String usetting) {
        this.usetting = usetting;
    }

    @Override
    public String toString() {
        return "UserSetting{" +
                "id='" + id + '\'' +
                ", user=" + user +
                ", collect='" + collect + '\'' +
                ", followed='" + followed + '\'' +
                ", fans='" + fans + '\'' +
                ", sex='" + sex + '\'' +
                ", usetting='" + usetting + '\'' +
                '}';
    }
}
