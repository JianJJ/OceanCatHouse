<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/recipe/css/demo.css">
    <link rel="stylesheet" href="/recipe/css/homePage.css">


    <title>食譜主頁</title>
</head>

<body>

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

        <div class="wallpaper" id="wallpaper1"><span><em>Cook and Life</em></span></div>

        <div class="contextBlock" id="block1">
            <div class="context">
                <hr>
                <h2>Cook Happy</h2>
                <p>
                    Find and share everyday cooking inspiration. <br/>
                    Discover recipes, cooks, and how-tos based on the food you love and the friends you follow.
                </p>
                <a href="#">DISCOVER RECIPES</a>
                

            </div>
            <div class="contextImg"> </div>
        </div>

        <div class="wallpaper" id="wallpaper2"><span><em>Ingredients for cooks</em></span></div>

        <div class="contextBlock" id="block2">
            <div class="contextImg"></div>
            <div class="context">
                <hr>
                <h2>Cook Healthy</h2>
                <p>
                    Shop for ingredients online and stock your pantry with everything from miso to paneer to prosciutto.
                </p>
                <a href="#">GO FOR SHOP</a>
                

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
</body>

</html>