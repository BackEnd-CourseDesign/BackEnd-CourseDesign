<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24 0024
  Time: 上午 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #backImg{
        position:fixed;
        top:0;
        left:0;
        bottom:0;
        right:0;
        z-index:-1;
    }

</style>
<div id="backImg">
    <img src="${pageContext.request.contextPath}/resources/img/admin/back.png" width="100%" height="100%"  />
</div>
<div style="text-align: center;padding: 20px;">
    <h2>欢迎管理员,莅临指导工作</h2>
</div>
