<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2021/3/9
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>科室管理</title>
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
                    <td><form id="find" ><input placeholder="名称" type="text" name="onename"/></form></td>
                    <td class="operate"><img src="${path}/images/crudlogo/find.jpeg" onclick="findSomeDepartments()" title="查询"/></td>
                    <td></td>
                    <td class="operate"><img src="${path}/images/crudlogo/add.jpg" onclick="addDepartment()" title="添加"/></td>
                </tr>
                <tr>
                    <td>编号</td>
                    <td>名称</td>
                    <td>描述</td>
                    <td>操作</td>
                </tr>
                <tbody id="adminTbody">
                <c:set var="i" value="1" scope="page"></c:set>
                <c:forEach items="${departments}" var="department">
                    <tr>
                        <td>${i}</td>
                        <td>${department.departname}</td>
                        <td>${department.description}</td>
                        <td class="operate">
                            <img src="${path}/images/crudlogo/update.jpeg" alt="toUpdateDepartment?departid=${department.departid}" title="更新" onclick="updateDepartment(this)"/>
                            <img src="${path}/images/crudlogo/addDoctor.jpeg" alt="${department.departid},${department.departname}" title="添加医生" onclick="assign(this)"/>
                            <img src="${path}/images/crudlogo/lookupDoctor.jpeg" alt="${department.departid}" title="查看医生" onclick="toDoctorPopup(this)"/>
                            <img src="${path}/images/crudlogo/delete.jpeg" alt="${department.departid}" title="删除" onclick="deleteDepartment(this)"/>
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
    function findSomeDepartments() {
        $("#find").attr("action","findSomeDepartments");
        $("#find").attr("method","post");
        $("#find").submit();
    }
    //添加  转页
    function addDepartment() {
        window.location.href="toAddDepartment";
    }

    //删除  异步
    function deleteDepartment(node) {
        var departid = node.getAttribute("alt");
        $.ajax({
            url:"deleteDepartment",
            type:"post",
            data:{"departid":departid},
            dataType:"json",
            success:function (data) {
                window.location.href="findAllDepartment";
            }
        });

    }

    //修改  转页
    function updateDepartment(node) {
        link_str = node.getAttribute("alt");
        window.location.href=link_str;
    }

    //查看本科室所有医生(弹窗)-----弹出的窗口去异步查询（将departid传到弹窗页面）
    function toDoctorPopup(node) {
        var departid = node.getAttribute("alt");
        var form="<form action='${path}/jsp/departmentDoctorPopup.jsp' method='post' id='tempForm' target='popupWin'>"
                    +"<input type='hidden' name='departid' id='departid'/>"
            +"</form>";
        $("body").append(form);
        $("#departid").val(departid);
        openWindow();  //先打开弹窗，接收数据
        $("#tempForm").submit();
        $("#tempForm").remove();

    }

    //弹窗
    function openWindow() {
        window.open("${path}/jsp/departmentDoctorPopup.jsp","popupWin","height=400,width=800,top=200,left=600,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
    }

    function assign(node) {
        var text = node.getAttribute("alt");
        var arr = text.split(",");
        window.open("${path}/jsp/assign.jsp?departid="+arr[0]+"&departname="+arr[1],"newWin","height=400,width=800,top=200,left=600,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");

    }

    //查看本科室所有医生(弹窗)-----本页面异步查询
    function toDoctorPopup2(node) {
        var departid = node.getAttribute("alt");
        $.ajax({
            url: "findDoctorsByDepartid",
            type: "post",
            data: {"departid":departid},
            dataType: "json",
            success:function (data) {
                var doctors = data;
                var str=""+doctors[0].department.departname+";";
                for (i in doctors){

                    str+= connected(doctors[i].doctorname,doctors[i].account,doctors[i].password,doctors[i].state);
                }
                alert(str);
                if($("#tempForm").length<=0){
                    var form = "";
                    form="<form action='${path}/jsp/departmentDoctorPopup.jsp' method='post' id='tempForm' target='popupWin'>"
                        +"<input type='hidden' name='hiddentext' id='hiddentext'/>"
                        +"</form>";
                    $("body").append(form);
                }
                $("#hiddentext").val(str);
                alert($("#hiddentext").val());
                openWindow();
                $("#tempForm").submit();
                $("#tempForm").remove();
            }
        });
    }

    //多参数拼接
    function connected(x) {   //A,B,C,D;
        var str = "";
        for(var i=0; i<arguments.length;i++){
            if(i==arguments.length-1){
                str+=arguments[i]+";";
            }else {
                str+=arguments[i]+",";
            }
        }
        return str;
    }

</script>


</body>
</html>
