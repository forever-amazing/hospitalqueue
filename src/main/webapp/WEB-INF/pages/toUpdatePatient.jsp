<%--
  Created by IntelliJ IDEA.
  User: 天线宝宝
  Date: 2020/12/16
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>病人信息更新</title>
    <script type="text/javascript" src="../js/jquery.js"></script>
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
            <form action="updatePatient" method="post">
    <table class="altrowstable" id="alternatecolor">
        <tr>
            <td>身份证号：</td>
            <td><label>${patient.sidno}</label></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>
                <input type="text" name="patientname" value="${patient.patientname}">
                <input type="hidden" name="patientid" value="${patient.patientid}">
            </td>

        </tr>
        <tr>
            <td>性别</td>
            <td><input type="text" name="sex" value="${patient.sex}"></td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type="text" name="age" value="${patient.age}"></td>
        </tr>
        <tr>
            <td>地址</td>
            <td><input type="text" name="address" value="${patient.address}"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="phone" value="${patient.phone}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="提交">
            </td>
        </tr>

    </table>
</form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#out").click(function (){
        var result = confirm("您确定要退出吗？");
        if(result){
            window.location.href="clearSession";
        }

    })
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

    window.onload=function(){
        altRows('alternatecolor');
    }
</script>
</body>
</html>
