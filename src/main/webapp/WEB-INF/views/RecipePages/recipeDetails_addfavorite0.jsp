<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userFavoriteRec.css">
    <script src="${pageContext.request.contextPath}/js/userBack/favorites.js"></script>
</head>
<body>
<div class="maskForFavorite">
    <section class="col-xs-12 col-lg-3" id='recCategoryList'>
        <h3>食譜收藏</h3>
        <hr>
        <div>
            <h6>收藏分類</h6>
            <button id="btnNewCategory" class="iBtn" onclick="addCategory()">
                <i class="bi bi-plus-lg"></i>
            </button>
            <button id="updateBtn" onclick="updateC()">編輯分類</button>
        </div>
        <ul id="FCategory">
            <li class="current" onclick="selectCategory()"><a>全部</a></li>
            <c:forEach items="${UFCBList}" var="UFCB">
                <li onclick="selectCategory('${UFCB.favoriteCategoryName}')" id="${UFCB.favoriteCategoryName}">
                    <a>${UFCB.favoriteCategoryName}</a></li>
            </c:forEach>
        </ul>
    </section>
</div>

</body>
</html>
