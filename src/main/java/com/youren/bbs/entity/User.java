package com.youren.bbs.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 用户类
 */
@Data
@Entity
@Table(name = "t_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//主键生成策略
    private Long id;
    private String username;
    private String password;
    private String nickname; //昵称
    private String sex;
    private Integer age;
    private String email;
    private String tel;
    private String headshot; //用户头像路径
    private Integer state;
    private Integer type;
    private Date createTime;
    private String signature; //个人签名
    private String synopsis;  //简介
//    private UserBackground userBackground;
//    private List<Post> post; //用户的帖子
//    private List<Collect> collect; //用户的收藏
}