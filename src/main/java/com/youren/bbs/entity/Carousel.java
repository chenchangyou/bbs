package com.youren.bbs.entity;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * 首页轮播图表
 */
@Entity
@Table(name = "t_carousel")
@Data
public class Carousel {
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)//主键生成策略
    private String id;
    private String url;
    private Integer state;
    @Temporal(TemporalType.DATE)
    @Column(name="create_time")
    private Date createTime;

}
