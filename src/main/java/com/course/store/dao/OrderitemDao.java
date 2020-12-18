package com.course.store.dao;

import com.course.store.dao.OrderitemMapper;
import com.course.store.domain.Orderitem;
import com.course.store.utils.MybatisUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class OrderitemDao {
    private SqlSessionFactory sqlSessionFactory;

    public OrderitemDao(String configPath) throws IOException {
        InputStream inputStream = Resources.getResourceAsStream(configPath);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    public boolean insertOrderitem(Orderitem orderitem) {
        boolean result = false;
        SqlSession sqlSession = MybatisUtil.getSession();
        OrderitemMapper mapper = sqlSession.getMapper(OrderitemMapper.class);
        try {
            result = mapper.insertOrderitem(orderitem);
        } catch (Exception e) {
            System.out.println("订单不存在");
        }
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public boolean deleteOrderitem(Orderitem orderitem){
        boolean result = false;
        SqlSession sqlSession = MybatisUtil.getSession();
        OrderitemMapper mapper = sqlSession.getMapper(OrderitemMapper.class);
        try {
            result = mapper.deleteOrderitem(orderitem);
        } catch (Exception e) {
            System.out.println("删除订单失败");
        }
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public boolean updataOrderitem(Orderitem orderitem){
        boolean result = false;
        SqlSession sqlSession = MybatisUtil.getSession();
        OrderitemMapper mapper = sqlSession.getMapper(OrderitemMapper.class);
        try {
            result = mapper.updataOrderitem(orderitem);
        } catch (Exception e) {
            System.out.println("修改订单失败");
        }
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public List<Orderitem> selectOrderitem(String pid) {
        SqlSession sqlSession = MybatisUtil.getSession();
        OrderitemMapper mapper = sqlSession.getMapper(OrderitemMapper.class);
        List<Orderitem> orderitemList = null;
        try {
            orderitemList = mapper.seleteOrderitem(pid);
        } catch (Exception e) {
            System.out.println("用户不存在");
        }
        sqlSession.close();
        return orderitemList;
    }
    public List<Orderitem> getOrderItems(){
        SqlSession sqlSession = MybatisUtil.getSession();
        OrderitemMapper mapper = sqlSession.getMapper(OrderitemMapper.class);
        List<Orderitem> orderItems = null;
        orderItems = mapper.getOrderItems();
        return orderItems;
    }

}
