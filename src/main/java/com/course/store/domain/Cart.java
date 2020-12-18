package com.course.store.domain;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {

    //该购物车中存储的n个购物项，
    //键是商品的id，值是该商品的购物项
    private Map<String, CartItem> cartItems = new HashMap<String,CartItem>();

    //商品的总计
    private double total;
    
    //添加购物车
    public void addCart(Product product,int buyNum){
        //先判断cartItems中是否已经包含待加入的商品
        if(cartItems.containsKey(product.getPid())){//已经存在
            //先获取该商品对应的购物项
            CartItem cartItem = cartItems.get(product.getPid());
            //修改购物项的购买数量
            cartItem.setBuyNum(cartItem.getBuyNum()+buyNum);
            //修改小计
            cartItem.setSubtotal(cartItem.getSubtotal()+buyNum*product.getShop_price());
        }else{//不存在
            //创建新的购物项
            CartItem cartItem = new CartItem();
            cartItem.setBuyNum(buyNum);
            cartItem.setProduct(product);
            cartItem.setSubtotal(buyNum*product.getShop_price());
            //存入map集合
            cartItems.put(product.getPid(),cartItem);
        }
        //计算购物车总价
        total += product.getShop_price()*buyNum;
    }

    //移除购物车中的某一项
    public void deleteFromCart(String pid){
        //重新计算总价
        total -= cartItems.get(pid).getSubtotal();
        //移除购物项
        cartItems.remove(pid);
    }
    
    //清空购物车
    public void clearCart(){
        //清空所有购物项
        cartItems.clear();
        //总价置零
        total = 0.0;
    }

    public Map<String, CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Map<String, CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
