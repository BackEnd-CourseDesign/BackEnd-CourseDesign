package com.course.store.dao;

import com.course.store.domain.Orderitem;

import java.util.List;

public interface OrderitemMapper {
    boolean insertOrderitem(Orderitem orderitem);
    boolean deleteOrderitem(Orderitem orderitem);
    boolean updataOrderitem(Orderitem orderitem);
    List<Orderitem> seleteOrderitem(String pid);
    List<Orderitem> getOrderItems();

}
