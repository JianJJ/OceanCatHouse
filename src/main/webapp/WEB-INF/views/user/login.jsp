<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <%-- bootstrap的CSS、JS樣式放這裡 --%>
    <link rel="stylesheet" href="/recipe/css/bootstrap.min.css">
    <link rel="stylesheet" href="/recipe/css/bootstrap.rtl.min.css">

    <%-- jQuery放這裡 --%>
    <script src="/recipe/js/jquery-3.6.0.min.js"></script>
    <script src="../js/jquery-3.4.1.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/top_nav.css">

    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <%--	GOOGLE--%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
          content="849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com">
    <!-- <script src="https://www.google.com/recaptcha/enterprise.js?render=6LeXNhobAAAAALNu0-Dr6ALnwTk8WLYsEsS8NNam"async defer></script> -->
    <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>
    <link rel="stylesheet" href="../css/demo.css">
    <link rel="stylesheet" href="../css/login.css">
    <title>✿海貓食屋✿</title>

</head>

<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<canvas id="canvas"></canvas>
<!-- header部分 -->

<!-- 中間部分 -->
<div class="center">

    <!-- 左邊浮動區塊 -->
    <div class="barNav">
        <ul>
            <li class="fontIcon"></li>
            <li class="fontIcon"></li>
            <li class="fontIcon"></li>
            <li class="fontIcon"></li>
        </ul>
    </div>


    <!-- 網頁中間內文 -->
    <div class="main">
        <div class="grid-row">
            <div class="loginTitle">✿海貓食屋✿</div>
            <button class="loginReturn" onclick=window.location.href="/recipe">X</button>

            <div class="g-signin2" data-onsuccess="onSignIn" data-width="376" data-height="50"
                 data-longtitle="true"></div>

            <button type="button" class="btn btn-primary phone">使用手機號碼登入</button>
            <p>__________________________________________________</p>
            <form action="/recipe/signup/login">
                <input class="formCSS" type="email" placeholder='Email' name="email" value="${email}"><br>
                <span class="error">${errors.email}</span><br>
                <input class="formCSS" type="password" placeholder="密碼" name="userpassword" value="${userpassword}"><br>
                <span class="error">${errors.userpassword}</span><br>
                <div class="g-recaptcha"
                     data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                     data-callback='verifyCallback' data-action='ubmit'>Submit
                </div>
                <br> <span class="error">${errors.recaptcha}</span><br>

                <input class="formSubmit" type="submit"><br>
            </form>
            <style>

            </style>


            <a href="/recipe/views/forget">忘記密碼?</a><br> <br> <br>
            <span>還沒有帳號? </span><a href="/recipe/views/signup"> 註冊</a>
        </div>
    </div>

    <!-- 右邊至頂 -->

    <div class="toUP">
        <span class="fontIcon" id="toUp"></span>
    </div>
</div>

<script src="../js/umbrella.js"></script>
<script src="../js/recaptcha.js"></script>
<script src="../js/oauth.js"></script>
<script>
    $(".phone").click(function () {
        window.location.href = "/recipe/views/phoneLogin";
    });
</script>
</div>
</body>

</html>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>