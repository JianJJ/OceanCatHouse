<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>

<h3>Welcome ${user.custid}</h3>

<h3><a href="<c:url value="/views/secure/login.page" />">Login</a></h3>
<h3><a href="<c:url value="/views/pages/product.isp" />">Product</a></h3>
<h3><a href="<c:url value="/views/ShoppingMall.jsp" />">ShoppingMall</a></h3>
<h3><a href="<c:url value="/views/login.html" />">login</a></h3>
<h3><a href="<c:url value="/views/signup.html" />">signup</a></h3>
</body>
</html>