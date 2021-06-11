package com.jdpt.security.api.model;

import java.io.Serializable;

// implements Serializable是为了往redis存数据的时候，防止提示没有序列化
public class KungFu implements Serializable
{
    private Integer id;

    private String kungfucreate;

    private String kungfuname;

    private String kungfupractisetime;

    private String kungfuheir;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKungfucreate() {
        return kungfucreate;
    }

    public void setKungfucreate(String kungfucreate) {
        this.kungfucreate = kungfucreate;
    }

    public String getKungfuname() {
        return kungfuname;
    }

    public void setKungfuname(String kungfuname) {
        this.kungfuname = kungfuname;
    }

    public String getKungfupractisetime() {
        return kungfupractisetime;
    }

    public void setKungfupractisetime(String kungfupractisetime) {
        this.kungfupractisetime = kungfupractisetime;
    }

    public String getKungfuheir() {
        return kungfuheir;
    }

    public void setKungfuheir(String kungfuheir) {
        this.kungfuheir = kungfuheir;
    }
}