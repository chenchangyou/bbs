package com.youren.bbs.entity;


import lombok.Data;

import java.util.Date;

/**
 * 用户与用户的关系表（关注，粉丝）
 */
@Data
public class Followed {
    private User userId;//第一用户ID（自己）
    private User followeId;//第二用户的ID（他人，或帖子发布人）
    private Date createTime;//时间
    private Integer counts;//统计关注数或粉丝数
}
