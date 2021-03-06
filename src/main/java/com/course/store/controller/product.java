package com.course.store.controller;

import com.alibaba.fastjson.JSONObject;
import com.course.store.domain.Product;
import com.course.store.service.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.io.IOException;
@WebServlet("/product")
public class product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String index = req.getParameter("method");
        switch (index){
            case "findHotAndNew":
                findHotAndNew(req, resp);
                break;
            case "findByPid":
                findByPid(req, resp);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    private void findHotAndNew(HttpServletRequest req, HttpServletResponse resp){
        ProductService productService = new ProductService();
        try {
            List<Product> hots =  productService.getHot();
            List<Product> news =  productService.getNew();
            JSONObject j = new JSONObject();
            j.put("hots",hots);
            j.put("news",news);
            resp.getWriter().write(j.toJSONString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void findByPid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");
        ProductService productService = new ProductService();
        Product product = null;
        try {
            product = productService.getProductByPid(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("product",product);
        req.getRequestDispatcher("view/product/info.jsp").forward(req, resp);

    }
}
