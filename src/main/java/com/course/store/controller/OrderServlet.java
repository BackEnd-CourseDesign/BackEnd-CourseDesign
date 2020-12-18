package com.course.store.controller;

import com.course.store.domain.*;
import com.course.store.service.OrdersService;
import com.course.store.utils.UUIDUtil;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String index = req.getParameter("method");
        switch (index){
            case "generate":
                addOrder(req, resp);
                break;
            case "findByPid":

                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    private void addOrder(HttpServletRequest req, HttpServletResponse resp){
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        User user = (User) req.getSession().getAttribute("user");
        Orders orders = new Orders();
        orders.setOid(UUIDUtil.getUUID());
        orders.setTotal(cart.getTotal());
        orders.setUid(user.getUid());
        List<Orderitem> orderitems = new ArrayList<Orderitem>();
        Map<String,CartItem> cartItems = cart.getCartItems();
        for (Map.Entry<String,CartItem> entry:cartItems.entrySet()){
            Orderitem orderitem = new Orderitem();
            orderitem.setCount(entry.getValue().getBuyNum());
            orderitem.setOid(orders.getOid());
            orderitem.setProduct(entry.getValue().getProduct());
            orderitem.setSubtotal(entry.getValue().getSubtotal());
            orderitems.add(orderitem);
            OrdersService ordersService = new OrdersService();
            try {
                ordersService.generate(orders);
            } catch (Exception e) {
                e.printStackTrace();
            }
            req.setAttribute("orders",orders);
            try {
                req.getRequestDispatcher("view/order/info.jsp").forward(req,resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
