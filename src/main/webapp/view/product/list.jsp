<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/22 0022
  Time: 上午 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <style>
    </style>
</head>
<script>
    $(function(){
        //为删除添加点击事件
        $(".delete").click(function(){
            //1.发送ajax请求，删除session中cart的某一项,传pid
            //pid我们之前设置为删除的id，所有现在来获取id就可以
            if(confirm("您确定要删除吗？")){
                location.href="${pageContext.request.contextPath}/cart?method=deleteFromCart&pid="+$(this).attr("id");
                /* var pid = $(this).attr("id");
                //计算删除以后的total
                //获取现在购物车的total
                var total = $(".total").text();
                //计算当前购物项的小计
                var subtotal = $(this).parent().siblings(".subtotaltd").children(".subtotal").text();
                //ajax中，this，和el表达式都是不可用的。
                $.ajax({
                   type:"GET",
                   //1.在按钮的点击事件中发送请求，修改页面的内容
                   url:"${pageContext.request.contextPath}/cart?method=deleteFromCart&pid="+pid,
                   success:function(data){
                       if(data.success){
                           //2下面可以删除表格的一行
                           $("#"+pid).parent().parent().remove();
                           //修改总价
                           $(".total").text(total-subtotal);
                           //判断为空
                           if($(".total").text()==0.0){
                        	   location.href="${pageContext.request.contextPath}/view/cart/list.jsp";
                           }
                       }
                   },
                   dataType:"json"
                });  */

            }
        })
    })
</script>
<body>
<div class="container-fluid"  >
    <!--头部-->
    <%@ include file="../../header.jsp"%>
    <c:if test="${empty cart }">
         <div align="center">
         <img src="${pageContext.request.contextPath }/resources/img/1.png" width="60%">
         </div>
    </c:if>
    <c:if test="${empty cart.cartItems }">
         <div align="center">
         <img  src="${pageContext.request.contextPath }/resources/img/1.png" width="60%">
         </div>
    </c:if>
    <c:if test="${!empty cart.cartItems }">
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
                    <c:forEach var="entry" items="${cart.cartItems}">
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
                    </c:forEach>
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
    
    </c:if>
    
    <div style="color:red;height: 30px;font-size: 24px;text-align: center;line-height: 30px">${msg}</div>
    <!--尾部-->
    <%@ include file="../../foot.jsp"%>
</div>
</body>
</html>
