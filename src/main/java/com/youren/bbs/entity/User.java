package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 用户类
 */
@Data
public class User {
    private Long id;
    private String username;
    private String password;
    private String sex;
    private Integer age;
    private String email;
    private String tel;
    private String headshot; //用户头像路径
    private Integer state;
    private Integer type;
    private Date createTime;
//    private List<Post> post; //用户的帖子
//    private List<Collect> collect; //用户的收藏
}