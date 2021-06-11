package com.jdpt.security.handler;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Description //TODO $ 自定义登陆成功之后跳转到百度页面
 * @ClassName MyAuthenticationSuccessHandler
 * @Author Lenovo
 * @Date 2021/4/27 9:44
 * @Version 1.0
 * @Since 1.0
 **/
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler
{

    private String url;//我们想要跳转的URL

    public MyAuthenticationSuccessHandler(String url)
    {
        this.url = url;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException
    {
        //查看authentication接口里面的属性
        User user = (User) authentication.getPrincipal();//获取登陆验证返回的user，UserDetailsServiceImpl返回的user
        System.out.println(user);
        httpServletResponse.sendRedirect(url);//重定向到指定的url
    }
}
