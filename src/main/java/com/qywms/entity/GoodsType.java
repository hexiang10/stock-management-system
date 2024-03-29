package com.qywms.entity;

import javax.persistence.*;

/**
 * 商品类别实体
 */

@Entity
@Table(name = "t_goodstype")
public class GoodsType {

    /**
     * 编号
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * 商品列表名称
     */
    @Column(length = 50)
    private String name;
    /**
     * 类别节点类型 1 根节点 0 叶子节点
     */
    private Integer state;
    /**
     * 图标
     */
    @Column(length = 100)
    private String icon;
    /**
     * 父菜单Id
     */
    private Integer pId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    @Override
    public String toString() {
        return "--{" +
                "编号=" + id +
                ", 商品列表名称='" + name + '\'' +
                ", 类别节点类型=" + state +
                ", 图标='" + icon + '\'' +
                ", 父菜单Id=" + pId +
                '}';
    }
}
