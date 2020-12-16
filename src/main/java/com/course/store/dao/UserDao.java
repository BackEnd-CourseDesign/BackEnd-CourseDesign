package com.course.store.dao;

import com.course.store.domain.Activecode;
import com.course.store.domain.User;
import com.course.store.utils.MybatisUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDao {
    private SqlSessionFactory sqlSessionFactory;

    public UserDao(String configPath) throws IOException {
        InputStream inputStream = Resources.getResourceAsStream(configPath);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    public List<User> selectAll() {
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List <User> userList = mapper.selectAll();
        sqlSession.close();
        return userList;
    }

    public int addUser(User user) {
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int rowsAffected = mapper.addUser(user);
        sqlSession.commit();
        sqlSession.close();
        return rowsAffected;
    }

    public int createActiveCode(Activecode activecode){
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int rowsAffected = mapper.createActiveCode(activecode);
        sqlSession.commit();
        sqlSession.close();
        return rowsAffected;
    }

    public User findUserByLogin(Map<String,Object> map){
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.findUserByLogin(map);
        sqlSession.close();
        return user;
    }

    public User findUserByActiveCode(String activeCode) {
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.findUserByActiveCode(activeCode);
        sqlSession.close();
        return user;
    }

    public void activeUser(String activeCode) {
    }
}
