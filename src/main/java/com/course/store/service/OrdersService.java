package com.course.store.service;

import com.course.store.dao.OrdersDao;
import com.course.store.domain.Orders;
import com.course.store.domain.User;

public class OrdersService {
    //通过用户的UID获取用户当前的订单信息
    public Orders getOrder(User user)throws Exception{
        OrdersDao dao = new OrdersDao("mybatis-config.xml");
        Orders o = dao.findOrderByUID(user.getUid());
        return o;
    }


}
