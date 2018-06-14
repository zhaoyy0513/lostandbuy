package com.zzuli.dao;

import com.zzuli.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    User selectByPrimaryKey(Integer uid);

    User getUserByPhone(String phone);//通过手机号查询用户

    int updateByPrimaryKey(User user);  //通过指定Id进行信息修改
}