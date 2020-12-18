package com.course.store.dao;

import com.course.store.domain.Orders;
import com.course.store.domain.Product;

import java.util.*;

import java.util.List;

public interface ProductMapper {
    boolean insertProduct(Product product);
    boolean deleteProduct(String pid);
<<<<<<< HEAD
    boolean updateProduct(String pid);
    List<Product> seleteProduct(String pid);
=======
    boolean updataProduct(String pid);
    Product seleteProduct(String pid);
>>>>>>> 16de670eb0fa0e1ef12418b511a795b761894dc9
    List<Product> getHot();
    List<Product> getNew();
}
