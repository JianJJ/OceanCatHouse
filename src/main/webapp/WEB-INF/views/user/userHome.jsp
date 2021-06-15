<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>✿海貓食屋✿</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <!--    JavaScript; choose one of the two!-->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/jquery-3.6.0.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/createRecipe/createRecipeDetail.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">


</head>
<body>
<!--頁首-->
<header class="container-fluid mainColor">
    <div class="title">✿海貓食屋✿</div>
    <div class="littleNav">
        <ul>
            <li><a href="#" class="top">RECIPES</a></li>
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
<%--主體--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
<%--       放搜尋食譜 欄位--%>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
<%--            個人頭 加一張漂亮的照片--%>
        </div>
    </div>

</div>

</div>
<!--頁尾-->
<footer class="container-fluid mainColor">
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
</body>
</html>
