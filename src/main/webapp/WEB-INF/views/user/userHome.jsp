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
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.rtl.min.css">--%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <!--    JavaScript; choose one of the two!-->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/jquery-3.6.0.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/createRecipe/createRecipeDetail.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">
    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/memberHome.css">

    <script src="${pageContext.request.contextPath}/js/userBack/userHome.js"></script>
</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<%--主體--%>
<body>

<div class="container">
    <div class='row justify-content-center'>
        <div class="col-xs-10 col-md-10 memberBlock">

            <div id='member-icon'>
                <input type="file" accept="image/*" id="file-main" name="file"
                       onchange="upload('#file-main', '#member-icon');" class="fileInput" value=""/>
            </div>

            <div id='member-imgBackground'></div>
            <div id="member-navLinks">
                <div>
                    <span>hahaha 暱稱</span>
                    <a href="#">食譜收藏</a>
                    <a href="${pageContext.request.contextPath}/createRecipe/start">寫食譜</a>
                </div>
                <ul>
                    <li class="currentLink"><a href="#">食譜</a></li>
                    <li><a href="#">帳號設定</a></li>
                </ul>
            </div>
        </div>
    </div>


    <div class="row justify-content-center">
        <div class="col-xs-10 col-md-10 memberBlock">
            <h2>目前已經撰寫了<span>53</span>篇食譜</h2>
            <div class="col-md-11 justify-content-center recipeSimpleContext">
                如果是列表狀的食譜內容
            </div>

        </div>
    </div>

</div>


<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>

</body>
</html>
