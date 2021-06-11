package com.jdpt.security.api.model;

import java.io.Serializable;

// implements Serializable是为了往redis存数据的时候，防止提示没有序列化
public class UserMess implements Serializable
{
    private Integer id;

    private String username;

    private String usergender;

    private Integer userage;

    private String useraddress;


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

    public String getUsergender() {
        return usergender;
    }

    public void setUsergender(String usergender) {
        this.usergender = usergender;
    }

    public Integer getUserage() {
        return userage;
    }

    public void setUserage(Integer userage) {
        this.userage = userage;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }
}