<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24 0024
  Time: 上午 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    body {background-color: #E6E6E6;margin: 0px;text-align:left;}
    td {font-size:12px;color:#303030;line-height:20px;}
    a:link,a:visited {color:#012F68;text-decoration: none;}
    a:hover {color: #406EA8;text-decoration:none}
</style>
<div class="dtree">

    <a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dtree.js" ></script>
    <script type="text/javascript">

        d = new dTree('d');
        d.add('01',-1,'菜单管理');

        d.add('0102','01','分类管理','','','mainFrame');
        d.add('010201','0102','分类列表','view/admin/category/list.jsp','','mainFrame');
        d.add('010202','0102','分类添加','view/admin/category/add.jsp','','mainFrame');
        d.add('0104','01','商品管理');
        d.add('010403','0104','商品列表','view/admin/product/list.jsp','','mainFrame');
        d.add('010401','0104','添加商品','view/admin/product/add.jsp','','mainFrame');
        document.write(d);

    </script>
</div>
