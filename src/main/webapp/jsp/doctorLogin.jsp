<%--
  Created by IntelliJ IDEA.
  User: 天线宝宝
  Date: 2020/12/14
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医生登录</title>
    <link rel="stylesheet" href="../css/index.css" >
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        div {
            width: 100%;
            height: 500px;
            overflow: hidden;
            background: url("${path}/images/hongshizi.png") no-repeat center;
            background-size: 45%;
            opacity: .5;
        }

        form {
            margin: 50px auto;
            margin-top: 85px;
            width: 300px;
            height: 300px;
            background-color: #fff;
            border: 1px solid #333;
            text-align: center;
        }

        span {
            color: #fff;
        }

        input {
            display: inline-block;
            padding: 30px 0;
            margin-top: 10px;
            width: 250px;
            height: 30px;
            border: none;
            border-bottom: 1px solid #ccc;
        }

        .btn {
            width: 90%;
            height: 40px;
            line-height: 6px;
            font-size: 16px;
            border: none;
            color: #fff;
            background-color: #4771f7;
        }
        h3{
            text-align: center;
        }
    </style>
</head>
<body>
    <h1 class="w">医院分诊叫号系统</h1>

    <div class="w" >
        <form action="../doctor/login" method="post">
            <h3>医生登录</h3><br>
            <input type="text" name="doctorid" placeholder="工号"><br>
            <input type="password" name="password" placeholder="密码"><br>
            <input type="submit" value="登录" class="btn"><br>

        </form>
    </div>
</body>
</html>
