<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>卓商城</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" />
  <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
<%@ include file="header.jsp"%>
<script>
    //加载首页，发送ajax请求，获取最新和最热门的商品
    $.ajax({
        type:"GET",
        url:"${pageContext.request.contextPath}/product?method=findHotAndNew",
        success:function(data){
            //动态地将商品的数据显示在相应的位置
            //先显示热门
            str = "";
            $(data.hots).each(function(index,element){
               str +="<div class=\"col-md-2\" style=\"text-align:center;height:200px;padding:10px 0px;\">\n" +
                   "        <a href=\"${pageContext.request.contextPath}/product?method=findByPid&pid="+element.pid+"\">\n" +
                   "          <img src=\""+element.pimage+"\" width=\"130\" height=\"130\" style=\"display: inline-block;\">\n" +
                   "        </a>\n" +
                   "        <p><a href=\"product_info.html\" style='color:#666'>"+element.pname+"</a></p>\n" +
                   "        <p><font color=\"#E4393C\" style=\"font-size:16px\">&yen;"+element.shop_price+"</font></p>\n" +
                   "      </div>";
            });
            //放到父元素内
            $(".hot").append(str);
            //显示最新
            str="";
            $(data.news).each(function(index,element){
                str +="<div class=\"col-md-2\" style=\"text-align:center;height:200px;padding:10px 0px;\">\n" +
                    "        <a href=\"${pageContext.request.contextPath}/product?method=findById&pid="+element.pid+"\">\n" +
                    "          <img src=\""+element.pimage+"\" width=\"130\" height=\"130\" style=\"display: inline-block;\">\n" +
                    "        </a>\n" +
                    "        <p><a href=\"product_info.html\" style='color:#666'>"+element.pname+"</a></p>\n" +
                    "        <p><font color=\"#E4393C\" style=\"font-size:16px\">&yen;"+element.shop_price+"</font></p>\n" +
                    "      </div>";
            });
            $(".new").append(str);
        },
        dataType:"json"
    });


</script>
<div class="container-fluid">
  <!--
      描述：轮播条
  -->
  <div class="container-fluid">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="resources/products/hao/1.jpg">
          <div class="carousel-caption">

          </div>
        </div>
        <div class="item">
          <img src="resources/products/hao/2.jpg">
          <div class="carousel-caption">

          </div>
        </div>
        <div class="item">
          <img src="resources/products/hao/3.jpg">
          <div class="carousel-caption">

          </div>
        </div>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <!--
      描述：商品显示
  -->
  <div class="container-fluid">
    <div class="col-md-12">
      <h2>热门商品&nbsp;&nbsp;<img src="resources/img/title2.jpg"/></h2>
    </div>
    <div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
      <img src="resources/products/hao/big01.jpg" width="205" height="404" style="display: inline-block;"/>
    </div>
    <div class="col-md-10 hot">
      <div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
        <a href="product_info.htm" href="javascript:void(0)">
          <img src="resources/products/hao/middle01.jpg" width="516px" height="200px" style="display: inline-block;">
        </a>
      </div>
    </div>
  </div>
  <!--
      描述：广告部分
  -->
  <div class="container-fluid">
    <img src="resources/products/hao/ad.jpg" width="100%"/>
  </div>
  <!--
      描述：商品显示
  -->
  <div class="container-fluid">
    <div class="col-md-12">
      <h2>最新商品&nbsp;&nbsp;<img src="resources/img/title2.jpg"/></h2>
    </div>
    <div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
      <img src="resources/products/hao/big01.jpg" width="205" height="404" style="display: inline-block;"/>
    </div>
    <div class="col-md-10 new">
      <div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
        <a href="product_info.htm" href="javasrcit:void(0)">
          <img src="resources/products/hao/middle01.jpg" width="516px" height="200px" style="display: inline-block;">
        </a>
      </div>

     <!--  <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
       <a href="product_info.htm">
         <img src="resources/products/hao/small03.jpg" width="130" height="130" style="display: inline-block;">
       </a>
       <p><a href="product_info.html" style='color:#666'>冬瓜</a></p>
       <p><font color="#E4393C" style="font-size:16px">&yen;299.00</font></p>
      </div>
 -->

    </div>
  </div>

</div>
<%@ include file="foot.jsp"%>
</body>
</html>
