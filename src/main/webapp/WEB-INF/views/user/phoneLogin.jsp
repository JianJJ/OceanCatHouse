<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <%-- bootstrap的CSS、JS樣式放這裡 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">

    <%-- jQuery放這裡 --%>
<%--    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <script src="${pageContext.request.contextPath}/js/recipeHome.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
          content="849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <style>
    </style>
    <title>✿海貓食屋✿</title>
</head>

<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<canvas id="canvas"></canvas>


<!-- 中間部分 -->
<div class="center">

   


    <!-- 網頁中間內文 -->
    <div class="main">
        <div class="grid-row" style='height:770px;'>
            <div class="loginTitle">✿海貓食屋✿</div>
            
              <form action="/OceanCatHouse/signup/phoneLogin">
                <input class="formCSS" type="text" placeholder="手機號碼" name="userphone" value="${userphone}">
                <span class="error">${errors.userphone}</span><br>
                <input class="formCSS" type="text" placeholder="密碼" name="userpassword" value="${userpassword}">
                <span class="error">${errors.userpassword}</span><br>
                <div class="g-recaptcha"
                     data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                     data-callback='verifyCallback' data-action='ubmit'>Submit
                </div>
                 <br>
                <span class="error checkerror">${errors.recaptcha}</span>
                 <br><input class="formSubmit" type="submit" value="登入">

            </form>
            
             <a style='margin-left:125px;line-height:50px;' href="${pageContext.request.contextPath}/views/forget">忘記密碼?</a>
 			 
 			 <div class='orblock'><hr><span> 或是 </span><hr></div>
 			  <div class="g-signin2" style="margin-left:115px;" data-onsuccess="onSignIn" data-width="376" data-height="50"
                 data-longtitle="true"></div>
  <br>
 <br>
            
            <span style='margin:15px 0 0 50px;display:inline-block;'>還沒有帳號? </span><a style="color:#1497de;" href="${pageContext.request.contextPath}/views/signup"> 註冊</a>
        </div>
    </div>




<script src="../js/recaptcha.js"></script>
<script src="../js/oauth.js"></script>
<script>

var x = [];
var y = [];
var d = [];//下落速度
var size = [];
var canvas = document.getElementById("canvas");
var w = canvas.width = window.innerWidth;
var h = canvas.height = window.innerHeight;

var ctx = canvas.getContext("2d");


for (var s = 0; s < 350; s++) {
	
x[s] = window.innerWidth * Math.random();
y[s] = window.innerHeight * Math.random();
d[s] = Math.random() * 3 + 1;
size[s]=Math.floor( Math.random() * 3+1);

}

setInterval(() => {
ctx.clearRect(0, 0, w, h);

for (var i = 0; i < 350; i++) {
	if(i%3 === 0){
		ctx.fillStyle = "#0063c7";
	}else if(i%3 === 2) {
		ctx.fillStyle = "#33b5ac";
	} else {
		ctx.fillStyle = "#3340b5";
	}
x[i] = x[i] + Math.random()*3;
y[i] = y[i] + d[i];
ctx.fillRect(x[i], y[i], 3,3);
if (y[i] > h) y[i] = 0;
if (x[i] > w) x[i] = 0;

}
}, 100);
</script>
</body>

</html>