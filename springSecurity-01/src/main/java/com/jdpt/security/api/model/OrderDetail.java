package com.jdpt.security.api.model;

import java.io.Serializable;

public class OrderDetail implements Serializable
{
    private Integer id;

    private Integer productid;

    private Integer purchasecount;

    private Integer orderid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getPurchasecount() {
        return purchasecount;
    }

    public void setPurchasecount(Integer purchasecount) {
        this.purchasecount = purchasecount;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }
}