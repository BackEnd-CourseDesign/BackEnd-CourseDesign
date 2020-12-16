package com.course.store.service;

import com.course.store.dao.UserDao;
import com.course.store.domain.Activecode;
import com.course.store.domain.User;
import com.course.store.expection.ActiveCodeException;
import com.course.store.utils.MailUtil;
import com.course.store.utils.VCodeUtil;

import javax.mail.MessagingException;
import javax.security.auth.login.LoginException;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class UserService {
    /* 1.注册操作	 START*/
    public void register(User user) throws Exception {

        UserDao dao = new UserDao("mybatis-config.xml");
        try {
            Timestamp dateNow=new Timestamp(System.currentTimeMillis());
            user.setUpdatetime(dateNow);
            //1.添加注册用户信息
            dao.addUser(user);
            Activecode activecode = new Activecode();
            activecode.setUid(user.getUid());
            activecode.setActivecode(VCodeUtil.verifyCode(8));
            //2.向注册用户发送激活邮件
            String emailMsg = "注册成功，请点击下列连接已完成激活操作:(ps:由于邮箱原因，请复制链接打开！)"+"<br>"+
                    "http://localhost:8080/Mystore/UserActiveServlet?activeCode="+activecode.getActivecode();
            MailUtil.sendMail(user.getEmail(), emailMsg);
        } catch (MessagingException | GeneralSecurityException e) {
            e.printStackTrace();
        } // TODO Auto-generated catch block

    }
    /*1. 注册操作		END*/

    /*2. 激活用户操作	START*/
    public void activeUser(String activeCode) throws ActiveCodeException, IOException {
        UserDao dao = new UserDao("mybatis-config.xml");
        // 1.根据激活码查询用户，要判断激活码是否过期.

        User user = dao.findUserByActiveCode(activeCode);

        if (user != null) {
            // 2.进行激活操作

            long time = System.currentTimeMillis()
                    - user.getUpdatetime().getTime();

            if (time <= 24 * 60 * 1000 * 60) {
                // 激活
                dao.activeUser(activeCode);

            } else {
                throw new ActiveCodeException("激活码过期");
            }
        } else {
            throw new ActiveCodeException("用户不存在");
        }
    }
    /*2. 激活用户操作	END*/

    /*3.登录操作		START*/
    public User login(String username, String password) throws LoginException, ActiveCodeException, IOException {
        // 需要注意用户是否激活
        UserDao dao = new UserDao("mybatis-config.xml");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("username",username);
        map.put("password",password);
        User user = dao.findUserByLogin(map);
        if (user != null) {
            // 判断用户是否激活
            if (user.getState() == 1) {
                return user;
            } else {
                throw new ActiveCodeException("用户未激活");
            }
        } else {
            throw new LoginException("用户名或密码错误");
        }

    }

    /*3.登录操作		END*/
}
