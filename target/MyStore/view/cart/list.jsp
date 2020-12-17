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
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
    <!-- 引入自定义css文件 style.css -->
    <style>
    </style>
</head>
<script>
</script>
<body>
<div class="container-fluid"  >
    <!--头部-->
    <%@ include file="../../header.jsp"%>
         <div align="center">
         <img src="${pageContext.request.contextPath }/resources/img/1.png" width="60%">
         </div>
         <div align="center">
         <img  src="${pageContext.request.contextPath }/resources/img/1.png" width="60%">
         </div>
       <div class="container" style="min-height: 441px;">
        <div class="row">
            <div style="margin:0 auto; margin-top:10px;width:950px;">
                <strong style="font-size:16px;margin:5px 0;">购物车详情</strong>
                <table class="table table-bordered">
                    <tbody>
                    <tr class="warning">
                        <th>图片</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>小计</th>
                        <th>操作</th>
                    </tr>
                    <%-- 遍历所有的购物项map  ,要遍历的是map集合，存的是所有的购物项，每一项是一个键值对
                                键值对：name：pid
                                       value:cartItem
                                --%>
                    <tr class="active">
                        <td width="60" width="40%">
                            <input type="hidden" name="id" value="22">
                            <img src="${pageContext.request.contextPath}/${entry.value.product.pimage}" width="70" height="60">
                        </td>
                        <td width="30%">
                            <a target="_blank">${entry.value.product.pname}</a>
                        </td>
                        <td width="20%">
                            ￥${entry.value.product.shop_price}
                        </td>
                        <td width="10%">
                            ${entry.value.buyNum}
                        </td>
                        <td width="15%" class="subtotaltd">
                            ￥<span class="subtotal">${entry.value.subtotal}</span>
                        </td>
                        <td>
                            <a href="javascript:void(0);" class="delete" id="${entry.key}">删除</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div style="margin-right:130px;">
            <div style="text-align:right;">
                商品金额: <strong style="color:#ff6600;">￥<span class="total">${cart.total}</span>元</strong>
            </div>
            <div style="text-align:right;margin-top:10px;margin-bottom:10px;">
                <a href="${pageContext.request.contextPath}/cart?method=clearCart" id="clear" class="clear">清空购物车</a>
                <a href="${pageContext.request.contextPath}/order?method=generate">
                    <input type="button" width="100" value="提交订单" id="submit" border="0" style="background-color:#CD062D;height:35px;width:100px;color:white;">
                </a>
            </div>
        </div>
    </div>
    

    
    <div style="color:red;height: 30px;font-size: 24px;text-align: center;line-height: 30px">${msg}</div>
    <!--尾部-->
    <%@ include file="../../foot.jsp"%>
</div>
</body>
</html>
