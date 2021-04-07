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
    <title>添加医生</title>
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
            <form action="addDoctor" method="post">
                <table class="altrowstable" id="alternatecolor">
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="doctorname"/></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                        <label for="male">男</label><input type="radio" name="sex" id="male" value="男"/>
                        <label for="female">女</label><input type="radio" name="sex" id="female" value="女"/>
                    </td>
                </tr>
                <tr>
                    <td>科室</td>
                    <td><select name="departid" id="keshi"/></td>
                </tr>
                <tr>
                    <td>职称</td>
                    <td><input type="text" name="zhicheng"/></td>
                </tr>
                <tr>
                    <td>电话</td>
                    <td><input type="text" name="phone"/></td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td><textarea rows="3" cols="20"></textarea></td>
                </tr>
                <tr>
                    <td><input type="reset" value="清空"/></td>
                    <td><input type="submit" value="添加"></td>
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
        getDepartment();
    }
    function getDepartment(){
        $.ajax({
            url:"../department/findAll",
            type:"post",
            data:{},
            dataType:"json",
            success:function (data){
                var str="";
                for (i in data){
                    str+="<option value='"+data[i].departid+"'>"+data[i].departname+"</option>";
                }
                $("#keshi").html(str);
                str="";
            },
            error:function (){
                alert("系统异常，请稍后再试！");
            }
        });
    }
</script>
</body>
</html>
