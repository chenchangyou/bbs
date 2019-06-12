package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;

/**
 * 帖子
 */
@Data
public class Post {
    private long id;
    private String title;//标题
    private String content;//内容
    private Date createTime;//发贴时间
    private User user;//发帖人
    private Integer awesome; //点赞量
    private Integer browse; //浏览数
    private Integer difference;//差评数
    private Integer state;//帖子状态（1.正常，2.正在审核，3.违规被删帖
    private Category category;//帖子类别

}
