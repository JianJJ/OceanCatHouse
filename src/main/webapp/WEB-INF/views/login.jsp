<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <!-- <script>
        function onClick(e) {
          e.preventDefault();
          grecaptcha.enterprise.ready(function() {
            grecaptcha.enterprise.execute('6LeXNhobAAAAALNu0-Dr6ALnwTk8WLYsEsS8NNam', {action: 'LOGIN'}).then(function(token) {
                // Add your logic to submit to your backend server here.
            });
          });
        }
       </script> -->
</head>

<body>
    <canvas id="canvas"></canvas>
    <!-- header部分 -->
    <header class="mainColor">
        <div class="title">✿海貓食屋✿</div>
        <div class="littleNav">
            <ul>
                <li><a href="#" class="top">RECIPES</a> </li>
                <li><a href="#">SHOP</a></li>
            </ul>
        </div>
        <div class="simpleSearch">
            <input type="text" id="searchLine" placeholder="Search...">
            <label for="searchLine">
                <span class="fontIcon searchIcon"></span></label>
        </div>

        <div class="Login">
            <span class="text">SIGN UP</span><em>/</em>
            <span class="text">LOG IN</span>
        </div>

        <button class="userIcon"></button>
    </header>
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
                <div class="FaceBook">使用FaceBook登入</div> 
                <div class="FaceBook">使用手機號碼登入</div>
                <p>____________________________________________________</p>
                <form action="/recipe/signup/login">
                    <input class="formCSS" type="text" placeholder="Email" name="email"><br>
                    <input class="formCSS" type="text"placeholder="密碼" name="userpassword"><br>
                    <input class="formSubmit" type="submit"><br>
                </form>
                <div class="g-recaptcha"
                data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                data-callback='onSubmit'
                data-action='submit'>Submit</div><br>
                <a href="">忘記密碼?</a><br><br><br>
                <span>還沒有帳號?    </span><a href="/recipe/views/signup.jsp">  註冊</a>
            </div>
        </div>

        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon" id="toUp"></span>
        </div>
    </div>

    <footer class="mainColor">
        <dl>
            <dt>關於我們</dt>
            <dd><a href="#">公司資訊</a></dd>
            <dd><a href="#">徵才訊息</a></dd>
            <dd><a href="#">廣告合作</a></dd>
            <dd><a href="#">市集上架</a></dd>
            <dd><a href="#">品牌資產</a></dd>
            <dd><a href="#">隱私權與條款</a></dd>
        </dl>
        <dl>
            <dt>會員服務</dt>
            <dd><a href="#">個人頁面</a></dd>
            <dd><a href="#">食譜收藏</a></dd>
            <dd><a href="#">商品訂單</a></dd>
            <dd><a href="#">帳號設定</a></dd>
            <dd><a href="#">忘記密碼</a></dd>
            <dd><a href="#">VIP會員</a></dd>
        </dl>
        <dl>
            <dt>逛食譜</dt>
            <dd><a href="#">人氣食譜</a></dd>
            <dd><a href="#">新廚上菜</a></dd>
            <dd><a href="#">今日話題</a></dd>
            <dd><a href="#">醉心食譜</a></dd>
            <dd><a href="#">全部分類</a></dd>
        </dl>
    </footer>
    <script src="../js/umbrella.js"></script>
</body>

</html>