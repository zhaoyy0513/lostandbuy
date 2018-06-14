package com.zzuli.service.impl;

import com.zzuli.dao.UserMapper;
import com.zzuli.pojo.User;
import com.zzuli.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "userService")
public class UserServiceImpl  implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public void addUser(User user) {
            userMapper.insert(user);
    }

    @Override
    public User getUserByPhone(String phone) {
        User user = userMapper.getUserByPhone(phone);
        return user;
    }

    @Override
    public User selectUserByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public void updateUserInfo(User user) {
        userMapper.updateByPrimaryKey(user);
    }
}
