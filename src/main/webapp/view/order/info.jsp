<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/22 0022
  Time: 上午 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <style>
    </style>
</head>

<body>
<div class="container-fluid">
    <!--头部-->
    <%@ include file="../../header.jsp"%>
    <div class="container">
        <div class="row">
            <div style="margin:0 auto;margin-top:10px;width:950px;">
                <strong>订单详情</strong>
                <table class="table table-bordered">
                    <tbody>
                    <tr class="warning">
                        <th colspan="2">
                            订单编号:${orders.oid}
                        </th>
                        <th colspan="1">
                            订单状态:
                            <c:if test="${orders.state==0}">
                                未付款
                            </c:if>
                            <c:if test="${orders.state==1}">
                                已付款
                            </c:if>
                            <c:if test="${orders.state==2}">
                                已发货
                            </c:if>
                            <c:if test="${orders.state==3}">
                                已完成
                            </c:if>
                        </th>
                        <th colspan="2">下单时间:${orders.ordertime} </th>
                    </tr>
                    <tr class="warning">
                        <th>图片</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>小计</th>
                    </tr>
                    <c:forEach var="orderItem" items="${orders.orderItems}">
                        <tr class="active">
                            <td width="60" width="40%">
                                <input type="hidden" name="id" value="22">
                                <img src="${pageContext.request.contextPath}/${orderItem.product.pimage}" width="70" height="60">
                            </td>
                            <td width="30%">
                                <a target="_blank">${orderItem.product.pname}</a>
                            </td>
                            <td width="20%">
                                ￥${orderItem.product.shop_price}
                            </td>
                            <td width="10%">
                                    ${orderItem.count}
                            </td>
                            <td width="15%">
                                <span class="subtotal">￥${orderItem.subTotal}</span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div style="text-align:right;margin-right:120px;">
                商品金额: <strong style="color:#ff6600;">￥${orders.total}元</strong>
            </div>

        </div>

        <div class="">
            <hr/>
            <form class="form-horizontal" style="margin-top:5px;margin-left:150px;" id="orderForm" action="${pageContext.request.contextPath}/order" method="post">
                <input type="hidden" name="method" value="update">
                <div class="form-group">
                    <label for="address" class="col-sm-1 control-label">地址</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control"  name="address" id="address" placeholder="请输入收货地址">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-1 control-label">收货人</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输收货人">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telephone" class="col-sm-1 control-label">电话</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="telephone" name="telephone" placeholder="请输入联系方式">
                    </div>
                </div>
            </form>

            <hr/>

            <div style="margin-top:5px;margin-left:150px;">
                <strong>选择银行：</strong>
                <p>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行
                    <img src="resources/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
                    <img src="resources/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
                    <img src="resources/bank_img/abc.bmp" align="middle" />
                    <br/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
                    <img src="resources/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
                    <img src="resources/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行
                    <img src="resources/bank_img/ccb.bmp" align="middle" />
                    <br/>
                    <br/>
                    <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行
                    <img src="resources/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
                    <img src="resources/bank_img/cmb.bmp" align="middle" />

                </p>
                <hr/>
                <p style="text-align:right;margin-right:100px;">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                        <img src="${pageContext.request.contextPath}/resources/img/finalbutton.gif" width="204" height="51" border="0" />
                    </a>
                </p>
                <hr/>

            </div>
        </div>

    </div>
    <!--尾部-->
    <%@ include file="../../foot.jsp"%>
</div>
</body>

</html>
