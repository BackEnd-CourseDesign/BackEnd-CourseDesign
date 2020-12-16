package com.course.store.dao;

import com.course.store.domain.Activecode;
import com.course.store.domain.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    List<User> selectAll();
    int addUser(User user);
    int createActiveCode(Activecode activecode);
    User findUserByLogin(Map<String,Object> map);
    User findUserByUID(String Uid);
    String findUidByActiveCode(String activeCode);
    int activeUser(String uid);
}
