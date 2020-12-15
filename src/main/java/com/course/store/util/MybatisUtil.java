package com.course.store.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtil {
    private static SqlSessionFactory sqlSessionFactory;
    //因为SqlSession是线程唯一，全局不唯一的，所以需要创建ThreadLocal绑定当前线程中的SqlSession对象；
    private static final ThreadLocal<SqlSession> t1 = new ThreadLocal<SqlSession>();

    static {
        try {
            InputStream resource = Resources.getResourceAsStream("mybatis-config.xml");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static SqlSession openSession(){
        SqlSession sqlSession = t1.get();
        if (sqlSession==null){
            sqlSession = sqlSessionFactory.openSession();
            t1.set(sqlSession);
        }
        return sqlSession;
    }
    public static void commit(){
        SqlSession sqlSession = openSession();
        sqlSession.commit();
        close();
    }
    public static void rollback(){
        SqlSession sqlSession = openSession();
        sqlSession.rollback();
        close();
    }
    public static void close(){
        SqlSession sqlSession = t1.get();
        sqlSession.close();
    }
    public static <T> T getMapper(Class<T> mapper){
        SqlSession sqlSession = openSession();
        return sqlSession.getMapper(mapper);
    }
}
