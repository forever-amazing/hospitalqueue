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
    <title>科室医生列表</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script type="text/javascript" src="${path}/js/jquery.js"></script>
</head>
<body>


    <table class="altrowstable" id="alternatecolor">
        <tr><th><label id="keshi"></label>的医生列表</th></tr>
        <tr>
            <td>姓名：</td>
        </tr>
        <tbody id="adminTbody">
        </tbody>
    </table>



<script type="text/javascript">
    window.onload=function () {
        findDoctorsByDepartid();
        //resolve();
    }

    //根据departid异步查询医生
    function findDoctorsByDepartid() {
        $.ajax({
           url:"${path}/user/findDoctorsByDepartid",
           type:"post",
           data:{"departid":${param.departid}},
           dataType:"json",
           success:function (data) {
               var table = "";
               for(i in data){
                   table+="<tr>";
                       table+="<td>";
                            table+=data[i].doctorname;
                       table+="</td>";
                   table+="</tr>";
               }
               $("#keshi").text(data[0].department.departname);
               $("#adminTbody").append(table);
           }
        });

    }



    //解析字符串
    function resolve() {
        var text = "${param.hiddentext}";
        var arr1 = text.split(";");
        var departname = arr1[0];
        $("#keshi").val(departname);
        var table = "<table>";
        for(var i=1;i<arr1.length-1;i++){
            table+="<tr>";
            var arr2 = arr1[i].split(",");
            var doctorname = arr2[0];
            var account = arr2[1];
            var password = arr2[2];
            var state = arr2[3];
            table+="<td>"+doctorname+"</td>";
            table+="<td>"+account+"</td>";
            table+="<td>"+password+"</td>";
            table+="<td>"+state+"</td>";
            table+="</tr>";
        }
        table+= "</table>";
        $("body").append(table);
    }
</script>

</body>
</html>
