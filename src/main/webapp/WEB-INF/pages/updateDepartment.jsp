<%--
  Created by IntelliJ IDEA.
  User: 天线宝宝
  Date: 2021/3/9
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>科室信息更新</title>
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
    <div class="nav"><%--左侧目录--%>
        <a href="findAllPatient">病人管理</a>
        <a href="findAllDoctor">医生管理</a>
        <a href="findAllDepartment">科室管理</a>
    </div>
    <div class="main">
        <div class="option"><%--顶上标题--%>

        </div>
        <div class="content"><%--主要内容--%>
            <form action="updateDepartment" method="post">
                <table class="altrowstable" id="alternatecolor">
                    <tr>
                        <td>名称</td>
                        <td>
                            <input type="hidden" name="departid" value="${department.departid}" id="departid"/>
                            <input type="text" name="departname" value="${department.departname}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>描述</td>
                        <td><textarea rows="3" cols="20" name="description" id="description"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="修改"></td>
                    </tr>


                </table>
            </form>

        </div>
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

    //加载完初始化
    window.onload=function(){
        altRows('alternatecolor');
        initText();
    }
    function initText(){
        $("#description").val("${department.description}");
    }

</script>
</body>
</html>
