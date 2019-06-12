package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;

/**
 * 首页公告
 */
@Data
public class Notice {
    private long nid;
    private String title;
    private String content;
    private Date createTime;
    private int state;
}
