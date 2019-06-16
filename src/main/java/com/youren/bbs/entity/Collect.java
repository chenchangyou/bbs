package com.youren.bbs.entity;


import lombok.Data;

import java.util.Date;

/**
 * 帖子收藏（t_collection）
 */
@Data
public class Collect {
    private Long id;
    private Post post;
    private User user;
    private Date createTime;
    private Integer counts;//用于统计数量
}
