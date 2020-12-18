package com.course.store.dao;

import com.course.store.domain.Product;

import java.util.List;

public interface ProductMapper {
    boolean insertProduct(Product product);
    boolean deleteProduct(String pid);
    boolean updateProduct(String pid);
    List<Product> seleteProduct(String pid);
    List<Product> getHot();
    List<Product> getNew();
}
