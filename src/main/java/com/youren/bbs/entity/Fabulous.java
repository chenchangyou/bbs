package com.youren.bbs.entity;

import lombok.Data;

/**
 *贴子点赞表
 */
@Data
public class Fabulous {
    private Long pid;
    private Long uid;
    private Integer counts;//用于统计数量
}
