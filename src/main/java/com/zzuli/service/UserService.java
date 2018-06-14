package com.zzuli.service;

import com.zzuli.pojo.User;

public interface UserService {
    public void addUser(User user);
    public User getUserByPhone(String phone);
    User selectUserByPrimaryKey(Integer id);
    public void updateUserInfo(User user);
}
