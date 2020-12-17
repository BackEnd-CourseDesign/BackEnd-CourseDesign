package com.course.store.dao;
import com.course.store.domain.Orders ;
import com.course.store.domain.User;


public interface OrdersMapper {
    int addOrder(Orders order);
    Orders findOrderByOID(String OID);
    Orders findOrderByUID(String UID);
}
