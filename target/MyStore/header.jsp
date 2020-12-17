<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function(){
        //发送ajax请求，获取分类的数据
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/category?method=findAll",
            success:function(data){
                //将拿到的数据生成li标签，写到ul内部
                var categories = data.categories;//这是一个数组
                //遍历数组，index索引，element数组中的每一个元素（json对象）
                var str = "";
                $(categories).each(function(index,element){
                    //el表达式，里面只能写常量，或者域对象中的数据
                    //只能通过js
                    str += "<li><a href=\"${pageContext.request.contextPath}/product?method=findPageBeanByCid&cid="+element.cid+"&currentPage=1\">"+element.cname+"</a></li>";
                });
                $("#cate_list").append(str);
            },
            dataType:"json"
        });
    });
</script>
<body>
<div class="container-fluid">
    <div class="col-md-4">
    </div>
    <div class="col-md-5">
        <img src="${pageContext.request.contextPath}/resources/img/header.png" />
    </div>
    <div class="col-md-3" style="padding-top:20px">
        <ol class="list-inline" id="login-menu">
        <c:if test="${empty user}">
            <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
            <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
        </c:if>
        <c:if test="${!empty user }">
            ${user.username }, 欢迎您！
            <li><a href="${pageContext.request.contextPath}/user?method=logout">退出</a></li>
        </c:if>
            <li><a href="${pageContext.request.contextPath}/view/cart/list.jsp">购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/view/order/list.jsp">我的订单</a></li>
        </ol>
    </div>
</div>

<div class="container-fluid">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand index" href="${pageContext.request.contextPath}/index.jsp">首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="cate_list">
<%--                    <li class="active"><a href="view/product/list.jsp">手机数码<span class="sr-only">(current)</span></a></li>--%>
<%--                    <li><a href="view/product/list.jsp">电脑办公</a></li>--%>
<%--                    <li><a href="view/product/list.jsp">电脑办公</a></li>--%>
<%--                    <li><a href="view/product/list.jsp">电脑办公</a></li>--%>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</div>
</body>
</html>
