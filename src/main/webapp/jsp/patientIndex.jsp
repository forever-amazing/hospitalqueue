<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 天线宝宝
  Date: 2020/12/14
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>患者挂号</title>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <link rel="stylesheet" href="../css/index.css" >
</head>
<body>
<header>
    <p>
        &nbsp;
    </p>
</header>

    <h1 class="w">医院分诊叫号系统</h1>
    <div class="wrap w clearfix">
        <div class="nav">
            <a href="../patient/findAllWaitGuahao">就诊队列</a>
        </div>

        <div class="main">
            <div class="option">
                <a href="patientIndex.jsp">挂号</a>&nbsp;&nbsp;
                <a href="out.jsp">退号</a>&nbsp;&nbsp;
                <a href="change.jsp">转科</a>
            </div>
            <div class="content">
                <table class="altrowstable" id="alternatecolor">
                    <form action="../patient/guahao" method="post">
                        <tr>
                            <td>身份证号：</td>
                            <td><input type="text" name="sidno"></td>
                        </tr>
                        <tr>
                            <td>科室：</td>
                            <td><select name="departid" id="keshi" onblur="javascript:getDoctor()"></select></td>
                        </tr>
                        <tr>
                            <td>医生：</td>
                            <td><select name="doctorid" id="yisheng"></select></td>
                        </tr>

                        <tr>
                            <td><input type="submit" value="挂号"></td>
                            <td></td>
                        </tr>

                    </form>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
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
            getDepartment();
        }
    </script>

</body>
</html>
