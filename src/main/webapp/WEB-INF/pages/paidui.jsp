<%--
  Created by IntelliJ IDEA.
  User: 天线宝宝
  Date: 2020/12/14
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>患者就诊队列</title>
    <link rel="stylesheet" href="../css/index.css" >
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script type="text/javascript" src="${path}/js/jquery.js"></script>
    <script type="text/javascript" src="${path}/js/page.js"></script>

</head>
<header>
    <p>
        &nbsp;
    </p>
</header>
<body>
    <h1 class="w">医院分诊叫号系统</h1>
    <div class="wrap w clearfix">
        <div class="nav">
            <a href="../patient/findAllWaitGuahao">就诊队列</a>
        </div>
        <div class="main">
            <div class="option">
                <a href="../jsp/patientIndex.jsp">挂号</a>&nbsp;&nbsp;
                <a href="../jsp/out.jsp">退号</a>&nbsp;&nbsp;
                <a href="../jsp/change.jsp">转科</a>
            </div>
            <div class="content">
                <table class="altrowstable" id="alternatecolor">
                    <tr>
                        <td>编号</td>
                        <td>病人</td>
                        <td>科室</td>
                        <td>医生</td>
                        <td>挂号时间</td>
                        <td>状态</td>
                    </tr>
                    <tbody id="adminTbody">
                        <c:forEach items="${guahaos}" var="guahao">
                            <tr>
                                <td>${guahao.guahaoid}</td>
                                <td>${guahao.patient.patientname}</td>
                                <td>${guahao.doctor.department.departname}</td>
                                <td>${guahao.doctor.doctorname}</td>
                                <td>${guahao.time}</td>
                                <td>${guahao.state}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>



            </div>
            <jsp:include page="page.jsp"/>

        </div>
    </div>

    <script type="text/javascript">
        setInterval(function(){
            window.location.href="../patient/findAllWaitGuahao";
        }, 30000);
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
            init();
            }
    </script>
</body>
</html>
