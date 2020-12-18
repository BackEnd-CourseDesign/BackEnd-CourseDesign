package com.course.store.service;

import com.course.store.dao.OrdersDao;
import com.course.store.domain.Orderitem;
import com.course.store.domain.Orders;
import com.course.store.domain.User;
import java.util.List;

public class OrdersService {
    //通过用户的UID获取用户当前的订单信息
    public Orders getOrder(User user)throws Exception{
        OrdersDao dao = new OrdersDao("mybatis-config.xml");
        Orders o = dao.findOrderByUID(user.getUid());
        return o;
    }
    public void addOrder(Orders order) throws Exception{
        OrdersDao dao = new OrdersDao("mybatis-config.xml");
        dao.addOrder(order);
    }
    public void generate(Orders order) throws Exception{
        OrdersService ordersService = new OrdersService();
        OrderItemService orderItemService = new OrderItemService();
        ordersService.addOrder(order);
        List<Orderitem> orderitems = orderItemService.getOrderItem();
        for (Orderitem orderItem : orderitems){
            orderItemService.insertOrderitem(orderItem);
        }
    }



}
