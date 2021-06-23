<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<!-- 123 -->
<%--	<h3>Welcome ${user.custid}</h3>--%>
<%--　　<c:if test="${!empty user.custid}">--%>
<%--　　<h3>Welcome ${user.custid}</h3>--%>
<%--　　</c:if>--%>
<%--<h3>Welcome ${user.custid}</h3>--%>


<h3><a href="<c:url value="/views/login" />">login</a></h3>
<h3><a href="<c:url value="/views/signup" />">signup</a></h3>
<h3><a href="<c:url value="/views/ShoppingMall" />">ShoppingMall</a></h3>
<h3><a href="<c:url value="/backstage/time" />">員工登入</a></h3>
<hr/>
<h3><a href="<c:url value="/createRecipe/start"/>">createRecipe</a></h3>
<h3><a href="<c:url value="/backstage/home" />">backstageHome</a></h3>
<h3><a href="<c:url value="/userBack/home" />">userBackHome</a></h3>
<br><br><br>

	

</body>
</html>