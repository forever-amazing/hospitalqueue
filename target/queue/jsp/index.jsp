<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2020/12/14
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导航首页</title>
</head>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    div {
        margin: 100px auto;
        display: flex;
        width: 1000px;
        height: 500px;
    }

    div a {
        display: inline-block;
        flex: 1;
        text-align: center;
        line-height: 480px;
        background-color: pink;
        text-decoration: none;
        font-size: 25px;
        color: #09bb07;
    }

    div a:nth-child(1) {
        background: url("/queue/images/doctor.png") no-repeat center;
        background-size: 100%;
    }
    div a:nth-child(2) {
        background: url("/queue/images/patient.png") no-repeat center;
        background-size: 100%;
    }
    div a:nth-child(3) {
        background: url("/queue/images/admin.jpg") no-repeat center;
        background-size: 100%;
    }
    h3{
        text-align: center;
        margin: 0 auto;
    }

</style>


<body>

    <h3>请选择你的角色</h3>
    <div>
        <a href="jsp/doctorLogin.jsp" title="医生"></a>
        <a href="jsp/patientIndex.jsp" title="患者"></a>
        <a href="jsp/userLogin.jsp" title="管理员"></a>
    </div>

</body>
</html>
