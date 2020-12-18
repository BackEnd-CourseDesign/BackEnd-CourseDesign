package com.course.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import com.course.store.domain.Cart;
import com.course.store.domain.Product;
import com.course.store.service.ProductService;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index = request.getParameter("method");
		switch (index){
			case "addToCart":
				addToCart(request, response);
				break;
			case "deleteFromCart":
				deleteFromCart(request, response);
				break;
		}
	}

	//移除某一项
	private void deleteFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		//获取购物车对象
		Cart cart = getCart(request);
		//移除这一项
		cart.deleteFromCart(pid);
		//返回添加购物车成功的结果
		JSONObject object = new JSONObject();
		object.put("success", true);
		response.getWriter().write(object.toJSONString());
	}

	//添加购物车
	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		String buyNum = request.getParameter("buyNum");
		//通过pid获取商品对象
		ProductService productService = new ProductService();
		Product product = null;
		//返回添加购物车成功的结果
		JSONObject object = new JSONObject();
		try {
			product = productService.getProductByPid(pid);
			//获取cart
			Cart cart = getCart(request);
			//添加购物车
			cart.addCart(product, Integer.parseInt(buyNum));
			object.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			object.put("success", false);
		}
		response.getWriter().write(object.toJSONString());
	}
	
	
	//获取购物车对象
	private Cart getCart(HttpServletRequest request) {
		//session中获取cart对象，如果有直接返回，如果没有，就创建一个cart，存入session，再返回。
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		//判断cart是否
		if(cart == null) {
			cart = new Cart();
			//存入session
			request.getSession().setAttribute("cart", cart);
		}
		//返cart
		return cart;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
