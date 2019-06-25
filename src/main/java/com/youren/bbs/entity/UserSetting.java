package com.youren.bbs.entity;


import lombok.Data;

/**
 * 用户功能表(存入true,false，默认都为true)
 */
@Data
public class UserSetting {

    private String id;
    private User uid;
    private String collect;
    private String followed;
    private String fans;
    private String sex;
}
