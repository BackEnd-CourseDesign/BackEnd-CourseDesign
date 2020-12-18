package com.course.store.dao;

import com.course.store.domain.Orders;
import com.course.store.domain.User;
import com.course.store.utils.MybatisUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class OrdersDao {
    private SqlSessionFactory sqlSessionFactory;
    public OrdersDao(String configPath) throws IOException {
        InputStream inputStream = Resources.getResourceAsStream(configPath);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }
    public int addOrder(Orders order) {
        SqlSession sqlSession = MybatisUtil.getSession();
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        int rowsAffected = mapper.addOrder(order);
        sqlSession.commit();
        sqlSession.close();
        return rowsAffected;
    }
    public Orders findOrderByOID(String OID){
        SqlSession sqlSession = MybatisUtil.getSession();
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        Orders o = mapper.findOrderByOID(OID);
        sqlSession.close();
        return o;
    }
    public Orders findOrderByUID(String UID){
        SqlSession sqlSession = MybatisUtil.getSession();
        OrdersMapper mapper = sqlSession.getMapper(OrdersMapper.class);
        Orders o = mapper.findOrderByUID(UID);
        sqlSession.close();
        return o;
    }

}
