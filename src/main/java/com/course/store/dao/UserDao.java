package com.course.store.dao;

import com.course.store.domain.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class UserDao {
    private SqlSessionFactory sqlSessionFactory;

    public UserDao(String configPath) throws IOException {
        InputStream inputStream = Resources.getResourceAsStream(configPath);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }
    public List<User> selectUser() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        List<User> studentList = sqlSession.selectList("selectUser");
        sqlSession.close();
        return studentList;
    }
    public int addUser(User user) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int rowsAffected = sqlSession.insert("insert", user);
        sqlSession.commit();
        sqlSession.close();
        return rowsAffected;
    }
}
