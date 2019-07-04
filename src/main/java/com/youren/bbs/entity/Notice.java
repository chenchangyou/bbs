package com.youren.bbs.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * 首页公告
 */
@Data
@Entity
@Table(name = "t_notice")
public class Notice {
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)//主键生成策略
    private String nid;
    @OneToOne
    @JoinColumn(name = "uid",referencedColumnName = "id")
    private User user; //发布人
    private String title;
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;
    private int state;
}
