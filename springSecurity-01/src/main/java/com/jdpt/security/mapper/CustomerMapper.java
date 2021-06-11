package com.jdpt.security.mapper;

import com.jdpt.security.api.model.Customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CustomerMapper
{
    int deleteByPrimaryKey(Integer id);

    /**必要注册页面_注册信息插入数据库**/
    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    /**10天免登录页面_登录验证**/
    Customer selectByPhoneAndPassword(Customer customer);

    /**后台商品管理页面——更新密码——根据手机号更新密码**/
    int updateByPhone(Customer record);

    /**必要页面_注册页面验证手机号是否已经注册**/
    /**
     * 因为MyBatis要求如果参数为String的话，不管接口方法的形参是什么，
     * 在Mapper.xml中引用时需要改变为_parameter才能识别
     * 1.在接口参数里加上mybatis中的@param注解
     */
    Customer getCustomerByPhone(@Param("phone") String phone);
}