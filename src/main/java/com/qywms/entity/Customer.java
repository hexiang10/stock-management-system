package com.qywms.entity;

import javax.persistence.*;

/*
 * 客户实体类
 */
@Entity
@Table(name = "t_customer")
public class Customer {

    /**
     * 编号
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * 客户名称
     */
    @Column(length = 200)
    private String name;
    /**
     * 联系人
     */
    @Column(length = 50)
    private String contact;
    /**
     * 联系电话
     */
    @Column(length = 50)
    private String number;
    /**
     * 联系地址
     */
    @Column(length = 200)
    private String address;
    /**
     * 备注
     */
    @Column(length = 1000)
    private String remarks;

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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "--{" +
                "编号=" + id +
                ", 名称='" + name + '\'' +
                ", 联系人='" + contact + '\'' +
                ", 联系电话='" + number + '\'' +
                '}';
    }
}
