package com.youren.bbs.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 帖子
 */
@Data
public class Post {
    private Long id;
    private String title;//标题
    private String content;//内容
    private Date createTime;//发贴时间
    private User user;//发帖人
    private Integer awesome; //点赞量
//    private List<Fabulous> fabulousList;//点赞量
    private Integer replynumber;//回复数量
    private Integer browse; //浏览数
    private Integer difference;//差评数
    private Integer state;//帖子状态（1.正常，2.正在审核，3.提示不合规范下架，并回退到草稿区，4，属于草稿
//    private Category category;//帖子类别
    private SectionCategory sectionCategory;//类型
    private Section section;//所属板块
    private String synopsis;//简介
    private String coverImage;//封面（可选）
    private Integer collectCount;// 收藏统计（更新收藏数）
//    private Fabulous fabulous;//用于判断当前用户是否点赞过帖子
}
