<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/21 0021
  Time: 上午 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->

    <style>
    </style>
</head>

<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="container">
        <c:if test="${empty pageBean.productList}">
            <div style="font-size:20px;text-align: center;height: 30px;line-height: 30px">没有查询到任何数据！</div>
        </c:if>
        <c:if test="${!empty pageBean.productList}">
            <div class="row" style="width:1210px;margin:0 auto;">
                <%--   从pageBean中取出所有的商品 items:将要遍历的集合或者数组 var:遍历出来的每一个元素        --%>
                <c:forEach var="product" items="${pageBean.productList}">
                    <div class="col-md-2" style="height: 220px">
                        <a href="${pageContext.request.contextPath}/product?method=findById&pid=${product.pid}">
                            <img src="${pageContext.request.contextPath}/${product.pimage}" width="170" height="170" style="display: inline-block;">
                        </a>
                        <p><a href="${pageContext.request.contextPath}/product?method=findById&pid=${product.pid}" style='color:green'>${product.pname}</a></p>
                        <p><font color="#FF0000">商城价：&yen;${product.shop_price}</font></p>
                    </div>
                </c:forEach>
            </div>

            <!--分页 -->
            <div style="width:380px;margin:0 auto;margin-top:50px;">
                <ul class="pagination" style="text-align:center; margin:10px auto;">
                    <%-- 如果当前页是第一页，就不能再向前翻页了，不可用的状态，a不响应点击事件--%>
                    <c:if test="${pageBean.currentPage==1}">
                        <li class="disabled">
                            <a href="javascript:void(0)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%-- 如果当前页不是第一页，就向前翻页--%>
                    <c:if test="${pageBean.currentPage!=1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/product?method=findPageBeanByCid&cid=${pageBean.productList[0].cid}&currentPage=${pageBean.currentPage-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%--   页码的展示，从1开始，到总页数结束                 --%>
                    <c:forEach var="page" begin="1" end="${pageBean.totalPage}" step="1">
                        <%-- 如果page是当前页，就是激活的状态 --%>
                        <c:if test="${page==pageBean.currentPage}">
                            <%-- 如果是当前页，点击就不响应                         --%>
                            <li class="active"><a href="javascript:void(0)">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=pageBean.currentPage}">
                            <%--  如果不是当前页,就需要发送请求                          --%>
                            <li><a href="${pageContext.request.contextPath}/product?method=findPageBeanByCid&cid=${pageBean.productList[0].cid}&currentPage=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <%-- 如果当前页是最大页数，不能向后翻，不可用的状态，不响应点击        --%>
                    <c:if test="${pageBean.currentPage==pageBean.totalPage}">
                        <li class="disabled">
                            <a href="javascript:void(0)" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%-- 如果当前页不是最大页数，向后翻       --%>
                    <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/product?method=findPageBeanByCid&cid=${pageBean.productList[0].cid}&currentPage=${pageBean.currentPage+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>

        </c:if>

        <!-- 分页结束=======================        -->

        <!--
               商品浏览记录:
        -->
        <div style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 246px;">

            <h4 style="width: 50%;float: left;font: 14px/30px '微软雅黑';">浏览记录</h4>
            <div style="width: 50%;float: right;text-align: right;"><a href="">more</a></div>
            <div style="clear: both;"></div>

            <div style="overflow: hidden;">

                <ul style="list-style: none;">
                    <li style="width: 150px;height: 216px;float: left;margin: 0 8px 0 0;padding: 0 18px 15px;text-align: center;">
                        <img src="${pageContext.request.contextPath}/resources/products/1/cs10001.jpg" width="130px" height="130px" /></li>
                </ul>

            </div>
        </div>
    </div>
    <%@include file="../../foot.jsp"%>
</div>
</body>

</html>
