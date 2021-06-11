package com.jdpt.security.controller;

import com.jdpt.security.api.model.Good;
import com.jdpt.security.api.service.IUserGoodLoginMessage;
import com.jdpt.security.constant.ApplicationConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description //TODO $ 登陆页面等操作controller
 * @ClassName HomePageController
 * @Author Lenovo
 * @Date 2021/4/26 10:15
 * @Version 1.0
 * @Since 1.0
 **/
@Controller
public class HomePageController
{
    @Autowired
    private IUserGoodLoginMessage userGoodLoginMessage;

    //跳转到登陆页面
    @RequestMapping("/hello")
    public String toLogin() { return "login"; }

    /**跳转到首页**/
    @RequestMapping("/homePage")
    public String LoginToHomePage() { return "home/homePage"; }

    /**跳转到登陆错误页面**/
    @RequestMapping("/toError")
    public String LoginToError() { return "failLogin"; }


    /**登陆页面登陆按钮点击事件**/
    @ResponseBody
    @RequestMapping(value = "/login/loginAjax")
    public Object loginAgister(Good good)
    {
        System.out.println("开始");
        Map<String,Object> jsonMap = new HashMap<>();
        try
        {
            List<Good> userList = userGoodLoginMessage.findByGoodEntity(good);
            if(CollectionUtils.isEmpty(userList))
            {
                jsonMap.put("success",false); //没有查询到
                jsonMap.put("message","该用户不存在");
            }
            else
            {
                jsonMap.put("success",true); //查询到
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            jsonMap.put("success",false); //没有查询到
            jsonMap.put("message","调用查询用户服务异常");
        }
        System.out.println("查询手机号得到的map是="+jsonMap.get("success"));
        return jsonMap;
    }


    //***************************************************************************************************//
    /**TODO homePage跳转到登录页面**/
    @RequestMapping("/boot/login")
    public String login(String returnURL, Model model)
    {
        model.addAttribute(ApplicationConstant.RETURN_URL,returnURL);
        return "registe/login";
    }
    /**TODO homePage跳转到注册页面**/
    @RequestMapping("/boot/registe")
    public String toRegister(String returnURL, Model model)
    {
        //window.location.href = "${pageContext.request.contextPath}/boot/registe?returnURL="+returnURL;
        model.addAttribute(ApplicationConstant.RETURN_URL,returnURL);
        return "registe/register";
    }
    //***************************************************************************************************//
}
