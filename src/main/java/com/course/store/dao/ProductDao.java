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
import java.util.List;
import java.util.Map;

public class ProductDao {
    private SqlSessionFactory sqlSessionFactory;

    public ProductDao(String configPath) throws IOException {
        InputStream inputStream = Resources.getResourceAsStream(configPath);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }


}
