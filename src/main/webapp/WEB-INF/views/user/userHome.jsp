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

            <div id='member-icon' style="background-image:
                    url('../images/userPic/${sessionScope.user.userpic!=null?sessionScope.user.userpic:"paw-solid.svg"}')">
                <input type="file" accept="image/*" id="file-userPic" name="file"
                       onchange="upload('#file-userPic');" class="fileInput" value=""/>
            </div>

            <div id='member-imgBackground'></div>
            <div id="member-navLinks">
                <div>
                    <span>${sessionScope.user.username}</span>
                    <a href="#">食譜收藏</a>
                    <a href="${pageContext.request.contextPath}/createRecipe/start">寫食譜</a>
                </div>
                <ul>
                    <li class="currentLink"><a href="#">食譜</a></li>
                    <li><a href="${pageContext.request.contextPath}/userBack/userSetting">帳號設定</a></li>
                </ul>
            </div>
        </div>
    </div>


    <div class="row justify-content-center">
        <div class="col-xs-10 col-md-10 memberBlock">
            <h2>目前已經撰寫了<span style="font-weight: bolder">${requestScope.recCount}</span>篇食譜</h2>

            <div class="col-md-11 justify-content-center recipeSimpleContext">
                <div class="container">

                    <c:forEach items="${recipeMainList}" var="list">
                        <div class="row justify-content-center" style=" margin: 5px 5px">
                            <div class="col-md-4" style="height: 200px;">
                                <a href="${pageContext.request.contextPath}/createRecipe/select/${list.recId}">
                                    <img id="${list.recId}"
                                         src="${pageContext.request.contextPath}/images/mainpic/${list.recPic}"
                                         style="width: 100%;height: 100%" class="img-thumbnail"
                                         alt="">
                                </a>
                            </div>
                            <div class="col-md-8">
                                <h4 class='showLines'>${list.recTitle}</h4>
                                <span>南瓜、南瓜濃湯、蟹肉棒、南瓜盅、鮮蝦、奶油蘑菇、起司絲</span>
                                <p class='showLines'>
                                        ${list.recText}
                                </p>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>


<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>

</body>
</html>
