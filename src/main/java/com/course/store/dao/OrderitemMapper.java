package com.course.store.dao;

import com.course.store.domain.Orderitem;

import java.util.List;

public interface OrderitemMapper {
    boolean insertOrderitem(Orderitem orderitem);
    boolean deleteOrderitem(Orderitem orderitem);
    boolean updateOrderitem(Orderitem orderitem);
    List<Orderitem> seleteOrderitemByPid(String pid);
    List<Orderitem> seleteOrderitemByUid(String uid);


}
