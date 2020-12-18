package com.course.store.dao;

import com.course.store.domain.Activecode;
import com.course.store.domain.Orders;
import com.course.store.domain.Product;
import com.course.store.domain.User;
import com.course.store.utils.MybatisUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class ProductDao {
    private SqlSessionFactory sqlSessionFactory;

    public ProductDao(String configPath) throws IOException {
        InputStream inputStream = Resources.getResourceAsStream(configPath);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }
    public boolean insertProduct(Product product) {
        boolean result = false;
        SqlSession sqlSession = MybatisUtil.getSession();
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        try {
            result = mapper.insertProduct(product);
        } catch (Exception e) {
            System.out.println("订单不存在");
        }
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public boolean deleteProduct(String pid){
        boolean result = false;
        SqlSession sqlSession = MybatisUtil.getSession();
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        try {
            result = mapper.deleteProduct(pid);
        } catch (Exception e) {
            System.out.println("删除商品失败");
        }
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public boolean updataProduct(String pid){
        boolean result = false;
        SqlSession sqlSession = MybatisUtil.getSession();
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        try {
            result = mapper.updataProduct(pid);
        } catch (Exception e) {
            System.out.println("修改订单失败");
        }
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public Product selectProduct(String pid) {
        SqlSession sqlSession = MybatisUtil.getSession();
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        Product productlist = null;
        try {
            productlist = mapper.seleteProduct(pid);
        } catch (Exception e) {
            System.out.println("商品不存在");
        }
        sqlSession.close();
        return productlist;
    }
    public List<Product> getNew(){
        SqlSession sqlSession = MybatisUtil.getSession();
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        List<Product> productlist = mapper.getNew();
        sqlSession.close();
        return productlist;
    }
    public List<Product> getHot(){
        SqlSession sqlSession = MybatisUtil.getSession();
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        List<Product> productlist = mapper.getHot();
        sqlSession.close();
        return productlist;
    }
}
