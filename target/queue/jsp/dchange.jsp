<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2020/12/14
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>转科详情</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
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
            <a href="${path}/doctor/findAllWaitGuahao?doctorid=${doctor.doctorid}">候诊队列</a>
            <a href="${path}/doctor/historicalRegistration?doctorid=${doctor.doctorid}">历史诊断</a>
        </div>
        <div class="main">
            <div class="option">

            </div>
            <div class="content">
                <table class="altrowstable" id="alternatecolor">
                <form action="../doctor/dchange" method="post">
                    <tr>
                        <td>编号：</td>
                        <td><input type="text" name="guahaoid" id="guahaoid" value="${param.guahaoid}"></td>
                        <td><input type="reset" value="重填"></td>
                    </tr>
                    <tr>
                        <td>身份证号：</td>
                        <td><input type="text" name="sidno" id="sidno" value="${param.sidno}" onblur="javascript:getGuahao();"></td>
                        <td id="changeB"><input type="submit" value="转科"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>旧</td>
                        <td>新</td>
                    </tr>
                    <tr>
                        <td>科室：</td>
                        <td id="keshi_1">${param.departname}</td>
                        <td><select name="departid" id="keshi" onblur="javascript:getDoctor()"></select></td>
                    </tr>
                    <tr>
                        <td>医生：</td>
                        <td id="yisheng_1">${param.doctorname}</td>
                        <td><select name="doctorid" id="yisheng" ></select></td>
                    </tr>
                </form>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function getGuahao(){
            $.ajax({
                url:"../patient/findGuahaoById",
                type:"post",
                data:{"guahaoid":$("#guahaoid").val(),
                      "sidno":$("#sidno").val(),
                },
                dataType:"json",
                success:function (data){
                    var str="";
                    if(data.doctor==null){
                        alert("不存在这条挂号信息");
                        $("#keshi_1").html(str);
                        $("#yisheng_1").html(str);
                    }else{
                        //显示科室
                        str+=data.doctor.department.departname;
                        $("#keshi_1").html(str);
                        str="";
                        //显示医生
                        str+=data.doctor.doctorname;
                        $("#yisheng_1").html(str);
                    }
                    str="";
                    getDepartment();
                },
                error:function (){
                    alert("请按顺序输入");
                }
            });
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

        function getDoctor(){
            $.ajax({
                url:"../doctor/findByDepartid",
                type:"post",
                data:{"departid":$("#keshi").val()},
                dataType:"json",
                success:function (data){

                    var str="";
                    for (i in data){
                        str+="<option value='"+data[i].doctorid+"'>"+data[i].doctorname+"</option>";
                    }
                    $("#yisheng").html(str);
                    str="";
                },
                error:function (){
                    alert("系统异常，请稍后再试！");
                }
            });
        }

    </script>
    <script type="text/javascript">

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
