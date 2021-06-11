package com.jdpt.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description //TODO $ 后台管理Controller
 * @ClassName ManagerController
 * @Author Lenovo
 * @Date 2021/4/29 15:04
 * @Version 1.0
 * @Since 1.0
 **/
@Controller
public class ManagerController
{
    //homePage首页面的后台管理按钮
    @RequestMapping("/boot/houtaiguanli")
    public String toHouTaiGuanLi(String returnURL, Model model)
    {
        //model.addAttribute(ApplicationConstant.RETURN_URL,returnURL);
        return "home/main";
    }
    //跳转到商品管理页面
    @RequestMapping("/product/index")
    public String toProductIndex()
    {
        return "manager/product/index";
    }

    //跳转到销售订单页面
    @RequestMapping("/order/index")
    public String toOrderIndex(String returnURL, Model model)
    {
        return "manager/order/index";
    }
}
