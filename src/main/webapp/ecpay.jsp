<%--
  Created by IntelliJ IDEA.
  User: louisjian
  Date: 2021/6/30
  Time: 8:14 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script>
        testclick = function (){
            $.ajax({
                url : "/OceanCatHouse/ecpayOrder",
                type : "POST",
                cache : false,
                async : false,
                success : function (form) {
                    $('#testEcpay').append(form);
                },
                error : function (returndata){
                    alert("發生錯誤請聯繫我們")
                }
            })
        }
    </script>
</head>
<body>
<button type="button" id="" onclick="testclick()">go</button>
<div id="testEcpay"></div>
</body>
</html>
