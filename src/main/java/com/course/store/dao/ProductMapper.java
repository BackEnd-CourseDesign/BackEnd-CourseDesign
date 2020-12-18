package com.course.store.dao;

import com.course.store.domain.Orders;
import com.course.store.domain.Product;

import java.util.*;

import java.util.List;

public interface ProductMapper {
    boolean insertProduct(Product product);
    boolean deleteProduct(String pid);

    boolean updateProduct(String pid);
    Product seleteProduct(String pid);

    List<Product> getHot();
    List<Product> getNew();
}
