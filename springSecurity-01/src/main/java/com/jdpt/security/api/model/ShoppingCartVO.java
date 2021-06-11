package com.jdpt.security.api.model;

/**
 * 购物车列表对象
 */
public class ShoppingCartVO
{
    /**
     * 商品id
     */
    private Integer productId;
    /**
     * 商品标题
     */
    private String title;
    /**
     * 商品单价
     */
    private Double price;
    /**
     * 商品图片
     */
    private String image1;
    /**
     * 商品购买数量
     */
    private Integer purchaseCount;


    public Integer getProductId()
    {
        return productId;
    }

    public void setProductId(Integer productId)
    {
        this.productId = productId;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public Double getPrice()
    {
        return price;
    }

    public void setPrice(Double price)
    {
        this.price = price;
    }

    public String getImage1()
    {
        return image1;
    }

    public void setImage1(String image1)
    {
        this.image1 = image1;
    }

    public Integer getPurchaseCount()
    {
        return purchaseCount;
    }

    public void setPurchaseCount(Integer purchaseCount)
    {
        this.purchaseCount = purchaseCount;
    }
}
