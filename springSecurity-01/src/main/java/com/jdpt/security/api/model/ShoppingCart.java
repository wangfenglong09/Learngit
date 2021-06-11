package com.jdpt.security.api.model;

import java.io.Serializable;

/**
 * 购物车实体类
 */
public class ShoppingCart implements Serializable
{
    private Integer id;

    private Integer customerid;

    private Integer productid;

    private Integer purchasecount;

    /**
     * 商品状态
     * 0 默认未下单
     * 1 已下单
     */
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}