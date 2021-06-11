package com.jdpt.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description //TODO $ 自定义实现UserDetailsService
 * @ClassName MyUserDetailsService
 * @Author Lenovo
 * @Date 2021/4/25 15:47
 * @Version 1.0
 * @Since 1.0
 **/
@Service
public class UserDetailsServiceImpl implements UserDetailsService
{
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException
    {
        /**
         * TODO 这是根据底层源码来写的，因为底层的实现就是return 一个User对象，User对象中放置了用户名，密码，权限(权限是一个集合)
         * TODO 正常应该是查数据库，现在是demo，所以直接写了用户名和密码
        **/
        System.out.println("进来了么");
        //admin.normal等是权限，角色的定义：ROLE_abc 这是强制定义的，ROLE_xxx必须这么写
        List<GrantedAuthority> auths = AuthorityUtils.commaSeparatedStringToAuthorityList("admin,normal,ROLE_test,ROLE_lili");
        //后台管理者和DBA的权限角色
        List<GrantedAuthority> backGroundAuths = AuthorityUtils.commaSeparatedStringToAuthorityList("DBA,ROLE_manager");

        if("manager".equals(s))//DBA后台管理
        {
            String password =passwordEncoder.encode("1234567");
            return new User(s,password,backGroundAuths);
        }
        else if("admin".equals(s))//普通用户
        {
            String password =passwordEncoder.encode("12345678");
            return new User(s,password,auths);
        }
        else
        {
            throw new UsernameNotFoundException("用户不存在");
        }

        /*if(!"admin".equals(s))
        {
            throw new UsernameNotFoundException("用户不存在");
        }
        String password =passwordEncoder.encode("12345678");
        return new User(s,password,auths);*/
    }
}
