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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">

    <%-- jQuery放這裡 --%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">

    <title>✿海貓食屋✿</title>
</head>

<body>
<jsp:include page="./views/RecipePages/top_nav.jsp"></jsp:include>

<!-- 中間部分 -->
<div class="center">

    <div class="wallpaper" id="wallpaper1"><span><em>Cook and Life</em></span></div>

    <div class="contextBlock" id="block1">
        <div class="context">
            <hr>
            <h2>快樂下廚</h2>
            <p>
                尋找並分享日常烹飪靈感。 <br/>
                根據您喜歡的食物和您關注的朋友發現食譜、<br>廚師和操作方法。
            </p>
            <a href="${pageContext.request.contextPath}/recipeHome">探索食譜</a>


        </div>
        <div class="contextImg"> </div>
    </div>

    <div class="wallpaper" id="wallpaper2"><span><em>Ingredients for Cook</em></span></div>

    <div class="contextBlock" id="block2">
        <div class="contextImg"></div>
        <div class="context">
            <hr>
            <h2>健康料理</h2>
            <p>
                在線購買食材，並在您的冰庫中備有從味噌到起司再到意大利火腿的所有食材。
            </p>
            <a href="${pageContext.request.contextPath}/views/ShoppingMall">前往商城</a>


        </div>
    </div>
</div>
</body>

</html>

<%--拼接footer--%>
<jsp:include page="./views/RecipePages/bottom_nav.jsp"></jsp:include>