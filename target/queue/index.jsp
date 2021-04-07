<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2020/12/13
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>测试</h3>
    <form action="account/save" method="post">
        姓名：<input type="text" name="name"/>
        金额：<input type="text" name="money"/>
        <input type="submit" value="提交">
    </form>
    <a href="account/findAll">测试</a>
    <a href="department/findOne">测试2</a>
</body>
</html>
