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
    <title>患者退号</title>
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
                    <form action="../patient/tuihao" method="post" name="form2" onsubmit="return tuihao()" >
                        <tr>
                            <td>号码：</td>
                            <td><input type="text" name="guahaoid" id="guahaoid"></td>
                        </tr>
                        <tr>
                            <td>身份证号：</td>
                            <td><input type="text" name="sidno" id="sidno" onblur="quzhi()"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="退号"/></td>
                            <td></td>
                        </tr>




                    </form>
                </table>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        function tuihao() {


            if (confirm("确认退号吗？")){
                return true;
            }else{
                return false;
            }

        }
        function quzhi() {
            var value = $("#guahaoid").val();
            //取值
            if(value==""){
                $("#guahaoid").val(-1);
                value = -1;

            }

            $.ajax({
                url:"../patient/findGuahaoById",
                type:"post",
                data:{"guahaoid":value,
                      "sidno":$("#sidno").val(),
                },
                dataType:"json",
                success:function (data){
                    if(data.doctor==null){
                        alert("不存在这条挂号信息");
                    }else{
                        alert("挂号码："+data.guahaoid+"\n医生名字:"+data.doctor.doctorname+"\n病人名字："+data.patient.patientname);
                    }

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
