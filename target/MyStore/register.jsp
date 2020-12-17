<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head></head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<style>
</style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container-fluid">
    <div class="container-fluid" style="width:98%;background:url('resources/img/regist_bg.jpg');">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
                <font style="color: #3164af;font-size: 18px;font-weight: normal;padding: 0 10px;">会员注册</font>USER REGISTER
                <form class="form-horizontal" style="margin-top:5px;" method="post" action="${pageContext.request.contextPath }/user">
                    <input type="hidden" name="method" value="register">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username">
                            <span id="usernameInfo"></span>
                            <script>
                                 //监听username的失去焦点事件
                                 $("#username").blur(function(){
                                	 //获取输入的用户名
                                	 var username = $("#username").val().trim();
                                	 if(username==""){
                                		 $("#usernameInfo").html("用户名不可用");
                        				 $("#usernameInfo").css("color","red");
                        				 //用户名输入框获取焦点
                        				 $("#username").focus();
                        				 //不能继续向下进行，不能发送ajax
                        				 return;//结束函数
                                	 }
                                	 //发送ajax请求，将用户传到服务端，查询有没有存在该用户名
                                	 $.ajax({
                                		 type:"GET",
                                		 url:"${pageContext.request.contextPath}/user?method=checkUsername&username="+username,
                                		 success:function(data){
                                			 //已经存在返回yes,不存在返回no
                                			 if(data=="yes"){
                                				 $("#usernameInfo").html("用户名不可用");
                                				 $("#usernameInfo").css("color","red");
                                				 //用户名输入框获取焦点
                                				 $("#username").focus();
                                			 }
                                			 if(data=="no"){
                                				 $("#usernameInfo").html("用户名可用");
                                				 $("#usernameInfo").css("color","green");
                                			 }
                                		 },
                                		 dataType:"text"
                                	 });
                                 });
                            
                            </script>
                       
                       
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="confirmpwd" placeholder="请输入确认密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="usercaption" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="usercaption" placeholder="请输入姓名" name="name">
                        </div>
                    </div>
                    <div class="form-group opt">
                        <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio1" value="1" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="date" class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" name="birthday" id="date">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="code" id="code">
                            <span id="codeInfo" style="color:red"></span>
                            <script>
                            // 监听失去焦点的事件
                                $("#code").blur(function(){
                                	//获取输入的验证码
                                	var code_input = $("#code").val().trim();
                                	if(code_input==""){//不需要发送请求
                                		$("#code").focus();
                                		return;
                                	}
                                	//发送请求，校验验证码
                                	$.ajax({
                                		type:"GET",
                                		url:"${pageContext.request.contextPath}/user?method=checkCode&code_input="+code_input,
                                		success:function(data){
                                			if(data=="error"){
                                				//验证码错误
                                				$("#codeInfo").html("验证码错误");
                                			}else{
                                				$("#codeInfo").html("");
                                			}
                                		},
                                		dataType:"text"
                                	});
                                });
                            </script>
                        </div>
                        <div class="col-sm-2">
                            <img src="${pageContext.request.contextPath}/code" />
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" width="100" value="注册" name="submit" border="0" style="background-color:#CD062D;height:35px;width:100px;color:white;">
                        </div>
                    </div>
                </form>
                <div style="padding-right:80px;text-align:right"><a href="${pageContext.request.contextPath }/login.jsp">已有账号，选择登录</a></div>
            </div>

            <div class="col-md-2"></div>

        </div>
    </div>
</div>
<%@ include file="foot.jsp"%>
</body>
</html>


