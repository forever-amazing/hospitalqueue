<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2021/3/9
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<body>
<div id="barcon" class="barcon" >
    <div id="barcon1" class="barcon1">123</div>
    <div id="barcon2" class="barcon2">
        <ul>
            <li><img src="${path}/images/pagelogo/firstpage.png" id="firstPage"/>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><img src="${path}/images/pagelogo/prepage.jpg" id="prePage"/>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><img src="${path}/images/pagelogo/nextpage.jpg" id="nextPage"/>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><img src="${path}/images/pagelogo/lastpage.png" id="lastPage"/>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><select id="jumpWhere"></select>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><img src="${path}/images/pagelogo/gopage.jpeg" id="jumpPage" onclick="jumpPage()"/>&nbsp;&nbsp;&nbsp;&nbsp;</li><%--<a href="###" id="jumpPage" onclick="jumpPage()">跳转</a>--%>
        </ul>
    </div>
</div>

</body>
</html>
