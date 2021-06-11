package com.jdpt.security.config;

//import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
//import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

/**
 * @Description TODO 资源服务器，oauth2核心是：授权服务器和资源服务器
 * @ClassName ResourceServerConfig
 * @Author fangzhongyan
 * @Date 2021/5/14 14:48
 * @Vsesion 1.0
 **/
//@Configuration
//@EnableResourceServer //开启资源服务器
public class ResourceServerConfig //extends ResourceServerConfigurerAdapter
{
    /**
     * TODO 这是资源服务器，准备的资源是user，想要获取user信息，那么必须要有授权和令牌才行，否则访问不到
    **/

    /*@Override
    public void configure(HttpSecurity http) throws Exception
    {
        http.csrf().disable();
        http.authorizeRequests().antMatchers("/hello","/user/**","/toError","/static/**").permitAll();
        http.authorizeRequests().anyRequest().authenticated();
    }*/
}
