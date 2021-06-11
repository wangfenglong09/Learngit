package com.jdpt.security.api.service;

import com.jdpt.security.api.model.Customer;
import org.apache.ibatis.annotations.Mapper;
import org.omg.CORBA.portable.ApplicationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Mapper
public interface ICustomerService
{
    /**
     * 根据电话号和密码查询用户信息
     * @param customer
     * @return
     */
    Customer verifyCustomerByPhoneAndPassword(Customer customer);

    /**
     * 后台商品管理页面——更新密码——根据手机号更新密码
     * @param customer
     * @return
     */
    int updatePswByPhone(Customer customer);

    /**必要页面_注册页面验证手机号是否已经注册**/
    Customer getCustomerByPhone(String phone);

    /**必要注册页面_insert注册信息到customer表**/
    int insertByRegiste(Customer customer);

    /**
     * 用户登录
     * @param customer
     * @return
     */
    Customer login(Customer customer, HttpServletRequest request, HttpServletResponse response) throws ApplicationException;
}
