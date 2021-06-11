package com.jdpt.security.service.serviceImpl;

import com.jdpt.security.api.model.Customer;
import com.jdpt.security.api.service.ICustomerService;

import com.jdpt.security.mapper.CustomerMapper;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Service
public class CustomerServiceImpl implements ICustomerService
{
    @Autowired
    private CustomerMapper customerMapper;

    /**
     * 必要页面_注册页面验证手机号是否已经注册
     * @param phone
     * @return
     */
    @Override
    public Customer getCustomerByPhone(String phone)
    {
        return customerMapper.getCustomerByPhone(phone);
    }

    /**
     * 根据电话号和密码查询用户信息
     * @param customer
     * @return
     */
    @Override
    public Customer verifyCustomerByPhoneAndPassword(Customer customer)
    {
        return customerMapper.selectByPhoneAndPassword(customer);
    }

    /**
     * 后台商品管理页面——更新密码——根据手机号更新密码
     * @param customer
     * @return
     */
    @Override
    public int updatePswByPhone(Customer customer)
    {
        return customerMapper.updateByPhone(customer);
    }

    /**必要注册页面_注册信息插入数据库**/
    @Override
    public int insertByRegiste(Customer customer)
    {
        return customerMapper.insert(customer);
    }

    @Override
    public Customer login(Customer customer, HttpServletRequest request, HttpServletResponse response) throws ApplicationException
    {
        return null;
    }
}
