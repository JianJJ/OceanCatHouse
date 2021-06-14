<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <script src="../js/jquery-3.4.1.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <!-- <script src="https://www.google.com/recaptcha/enterprise.js?render=6LeXNhobAAAAALNu0-Dr6ALnwTk8WLYsEsS8NNam"async defer></script> -->
    <script src="https://www.google.com/recaptcha/enterprise.js"async defer></script>
    <link rel="stylesheet" href="../css/demo.css">
    <link rel="stylesheet" href="../css/login.css">
    <title>✿海貓食屋✿</title> 
</head>

<body>
    <canvas id="canvas"></canvas>
    <!-- header部分 -->
    <jsp:include page="/header.jsp"></jsp:include>
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
            <style>
                .grid-row{
                    height: 550px;
                }
                .main{
                height: 600px;
                }
            </style>
            <div class="grid-row">
                <div class="loginTitle">✿海貓食屋✿</div>
                <p>寄發密碼重設驗證信</p>
                <button class="loginReturn" onclick=window.location.href="/recipe">X</button>
                <p>__________________________________________________</p>
                <form action="/recipe/forget/controller">
                    <input class="formCSS" type="text" placeholder="Email" name="email" value="${email}"><br>
                    <span class="error">${errors.email}</span><br>
                                    <div class="g-recaptcha"
                data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                data-callback='verifyCallback'></div><br> 
                <span class="error">${errors.recaptcha}</span> <br>
                    <br><input class="formSubmit" type="submit"><br>
                </form>

                <a href="/recipe/views/login">  返回登入</a>
            </div>
        </div>

        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon" id="toUp"></span>
        </div>
    </div>

    <jsp:include page="/footer.jsp"></jsp:include>
    <script src="../js/umbrella.js"></script>
    <script src="../js/recaptcha.js"></script>
</body>

</html>