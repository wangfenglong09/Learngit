package com.jdpt.security.api.service;

import com.jdpt.security.api.model.Good;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserGoodLoginMessage
{
    List<Good> findByGoodEntity(Good userGood);

    List<Good> LoginByPhoneAndPsw(Good good);

    int registeByPhoneAndPsw(Good record);

    Good verifyLoginToObject(Good good);

    /**注册的时候查询电话号是否已经注册，电话号是唯一**/
    Good getCustomerByPhone(String phone);
}
