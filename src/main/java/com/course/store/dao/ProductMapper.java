package com.course.store.dao;

import com.course.store.domain.Orders;
import com.course.store.domain.Product;

import java.util.*;

import java.util.List;

public interface ProductMapper {
    boolean insertProduct(Product product);
    boolean deleteProduct(String pid);
    boolean updataProduct(String pid);
    Product seleteProduct(String pid);
    List<Product> getHot();
    List<Product> getNew();
}
