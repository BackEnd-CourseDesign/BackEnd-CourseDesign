<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24 0024
  Time: 上午 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>卓商城后台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dtree.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dtree.js" ></script>
</head>
<frameset rows="103,*,43" border="1px">
    <frame src="top.jsp" scrolling="NO" noresize>
    <frameset cols="159,*"  framespacing="0">
        <frame src="left.jsp" noresize scrolling="YES">
        <frame src="welcome.jsp" name="mainFrame">
    </frameset>
    <frame src="bottom.jsp" scrolling="NO" noresize>
</frameset>
</html>
