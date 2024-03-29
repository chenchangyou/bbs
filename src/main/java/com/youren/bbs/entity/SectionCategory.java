package com.youren.bbs.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;

/**
 * 版块里面的分类
 */
@Entity
@Table(name = "t_section_category")
public class SectionCategory {

    @Id
    private String id;
    private String name;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;
    private Integer state;
    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.MERGE ,CascadeType.REFRESH},optional = false)
    @JoinColumn(name = "section_id")
    private Section section;//所属板块

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    @Override
    public String toString() {
        return "SectionCategory{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", createTime=" + createTime +
                ", state=" + state +
                '}';
    }
}
