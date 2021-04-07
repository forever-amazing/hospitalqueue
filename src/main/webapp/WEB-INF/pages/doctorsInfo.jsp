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
    <title>医生管理</title>
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
            <table class="altrowstable" id="alternatecolor">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><form id="find" ><input placeholder="姓名" type="text" name="onename"/></form></td>
                    <td class="operate"><img src="${path}/images/crudlogo/find.jpeg" title="查询" onclick="findSomeDoctors()"/></td>
                    <td></td>
                    <td class="operate"><img src="${path}/images/crudlogo/add.jpg" title="添加" onclick="addDoctor()"/></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>编号</td>
                    <td>名字</td>
                    <td>账号</td>
                    <td>密码</td>
                    <td>性别</td>
                    <td>科室</td>
                    <td>职称</td>
                    <td>电话</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                <tbody id="adminTbody">
                <c:set var="i" value="1" scope="page"></c:set>
                <c:forEach items="${doctors}" var="doctor">
                    <tr>
                        <td>${i}</td>
                        <td>${doctor.doctorname}</td>
                        <td>${doctor.account}</td>
                        <td>${doctor.password}</td>
                        <td>${doctor.sex}</td>
                        <td>${doctor.departid}</td>
                        <td>${doctor.zhicheng}</td>
                        <td>${doctor.phone}</td>
                        <td>${doctor.state}</td>
                        <td class="operate">
                            <img src="${path}/images/crudlogo/update.jpeg" alt="toUpdateDoctor?doctorid=${doctor.doctorid}" title="更新" onclick="updateDoctor(this)"/>
                            <img src="${path}/images/crudlogo/reset.jpeg" alt="${doctor.doctorid}" title="重置密码" onclick="resetPassword(this)"/>
                            <img src="${path}/images/crudlogo/delete.jpeg" alt="${doctor.doctorid}" title="辞职" onclick="resign(this)"/>
                        </td>
                    </tr>
                    <c:set var="i" value="${i+1}" scope="page"></c:set>
                </c:forEach>
                <c:set var="i" value="1" scope="page"></c:set>
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
    //加载完初始化
    window.onload=function(){
        altRows('alternatecolor');
        init();
    }
    //查询  筛选
    function findSomeDoctors() {
        $("#find").attr("action","findSomeDoctors");
        $("#find").attr("method","post");
        $("#find").submit();
    }
    //添加  转页
    function addDoctor() {
        window.location.href="toAddDoctor";
    }

    //删除  异步
    function resign(node) {//辞职
        var doctorid = node.getAttribute("alt");
        $.ajax({
            url:"resign",
            type:"post",
            data:{"doctorid":doctorid},
            dataType:"json",
            success:function (data) {
                window.location.href="findAllDoctor";
            }
        });

    }

    //修改  转页
    function updateDoctor(node) {
        link_str = node.getAttribute("alt");
        window.location.href=link_str;
    }

    //重置  异步
    function resetPassword(node) {//辞职
        var doctorid = node.getAttribute("alt");
        $.ajax({
            url:"resetPassword",
            type:"post",
            data:{"doctorid":doctorid},
            dataType:"json",
            success:function (data) {
                window.location.href="findAllDoctor";
            }
        });

    }
</script>
</body>
</html>
