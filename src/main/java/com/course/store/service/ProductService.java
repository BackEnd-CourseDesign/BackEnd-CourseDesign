package com.course.store.service;

import com.course.store.dao.ProductDao;
import com.course.store.domain.Product;

import java.util.List;

public class ProductService {
    public List<Product> getNew()throws Exception{
        ProductDao dao = new ProductDao("mybatis-config.xml");
        return dao.getNew();
    }
    public List<Product> getHot()throws Exception{
        ProductDao dao = new ProductDao("mybatis-config.xml");
        return dao.getHot();
    }
    public Product getProductByPid(String pid)throws Exception{
        ProductDao dao = new ProductDao("mybatis-config.xml");
        return dao.selectProduct(pid);
    }
}
