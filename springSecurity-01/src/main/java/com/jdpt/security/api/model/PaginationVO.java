package com.jdpt.security.api.model;

import java.io.Serializable;
import java.util.List;

/**
 * 分页对象模型
 */
public class PaginationVO<T> implements Serializable
{
	/**
	 * 查询总记录数
	 */
	private long total;
	/**
	 * 总记录数据
	 */
	private List<T> dataList;

	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
}
