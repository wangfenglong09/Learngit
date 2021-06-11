package com.jdpt.security.config;

import com.jdpt.security.handler.MyAuthenticationFailureHandler;
import com.jdpt.security.handler.MyAuthenticationSuccessHandler;
import com.jdpt.security.service.UserDetailsServiceImpl;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

/**
 * @Description //TODO $ 自定义配置类设置用户名和密码，查数据库获取用户名和密码
 * @ClassName CustomerSecurityConfig
 * @Author Lenovo
 * @Date 2021/4/25 15:35
 * @Version 1.0
 * @Since 1.0
 **/
@Configuration
public class CustomSecurityConfig extends WebSecurityConfigurerAdapter
{
    @Autowired
    private DataSource dataSource; //配置文件中已经配置数据源了

    @Autowired
    private PersistentTokenRepository persistentTokenRepository;

    @Autowired
    private UserDetailsServiceImpl userDetailsService; //自定义的登陆逻辑


    //当进行自定义逻辑时容器内必须有passwordEncoder实例，所以不能直接new对象。所以使用@Configuration配置注解，用@Bean放到spring容器内
    @Bean
    PasswordEncoder passwordEncoder() { return new BCryptPasswordEncoder(); }

    //记住我功能需要存储用户登陆信息，这个方法记录存储用户信息到数据库
    @Bean
    public PersistentTokenRepository persistentTokenRepository()
    {
        JdbcTokenRepositoryImpl jdbcRepository = new JdbcTokenRepositoryImpl();
        jdbcRepository.setDataSource(dataSource);//设置数据源
        //向配置的数据库建表，建的是rememberme的表，第一次启动时候开启，第二次启动项目的时候要注释掉
        //jdbcRepository.setCreateTableOnStartup(true); //创建的表是persistent_logins
        return jdbcRepository;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        //TODO 跳转到自定义的页面hello
        //TODO 并且指定校验路径toCheckUser给UserDetailsServiceImpl类的loadUserByUsername方法去校验用户名和密码
        //TODO 成功之后跳转到homePage方法映射
        //TODO successForwardUrl()方法必须是post方法，不能是get方法，页面跳转就是get请求
        http
            .formLogin().loginPage("/hello") //跳转到自定义页面
            .loginProcessingUrl("/toCheckUser") //自定义页面form表单的action的url
            .successForwardUrl("/homePage") //默认登陆成功之后跳转的页面
            .failureForwardUrl("/toError"); //默认登陆失败之后跳转的页面
            //.successHandler(new MyAuthenticationSuccessHandler("http://www.baidu.com")) //自定义登陆成功跳转的页面
            //.failureHandler(new MyAuthenticationFailureHandler("http://jd.com")); //自定义登陆失败跳转的页面


        // 正常情况下，现在都是前后端分离，所以基本上都是自定义登录成功或失败页面的，一般是不是应用默认的。
        //TODO 自定义登陆成功跳转百度页面
        //TODO 自定义登陆成功之后跳转到一个页面，现在的逻辑是登陆成功转发请求到/homePage，但是现在想登陆成功之后跳转到百度页面，那么就需要自定义handle去处理
        //TODO successForwardUrl默认是转发，现在自定义handler的类MyAuthenticationSuccessHandler去重定向，所以不使用successForwardUrl这个方法了，
        //TODO 使用.successHandler(new MyAuthenticationSuccessHandler("http://www.baidu.com"))

        //TODO 自定义登陆失败跳转到自定义的京东页面
        //TODO 同自定义登陆成功跳转百度页面的原理类似,failureForwardUrl底层实现也是转发，所以我们自定义个handler去重写接口方法，用重定向
        //TODO MyAuthenticationFailureHandler implements AuthenticationFailureHandler重写onAuthenticationFailure方法，
        //TODO .failureHandler(new MyAuthenticationFailureHandler("http://jd.com"));


        //TODO 基于权限  只有登陆时候有Manager权限才能访问的资源.还可以多个权限
        http.authorizeRequests().antMatchers("/boot/houtaiguanli").hasAuthority("DBA");
        //http.authorizeRequests().antMatchers("/boot/houtaiguanli").hasAnyAuthority("admin","Manager");

        //TODO 基于角色  只有ROLE_test1角色的才能访问,也能匹配多个角色
        http.authorizeRequests().antMatchers("/boot/houtaiguanli").hasRole("manager");
        //http.authorizeRequests().antMatchers("/boot/houtaiguanli").hasAnyRole("test","TEST");

        //TODO 基于IP地址
        //http.authorizeRequests().antMatchers("/boot/houtaiguanli").hasIpAddress("127.0.0.1");

        //TODO 放行，不进行验证 静态资源也放行了
        http.authorizeRequests().antMatchers("/hello","/oauth/**","/toError","/static/**").permitAll();

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
        //记住我Remember me功能
        http.rememberMe().tokenRepository(persistentTokenRepository);//配置数据源的
        http.rememberMe().tokenValiditySeconds(60); //超时默认时间是2周，现在改成60秒
        http.rememberMe().userDetailsService(userDetailsService);//自定义的登陆逻辑
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//


        //############################################################################################################//
        //退出
        http.logout().logoutSuccessUrl("/hello");
        //############################################################################################################//


        //TODO 授权 所有的请求都要认证才能访问 必须登陆才行
        http.authorizeRequests().anyRequest().authenticated();

        //TODO 解决使用Spring Security后jsp控制台提示提示X-Frame-Options DENY的问题
        http.headers().frameOptions().sameOrigin();

        //TODO 关闭csrf。否则post提交会返回403
        //TODO csrf跨域请求：登陆成功之后获取到服务端给的token，每次请求的时候都要带着这个token，否则会提示权限不足
        //http.csrf().disable();
    }

}
