<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/20 0020
  Time: 上午 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

    <script  type="text/javascript">
        $(function () {
        	//监听登录按钮的点击事件
            $("#submit").click(function () {
                //当点击登录按钮时，要发送ajax请求
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/user",
                    data:$("#loginForm").serialize(),//发送整个表单数据
                    success:function(data){
                    	alert(data);
                        if(data=="success") {
                            alert("登录成功！");
                            //回到首页
                            location.href = "index.jsp";
                        }else{
                            alert("用户名或密码错误");
                        }
                    },
                    dataType:"text"
                })
            });
        })

    </script>
</head>

<body>
<%@ include file="header.jsp"%>
<div class="container-fluid">
    <div class="container-fluid" style="height:460px;width: 98%; background:#FF2C4C url('resources/img/loginbg.jpg') no-repeat;">
        <div class="row">
            <div class="col-md-7">
            </div>

            <div class="col-md-5">
                <div style="width:440px;border:1px solid #E7E7E7;padding:20px 0 20px 30px;border-radius:5px;margin-top:60px;background:#fff;">
                    <font style="color: #666;font-size: 22px;font-weight: normal;padding-right: 17px;">会员登录</font>USER LOGIN <span style="color:red" id="error"></span>
                    <div>&nbsp;</div>
                    <form class="form-horizontal" id="loginForm" method="post" action="${pageContext.request.contextPath}/user">
                        <input type="hidden" name="method" value="login">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username"
                                       value="${cookie.username.value}"
                                >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="code" class="col-sm-2 control-label">验证码</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="code" placeholder="请输入验证码">
                            </div>
                            <div class="col-sm-3">
                                <img src="${pageContext.request.contextPath}/code" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> 自动登录
                                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="checkbox" name="remUsername" value="remember"> 记住用户名
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="button" width="100" value="登录" id="submit" border="0" style="background-color:#CD062D;height:35px;width:100px;color:white;">
                            </div>
                        </div>
                    </form>
                    <div style="padding-right:60px;text-align:right"><a href="${pageContext.request.contextPath}/register.jsp">注册</a></div>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="foot.jsp"%>
</body>
</html>
