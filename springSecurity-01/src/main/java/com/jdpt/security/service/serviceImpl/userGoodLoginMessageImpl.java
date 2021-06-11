package com.jdpt.security.service.serviceImpl;


import com.jdpt.security.api.model.Good;
import com.jdpt.security.api.service.IUserGoodLoginMessage;
import com.jdpt.security.mapper.GoodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userGoodLoginMessage")
public class userGoodLoginMessageImpl implements IUserGoodLoginMessage
{
    @Autowired
    private GoodMapper goodMapper;


    /**10天免登陆页面的登录验证，验证用户名和密码**/
    @Override
    public List<Good> findByGoodEntity(Good userGood)
    {
        List<Good> userList = goodMapper.findLoginUser(userGood);
        return userList;
    }


    /**录页面的登录验证**/
    @Override
    public Good verifyLoginToObject(Good good)
    {
        return goodMapper.verifyCustomerByPhoneAndPsw(good);
    }


    /**必要首页,登录验证手机号和密码**/
    @Override
    public List<Good> LoginByPhoneAndPsw(Good good)
    {
        return goodMapper.verifyCustomer(good);
    }


    /**注册页面手机号和密码插入数据库**/
    @Override
    public int registeByPhoneAndPsw(Good record)
    {
        return goodMapper.insert(record);
    }


    /**注册页面验证手机号是否已经注册**/
    @Override
    public Good getCustomerByPhone(String phone)
    {
        return goodMapper.getCustomerByPhone(phone);
    }
}
