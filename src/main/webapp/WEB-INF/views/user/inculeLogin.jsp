
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link rel="stylesheet" href="/recipe/css/login.css">
    <meta name="google-signin-client_id"
          content="849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com">
    <!-- <script src="https://www.google.com/recaptcha/enterprise.js?render=6LeXNhobAAAAALNu0-Dr6ALnwTk8WLYsEsS8NNam"async defer></script> -->
    <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>
</head>
<body>
<div class="center">
   <!-- 網頁中間內文 -->
    <div class="main">
        <div class="grid-row">
            <div class="loginTitle">✿海貓食屋✿</div>
            <button class="loginReturn" onclick=window.location.href="/recipe">X</button>

            <div class="g-signin2" data-onsuccess="onSignIn" data-width="376" data-height="50"
                 data-longtitle="true"></div>

            <button type="button" class="btn btn-primary phone">使用手機號碼登入</button>
            <p>__________________________________________________</p>
            <form action="/recipe/signup/cat">
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


<%--<script src="/recipe/js/recaptcha.js"></script>--%>
<%--<script src="/recipe/js/oauth.js"></script>--%>
<script>
    $(".phone").click(function () {
        window.location.href = "/recipe/views/phoneLogin";
    });
</script>
</div>
</body>
</html>
