package com.course.store.dao;

import com.course.store.domain.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    List<User> selectUser();
    int addUser(User user);
    User findUserByLogin(Map<String,Object> map);
}
