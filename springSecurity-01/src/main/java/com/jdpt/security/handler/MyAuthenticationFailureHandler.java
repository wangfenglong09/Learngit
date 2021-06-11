package com.jdpt.security.handler;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Description //TODO $ 自定义登陆失败跳转到京东页面
 * @ClassName MyAuthenticationFailureHandler
 * @Author Lenovo
 * @Date 2021/4/27 10:14
 * @Version 1.0
 * @Since 1.0
 **/
public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler
{
    private String Url;//自定义url

    public MyAuthenticationFailureHandler(String url)
    {
        this.Url = url;
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException
    {
        httpServletResponse.sendRedirect(Url);//重定向到我们自定义的url
    }
}
