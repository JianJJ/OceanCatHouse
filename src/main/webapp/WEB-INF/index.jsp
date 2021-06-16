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
	<div class="g-signin2" data-onsuccess="onSignIn"></div>
	
	
	<a href="#" onclick="signOut();">Sign out</a>
	
	<script type="text/javascript">
		function onSignIn(googleUser) {
			//取得資料
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			var id_token = googleUser.getAuthResponse().id_token;
			//發送123
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/recipe/oauth');
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhr.onload = function() {
			  console.log('Signed in as: ' + xhr.responseText);
			};
			xhr.send('idtoken=' + id_token);
		}
	</script>
	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>
</body>
</html>