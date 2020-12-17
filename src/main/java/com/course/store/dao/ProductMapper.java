package com.course.store.dao;

import com.course.store.domain.Orders;
import com.course.store.domain.Product;

import java.util.*;


public interface ProductMapper {
    boolean insertProduct(Product product);
    boolean deleteProduct(String pid);
    boolean updataProduct(String pid);
    List<Product> seleteProduct(String pid);
    List<Product> getHot();
    List<Product> getNew();
}
