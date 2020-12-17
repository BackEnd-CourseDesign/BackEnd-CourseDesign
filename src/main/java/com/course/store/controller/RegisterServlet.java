package com.course.store.controller;


import com.course.store.domain.User;
import com.course.store.service.UserService;
import com.course.store.utils.UUIDUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
   public void doPost(HttpServletRequest request, HttpServletResponse response){
       User user = new User();
       user.setUid(UUIDUtil.getUUID());
       user.setUsername("wangyao");
       user.setPassword("wangyaonb2020");
       user.setEmail("1581446178@qq.com");
       user.setName("王耀");
       UserService service = new UserService();
       try {
           service.register(user);
           PrintWriter out = response.getWriter();
           out.println("注册成功");
       } catch (Exception e) {
           e.printStackTrace();
       }
   }

   public void doGet(HttpServletRequest request, HttpServletResponse response){

   }
}
