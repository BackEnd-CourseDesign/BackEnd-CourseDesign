<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24 0024
  Time: 上午 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/back.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
</head>
<body>
<form  method="post">
    <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="26">
                <STRONG>编辑分类</STRONG>

            </td>
        </tr>

        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                分类名称：
            </td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <input type="text" name="cname" value="${category.cname}" id="userAction_save_do_logonName" class="bg"/>
            </td>
        </tr>

        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
                    &#30830;&#23450;
                </button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <span id="Label1"></span>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
