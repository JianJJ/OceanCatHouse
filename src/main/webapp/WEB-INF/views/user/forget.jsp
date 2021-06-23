<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>

    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <script src="${pageContext.request.contextPath}/js/recipeDetails.js"></script>

    <meta charset="UTF-8">
    <%--    google--%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <!-- <script src="https://www.google.com/recaptcha/enterprise.js?render=6LeXNhobAAAAALNu0-Dr6ALnwTk8WLYsEsS8NNam"async defer></script> -->
    <script src="https://www.google.com/recaptcha/enterprise.js"async defer></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <title>✿海貓食屋✿</title> 
</head>

<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
    <canvas id="canvas"></canvas>
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
                <button class="loginReturn" onclick=window.location.href="/OceanCatHouse">X</button>
                <p>__________________________________________________</p>
                <form action="/OceanCatHouse/forget/controller">
                    <input class="formCSS" type="email" placeholder="Email" name="email" value="${email}"><br>
                    <span class="error">${errors.email}</span><br>
                                    <div class="g-recaptcha"
                data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                data-callback='verifyCallback'></div><br> 
                <span class="error">${errors.recaptcha}</span> <br>
                    <br><input class="formSubmit" type="submit"><br>
                </form>

                <a href="/OceanCatHouse/views/login">  返回登入</a>
            </div>
        </div>

        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon" id="toUp"></span>
        </div>
    </div>


    <script >
        var x = [];
        var y = [];
        var d = [];//下落速度
        var size = [];
        var canvas = document.getElementById("canvas");
        var w = canvas.width = window.innerWidth;
        var h = canvas.height = window.innerHeight;

        var ctx = canvas.getContext("2d");
        ctx.fillStyle = "red";
        for (var s = 0; s < 200; s++) {
            x[s] = window.innerWidth * Math.random();
            y[s] = window.innerHeight * Math.random();
            d[s] = Math.random() * 3 + 1;
            size[s]=Math.floor( Math.random() * 3+1);
            console.log(size[s]);
        }

        setInterval(() => {
            ctx.clearRect(0, 0, w, h);

            for (var i = 0; i < 200; i++) {
                x[i] = x[i] + Math.random()*3;
                y[i] = y[i] + d[i];
                ctx.fillRect(x[i], y[i], 3,3);
                if (y[i] > h) y[i] = 0;
                if (x[i] > w) x[i] = 0;

            }
        }, 100);
    </script>
    <script src="../js/recaptcha.js"></script>
    <!-- 拼接footer -->
    <jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>

</html>