<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style>
    body {
      background-color:#0d1326;
    }
    #timeCenter {
      color: #ffffff;
      position: relative;
      top : 350px;
      margin:  auto;
      width: 40px;
    }
    form{
      position:absolute;
      left: 45%;
      top :700px;
      
    }
  </style>
</head>
<body>

<div id="timeCenter">Error</div>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
<form action="${pageContext.request.contextPath}/backstage/home" method="post">
  <input type="text" placeholder="帳號" name="userName" value="AAA@AAA.com"><br>
  <input type="password" placeholder="密碼"name="userPassword" value="AAA"><br>
  <input type="submit" value="登入">

</form>

<br/>
</body>
</html>