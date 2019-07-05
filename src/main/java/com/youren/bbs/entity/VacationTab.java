package com.youren.bbs.entity;


import lombok.Data;

import javax.persistence.*;

/**
 * 假期留宿安排表（闹着玩呢）
 */
@Data
@Entity
@Table(name = "t_vacation_tab")
public class VacationTab {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//主键生成策略
    private Long id;
    private String sname;
    private String sex;
    private String grade;
    private String sphone;
    private String dormitory;
    private String reason;
    private String newdormitory;
    private String teacher;
    private String tphone;
    private String counselor;

}
