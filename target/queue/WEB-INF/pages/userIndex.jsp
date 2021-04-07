<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2020/12/14
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script type="text/javascript" src="${path}/js/jquery.js"></script>
    <script type="text/javascript" src="${path}/js/page.js"></script>
    <link rel="stylesheet" href="../css/index.css" >
</head>
<body>
<header>
    <p>${sessionScope.username}
        <a href="javascript:;" id="out">退出</a>
    </p>
</header>
<div id="title">
    <h1 class="w">医院分诊叫号系统</h1>
</div>
<div class="wrap w clearfix">
    <div class="nav">
        <a href="findAllPatient">病人管理</a>
        <a href="findAllDoctor">医生管理</a>
        <a href="findAllDepartment">科室管理</a>
    </div>
    <div class="main">
        <div class="option">

        </div>
        <div class="content">
            <table class="altrowstable" id="alternatecolor">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><form id="find" ><input placeholder="姓名" type="text" name="onename"/></form></td>
                    <td class="operate"><img src="${path}/images/crudlogo/find.jpeg" title="查询" onclick="findSomePatients()"/></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>编号</td>
                    <td>名字</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>身份证号</td>
                    <td>地址</td>
                    <td>电话</td>
                    <td>操作</td>
                </tr>
                <tbody id="adminTbody">
                    <c:set var="i" value="1" scope="page"></c:set>
                    <c:forEach items="${patients}" var="patient">
                        <tr>
                            <td>${i}</td>
                            <td>${patient.patientname}</td>
                            <td>${patient.sex}</td>
                            <td>${patient.age}</td>
                            <td>${patient.sidno}</td>
                            <td>${patient.address}</td>
                            <td>${patient.phone}</td>
                            <td><a href="toUpdate?patientid=${patient.patientid}">更新</a></td>
                        </tr>
                        <c:set var="i" value="${i+1}" scope="page"></c:set>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        <jsp:include page="page.jsp"/>
    </div>
</div>
<script type="text/javascript">
    //退出
    $("#out").click(function (){
        var result = confirm("您确定要退出吗？");
        if(result){
            window.location.href="clearSession";
        }
    })
    //改变表格样式
    function altRows(id){
        if(document.getElementsByTagName){
            var table = document.getElementById(id);
            var rows = table.getElementsByTagName("tr");

            for(i = 0; i < rows.length; i++){
                if(i % 2 == 0){
                    rows[i].className = "evenrowcolor";
                }else{
                    rows[i].className = "oddrowcolor";
                }
            }
        }
    }

    //模糊查询病人
    function findSomePatients(){
        $("#find").attr("action","findSomePatients");
        $("#find").attr("method","post");
        $("#find").submit();
    }

    //加载完初始化
    window.onload=function(){
        altRows('alternatecolor');
        init();
    }
</script>
</body>
</html>
