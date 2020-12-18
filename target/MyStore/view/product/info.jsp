<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/21 0021
  Time: 上午 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

    <style>
        a:hover{
            text-decoration: none;
        }
    </style>
</head>
<script>
    function gotoCart(){
        //跳转servlet
        //需要pid，需要购买数量
        //添加购物车成功以后，返回添加成功。点击右上角的购物车，可以进入购物车结算
        //不跳转页面，但是跟服务器交互，提交ajax请求
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/cart",
            data:{method:"addToCart",pid:"${product.pid}",buyNum:$("#quantity").val()},
            success:function(data){
                //alert(data.success);
                if(data.success){
                    alert("添加购物车成功！");
                }
            },
            dataType:"json"
        })
    }
</script>
<body>
<div class="container-fluid">
    123456789
    ${product}
    <%@ include file="../../header.jsp"%>
    <div class="container">
        <div class="row">
            <div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
                <a href="${pageContext.request.contextPath}/index.jsp">首页&nbsp;&nbsp;&gt;</a>
                <a href="${pageContext.request.contextPath}/product?method=findPageBeanByCid&cid=${category.cid}&currentPage=1">${category.cname}</a>
            </div>

            <div style="margin:0 auto;width:950px;">
                <div class="col-md-6">
                    <img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${product.pimage}">
                </div>

                <div class="col-md-6">
                    <div><strong>${product.pname}</strong></div>
                    <div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
                        <div>编号：${product.pid}</div>
                    </div>

                    <div style="margin:10px 0 10px 0;">
                        一口价: <strong style="color:#ef0101;">&yen;<span>${product.shop_price}</span>元/份</strong> 参 考 价: <del>￥${product.market_price}元/份</del>
                    </div>

                    <div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2018-07-30 ~ 2018-09-01)" style="background-color: #f07373;">限时抢购</a> </div>

                    <div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
                        <div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
                            <input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text"> </div>

                        <div style="margin:20px 0px 10px 0px;padding-left: 70px;">
                            <a href="javascript:void(0)">
                                <input style="background: url('resources/img/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button"
                                    onclick="gotoCart()"   >
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div style="width:950px;margin:0 auto;">
                <div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
                    <strong>商品介绍</strong>
                </div>

                <div>
                    <img src="${pageContext.request.contextPath}/${product.pimage}">
                </div>

                <div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
                    <strong>商品参数</strong>
                </div>
                <div style="margin-top:10px;width:900px;">
                    ${product.pdesc}
                </div>

                <div style="background-color:#d3d3d3;width:900px;">
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="active">
                            <th><strong>商品评论</strong></th>
                        </tr>
                        <tr class="warning">
                            <th>暂无商品评论信息 <a>[发表商品评论]</a></th>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div style="background-color:#d3d3d3;width:900px;">
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="active">
                            <th><strong>商品咨询</strong></th>
                        </tr>
                        <tr class="warning">
                            <th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <%@ include file="../../foot.jsp"%>
</div>
</body>
</html>
