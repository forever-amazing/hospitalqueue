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
    <title>医生信息更新</title>
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
            <form action="updateDoctor" method="post">
                <table class="altrowstable" id="alternatecolor">
                    <tr>
                        <td>姓名</td>
                        <td>
                            <input type="hidden" name="doctorid" value="${doctor.doctorid}" id="doctorid"/>
                            <input type="text" name="doctorname" value="${doctor.doctorname}"/>
                        </td>

                    </tr>
                    <tr>
                        <td>账号</td>
                        <td>
                            <input type="text" name="account" value="${doctor.account}"/>
                            <input type="hidden" name="password" value="${doctor.password}"/>
                            <input type="hidden" name="state" value="${doctor.state}">
                        </td>

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
                        <td><select name="departid" id="keshi" value="${doctor.departid}"></select></td>
                    </tr>
                    <tr>
                        <td>职称</td>
                        <td><input type="text" name="zhicheng" value="${doctor.zhicheng}"/></td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input type="text" name="phone" value="${doctor.phone}"/></td>
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
        var sex = "${doctor.sex}";
        if(sex=="男"){
            $("#male").prop("checked",true);
        }else {
            $("#female").prop("checked",true);
        }
        $("#description").val("${doctor.description}");
        getDepartment();

    }

    function getDepartment(){
        var keshi = ${doctor.departid};
        $.ajax({
            url:"../department/findAll",
            type:"post",
            data:{},
            dataType:"json",
            success:function (data){
                var str="";
                for (i in data){
                    if(data[i].departid==keshi){
                        str+="<option value='"+data[i].departid+"' selected>"+data[i].departname+"</option>";
                    }else{
                        str+="<option value='"+data[i].departid+"'>"+data[i].departname+"</option>";
                    }

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
