<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/22 0022
  Time: 上午 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我订单列表</title>
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
        <div class="row">
            <div style="margin:0 auto; margin-top:10px;width:950px;">
                <strong>我的订单</strong>
                <table class="table table-bordered">
                    <tbody>
                    <tr class="success">
                        <th colspan="2">
                            订单编号:
                            <a href="info.html?oid=7766771234">
                                7766771234
                            </a>
                        </th>
                        <th colspan="1">订单状态:未付款 </th>
                        <th colspan="2">下单时间:2020-02-03 11:25:22 </th>
                    </tr>
                    <tr class="warning">
                        <th>图片</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>小计</th>
                    </tr>
                    <tr class="active">
                        <td width="60" width="40%">
                            <input type="hidden" name="id" value="22">
                            <img src="resources/products/1/donggua1.jpg" width="70" height="60">
                        </td>
                        <td width="30%">
                            <a target="_blank"> 有机蔬菜      大冬瓜...</a>
                        </td>
                        <td width="20%">
                            ￥298.00
                        </td>
                        <td width="10%">
                            5
                        </td>
                        <td width="15%">
                            <span class="subtotal">￥596.00</span>
                        </td>
                    </tr>
                    </tbody>


                </table>
            </div>
        </div>
        <div style="text-align: center;">
            <ul class="pagination">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <%@ include file="../../foot.jsp"%>
</div>
</body>
</html>
