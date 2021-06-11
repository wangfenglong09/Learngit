package com.jdpt.security.api.model;

import java.io.Serializable;

// implements Serializable是为了往redis存数据的时候，防止提示没有序列化
public class Good implements Serializable
{
    private Integer id;

    private String username;

    private String userpassword;

    private String phone;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}