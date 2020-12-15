package com.course.store.dao;

import com.course.store.domain.User;

import java.util.List;

public interface UserMapper {
    List<User> selectUser();
    int addUser(User user);
}
