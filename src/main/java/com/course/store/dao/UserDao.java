package com.course.store.dao;

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

    public List<User> selectUser() {
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List <User> userList = mapper.selectUser();
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

    public User findUserByLogin(Map<String,Object> map){
        SqlSession sqlSession = MybatisUtil.getSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.findUserByLogin(map);
        sqlSession.close();
        return user;
    }
}
