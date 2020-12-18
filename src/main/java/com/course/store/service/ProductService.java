package com.course.store.service;

import com.course.store.dao.OrdersDao;
import com.course.store.dao.ProductDao;
import com.course.store.domain.Orders;
import com.course.store.domain.Product;
import com.course.store.domain.User;
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
    public Product getProductByPid(String pid)throws Exception{
        ProductDao dao = new ProductDao("mybatis-config.xml");
        Product o = dao.selectProduct(pid);
        return o;
    }
}
