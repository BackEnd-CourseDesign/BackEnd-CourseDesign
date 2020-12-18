package com.course.store.service;

import com.course.store.dao.ProductDao;
import com.course.store.domain.Product;

import java.io.IOException;
import java.util.List;

public class ProductService {
    public List<Product> getNew()throws Exception{
        ProductDao dao = new ProductDao("mybatis-config.xml");
        List<Product> o = dao.getNew();
        return o;
    }
    public List<Product> getHot()throws Exception{
        ProductDao dao = new ProductDao("mybatis-config.xml");
        List<Product> o = dao.getHot();
        return o;
    }
    public Product getProduct(String pid){
        try {
            ProductDao productDao = new ProductDao("mybatis-config.xml");
            return productDao.selectProduct(pid).get(0);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
