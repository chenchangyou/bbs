package com.youren.bbs.entity;


import lombok.Data;

@Data
public class UserBackground {

    private String id;
    private User userId;
    private String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public UserBackground(){

    }

    public UserBackground(String id, User userId, String url) {
        this.id = id;
        this.userId = userId;
        this.url = url;
    }

    public UserBackground(String id) {
        this.id = id;
    }

    public UserBackground(User userId) {
        this.userId = userId;
    }
}
