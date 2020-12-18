package com.course.store.service;

import com.course.store.dao.OrderitemDao;
import com.course.store.dao.OrdersDao;
import com.course.store.domain.Orderitem;

import java.util.List;

public class OrderItemService {
    public List<Orderitem> getOrderItem() throws Exception{
        OrderitemDao orderitemDao = new OrderitemDao("mybatis-config.xml");
        List<Orderitem> orderItems = null;
        orderItems = orderitemDao.getOrderItems();
        return orderItems;
    }
    public void insertOrderitem(Orderitem orderitem) throws Exception{
        OrderitemDao orderitemDao = new OrderitemDao("mybatis-config.xml");
        orderitemDao.insertOrderitem(orderitem);
    }
}
