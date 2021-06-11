package com.jdpt.security.mapper;

import com.jdpt.security.api.model.Good;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GoodMapper
{
    int deleteByPrimaryKey(Integer id);

    int insert(Good record);

    int insertSelective(Good record);

    Good selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);

    /**查询登录用户信息(首页登录判断用户登录信息)**/
    List<Good> findLoginUser(Good good);

    /**必要首页 登录验证 手机号和密码**/
    List<Good> verifyCustomer(Good good);

    /****/
    Good verifyCustomerByPhoneAndPsw(Good good);

    /**注册页面验证手机号是否已经注册**/
    /**
     * 因为MyBatis要求如果参数为String的话，不管接口方法的形参是什么，
     * 在Mapper.xml中引用时需要改变为_parameter才能识别
     * 1.在接口参数里加上mybatis中的@param注解
     */
    Good getCustomerByPhone(@Param("phone") String phone);

}