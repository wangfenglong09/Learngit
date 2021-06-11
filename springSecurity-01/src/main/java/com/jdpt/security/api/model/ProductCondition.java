package com.jdpt.security.api.model;

import java.io.Serializable;

/**
 * 商品列表里面的查询商品的条件
 * 商品条件查询对象
 */
public class ProductCondition implements Serializable
{
	/**
	 * 商品编号
	 */
	private String productNo;
	/**
	 * 商品标题
	 */
	private String title;
	/**
	 * 商品单价
	 */
	private Double price;
	/**
	 * 商品卖点
	 */
	private String sellPoint;
	/**
	 * 商品状态
	 */
	private String status;
	/**
	 * 页码
	 */
	private Integer pageNo;
	/**
	 * 每页显示记录数
	 */
	private Integer pageSize;

	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 注意转换的问题，前台传的price到后台的price是double类型的
	 * 前台传0，后台double类型默认转换成0.0，这就导致查不到单价是0的数据
	 * 所以此处要左转换 将0.0转换成0
	 * @return
	 */
	public Double getPrice()
	{
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getSellPoint() {
		return sellPoint;
	}
	public void setSellPoint(String sellPoint) {
		this.sellPoint = sellPoint;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getPageNo()
	{
		return (pageNo-1)*pageSize;
	}
	public void setPageNo(Integer pageNo)
	{
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
}
