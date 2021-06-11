package com.jdpt.security.api.model;

import java.io.Serializable;

public class ReceiveAddress implements Serializable
{
    private Integer id;

    private String name;

    private String phone;

    private String address;

    /**
     * 默认收获地址状态
     * 1 默认地址
     * 0 不是默认地址
     */
    private String status;

    private Integer customerid;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }
}