package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;

/**
 *贴子点赞表
 */
@Data
public class Fabulous {
    private Post post;
    private User user;
    private Date createTime;
    private Integer counts;//用于统计数量
}
