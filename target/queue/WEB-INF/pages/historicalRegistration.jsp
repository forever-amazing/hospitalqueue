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
    <title>医生历史诊断</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script type="text/javascript" src="${path}/js/jquery.js"></script>
    <script type="text/javascript" src="${path}/js/page.js"></script>
    <link rel="stylesheet" href="../css/index.css" >
</head>
<body>
    <header>
    <p>${doctor.doctorname}医生
        <a href="javascript:;" id="out">退出</a>
    </p>
    </header>
    <div id="title">
        <h1 class="w">医院分诊叫号系统</h1>

    </div>
    <div class="wrap w clearfix">
        <div class="nav">
            <a href="findAllWaitGuahao?doctorid=${doctor.doctorid}">候诊队列</a>
            <a href="historicalRegistration?doctorid=${doctor.doctorid}">历史诊断</a>
        </div>
        <div class="main">
            <div class="option">

            </div>
        <div class="content">
            <table class="altrowstable" id="alternatecolor">
                <tr>
                    <td></td>
                    <td><form id="find" ><input placeholder="姓名" type="text" name="onename" /></form></td>
                    <td class="operate"><img src="${path}/images/crudlogo/find.jpeg" title="查询" onclick="findGuahao()"/></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>号码</td>
                    <td>病人</td>
                    <td>科室</td>
                    <td>医生</td>
                    <td>时间</td>
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

        $("#out").click(function (){
            var result = confirm("您确定要退出吗？")
            if(result){
                window.location.href="clearSession";
            }

        })

        //根据病人名字模糊查询挂号信息
        function findGuahao() {
            $("#find").attr("action","fuzzyQueryByName");
            $("#find").attr("method","post");
            $("#find").submit();

        }


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
