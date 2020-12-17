package com.course.store.dao;

import com.course.store.domain.Orders;


public interface ProductMapper {
    int addOrder(Orders order);
    Orders findOrderByOID(String OID);
    Orders findOrderByUID(String UID);
}
