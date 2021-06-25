<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--拼接header--%>

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

    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
 	<link rel="stylesheet" href="/recipe/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
   <link rel="stylesheet" href="/recipe/css/homePage.css">
	
    <title>食譜主頁</title>
</head>

<body>


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
                <a href="${pageContext.request.contextPath}/recipeHome">DISCOVER RECIPES</a>
                

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
                <a href="${pageContext.request.contextPath}/views/ShoppingMall">GO FOR SHOP</a>
                

            </div>
        </div>
    </div>
</body>

</html>

<%--拼接footer--%>
