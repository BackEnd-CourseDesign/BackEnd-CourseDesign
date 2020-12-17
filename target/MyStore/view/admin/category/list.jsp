<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24 0024
  Time: 上午 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>商品列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <style type="text/css">
        .cate_tr{
            text-align: center;
        }
        .cate_tr:hover{
            background-color: white;
        }

    </style>
    <script>
    </script>
</head>
<body>
<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
    <tbody>
    <tr>
        <td  align="center" bgColor="#afd1f3">
            <strong>分类列表</strong>
        </td>
    </tr>
    <tr>
        <td  align="right">
            <a href="add.jsp" target="mainFrame">添加</a>
        </td>
    </tr>
    <tr>
        <td>
            <table cellspacing="0"   bordercolor="gray" border="1" style="width:100%;BORDER-COLLAPSE:collapse;">
                <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3;text-align: center;">
                    <td width="18%">
                        序号
                    </td>
                    <td width="47%">
                        分类名称
                    </td>
                    <td width="7%" >
                        操作
                    </td>
                </tr>
                <tr class="cate_tr tr_odd" >
                    <td>
                        1
                    </td>
                    <td>
                        手机数码
                    </td>
                    <td >
                        <a href="${pageContext.request.contextPath}/view/admin/category/edit.jsp" class="a_button_edit"></a>
                        &nbsp;&nbsp;
                        <a href="#" onclick="return confirm('您确定要删除吗？')" class="a_button_del"></a>
                    </td>
                </tr>
                <tr class="cate_tr tr_even" >
                    <td>
                        2
                    </td>
                    <td>
                        电脑办公
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/view/admin/category/edit.jsp" class="a_button_edit"></a>
                        &nbsp;&nbsp;
                        <a href="#" onclick="return confirm('您确定要删除吗？')" class="a_button_del"></a>
                    </td>
                </tr>
                <tr class="cate_tr tr_odd" >
                    <td>
                        3
                    </td>
                    <td>
                        母婴用品
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/view/admin/category/edit.html" class="a_button_edit"></a>
                        &nbsp;&nbsp;
                        <a href="#" onclick="return confirm('您确定要删除吗？')" class="a_button_del"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </tbody>
</table>

</body>
</html>