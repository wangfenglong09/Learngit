package com.jdpt.security.config;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
//import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
//import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

/**
 * @Description TODO 授权服务器，oauth2核心是：授权服务器和认证服务器
 * @ClassName AuthorizationServcerConfig
 * @Author fangzhongyan
 * @Date 2021/5/14 14:33
 * @Vsesion 1.0
 **/
//@Configuration
//@EnableAuthorizationServer //开启授权服务器
public class AuthorizationServcerConfig //extends AuthorizationServerConfigurerAdapter
{
    /**
     * TODO 说明
     * TODO 想要测试访问授权服务器，那么必须要指定好访问的url，
     * http://localhost:8082/oauth/authorize?response_type=code&client_id=client&redirect_uri=http://www.baidu.com&scope=all
    **/

    //@Autowired
    //private PasswordEncoder passwordEncoder;

    /*@Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception
    {
        clients
                .inMemory()
                //客户端ID
                .withClient("client")
                //密钥
                .secret("112233") //给加个密
                //重定向地址
                .redirectUris("http://www.baidu.com")
                //授权范围
                .scopes("all")
                //授权类型，authorization_code表示 授权码模式
                .authorizedGrantTypes("authorization_code");
    }*/
}
