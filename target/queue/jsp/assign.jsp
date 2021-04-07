<%--
  Created by IntelliJ IDEA.
  User: 黄鼎明
  Date: 2021/3/11
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加医生</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script type="text/javascript" src="${path}/js/jquery.js"></script>
    <link rel="stylesheet" href="../css/index.css" >
</head>
<body>
    <label>${param.departname}</label>
    <form id="selectForm" action="${path}/user/assign" method="post" onsubmit="tip()">
        <table class="altrowstable" id="alternatecolor">
            <tr>
                <td>
                    <select id="selectDoctor" name="doctorid"></select>
                    <input type="hidden" name="departid" value="${param.departid}">
                </td>
                <td><input type="submit" value="提交"></td>
            </tr>
        </table>
    </form>





<script type="text/javascript">
    window.onload=function () {
        altRows('alternatecolor');
        getAllDoctors();
    }

    function tip() {
        alert("添加成功");
        close();
    }

    //获取所有医生 异步
    function getAllDoctors() {
        $.ajax({
            url:"${path}/user/getAllDoctors",
            type:"post",
            data:{},
            dataType:"json",
            success:function (data) {
                var str="";
                for (i in data){
                    str+="<option value="+data[i].doctorid+">"+data[i].doctorname+"</option>";
                }
                $("#selectDoctor").html(str);
            }
        });

    }
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


</script>

</body>
</html>
