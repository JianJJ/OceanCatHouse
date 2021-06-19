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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">
    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userFavoriteRec.css">
    <script src="${pageContext.request.contextPath}/js/userBack/favorites.js"></script>
</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

<%--主體--%>
<div class="container">
    <div class='row justify-content-around'>
        <section class="col-xs-12 col-lg-3" id='recCategoryList'>
            <h3>食譜收藏</h3>
            <hr>
            <div>
                <h6>收藏分類</h6>
                <button id="btnNewCategory"><span>+</span>新增分類</button>
            </div>
            <ul>
                <li class="current"><a href="#">未分類</a></li>
                <li><a href="#">甜點</a></li>
                <li><a href="#">吃吃吃</a></li>
            </ul>
        </section>

        <%-- 沒有收藏的畫面--%>
        <section class="col-xs-12 col-lg-7" id='recFavoriteList' hidden>
            <h4>未分類</h4>
            <p><span id='favoriteRecs'> 0 </span>道食譜</p>
            <div class='recBlock row'>
                <img class="col-xs-5 col-md-5" src="${pageContext.request.contextPath}/images/homePic/recipe-save-empty.png">
                <div class="col-xs-7 col-md-7">
                    <h6>此收藏分類目前是空的</h6>
                    <p> 這個分類目前沒有收藏哦， 快收藏喜歡的食譜， 以後就不怕找不到囉！</p>

                    <a href="#">快去看看人氣食譜吧</a>
                </div>
            </div>

        </section>

        <%--有收藏, 顯示收藏食譜--%>
        <section class="col-xs-12 col-lg-8 recResult offset-lg-4">
            <ul class="row justify-content-around">
                <%--預設搜尋畫面，在沒有輸入搜尋關鍵字前提下，預設使用推薦系統--%>
                <c:if test="${searchString eq 'default'}">
                    <c:forEach varStatus="loop" begin="0" end="${recReccBean.size()-1}">
                        <li class="col-lg-3 col-xs-6"><a href="http://localhost:8080/recipe/recipeDetails?id=${recReccBean.get(loop.index).recId}">
                            <img src="${recReccBean.get(loop.index).recPic}" alt="${recReccBean.get(loop.index).recTitle}">
                            <h4 class='showLines'>"${recReccBean.get(loop.index).recTitle}"</h4>
                            <p class='showLines'>${recReccBean.get(loop.index).recText}</p>
                        </a></li>
                    </c:forEach>
                </c:if>
                <c:if test="${searchString ne 'default' && recipeSearchBean.size() > 0}">
                    <%--成搜尋功能關鍵字--%>
                    <h1>搜尋:"${searchString}"，共找到${recipeSearchBean.size()}筆結果</h1>
                    <c:forEach varStatus="loop" begin="0" end="${recipeSearchBean.size()-1}">
                        <li class="col-lg-3 col-xs-6"><a href="http://localhost:8080/recipe/recipeDetails?id=${recipeSearchBean.get(loop.index).recId}">
                            <img src="${recipeSearchBean.get(loop.index).recPic}" alt="${recipeSearchBean.get(loop.index).recTitle}">
                            <h4 class='showLines'>"${recipeSearchBean.get(loop.index).recTitle}"</h4>
                            <p class='showLines'>${recipeSearchBean.get(loop.index).recText}</p>
                        </a></li>
                    </c:forEach>
                </c:if>
                <c:if test="${recipeSearchBean.size() eq 0}">
                    <h1>搜尋:"${searchString}"，共找到${recipeSearchBean.size()}筆結果</h1>
                </c:if>
            </ul>

            <button class="btn-search" id='btnRecMore'>載入更多</button>

        </section>

    </div>
</div>
<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
