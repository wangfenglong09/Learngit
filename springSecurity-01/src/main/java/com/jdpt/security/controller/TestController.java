package com.jdpt.security.controller;

import com.jdpt.security.api.model.Good;
import com.jdpt.security.api.service.IUserGoodLoginMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Description //TODO $
 * @ClassName TestController
 * @Author Lenovo
 * @Date 2021/4/25 10:53
 * @Version 1.0
 * @Since 1.0
 **/
@Controller
@RequestMapping(value = "/user")
public class TestController
{
    @Autowired
    private IUserGoodLoginMessage userGoodLoginMessage;

    //测试数据库连接
    @ResponseBody
    @RequestMapping(value = "/test/jdbc")
    public List<Good> testJdbc()
    {
        Good good = new Good();
        good.setUsername("猫咪");
        good.setUserpassword("454545");
        List<Good> userList = userGoodLoginMessage.findByGoodEntity(good);
        return userList;
    }

    @ResponseBody
    @RequestMapping(value = "/hello")
    public String hello()
    {
        return "Hello Spring security";
    }

    //测试oauth2的放行资源服务器
    @ResponseBody
    @RequestMapping("/getCurrentUser")
    public Object getCurrentUser(Authentication authentication)
    {
        return authentication.getPrincipal();//返回自定义登陆类里面的user信息
    }


}
