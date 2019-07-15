package com.youren.bbs.entity;



import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 版块
 */

@Entity
@Table(name = "t_section")
public class Section {

    @Id
    private String id;
    private String name;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;
    @OneToOne
    @JoinColumn(name = "moderator_id",referencedColumnName = "id")
    private User user;
    private Integer state;
    @OneToMany( cascade = CascadeType.ALL,fetch=FetchType.EAGER, mappedBy = "section")
    private List<SectionCategory> sectionCategory;

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

    public List<SectionCategory> getSectionCategory() {
        return sectionCategory;
    }

    public void setSectionCategory(List<SectionCategory> sectionCategory) {
        this.sectionCategory = sectionCategory;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Section{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", createTime=" + createTime +
                ", user=" + user +
                ", state=" + state +
                '}';
    }
}
