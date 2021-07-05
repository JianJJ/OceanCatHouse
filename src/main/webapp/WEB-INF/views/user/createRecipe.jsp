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
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">
    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createRecipe.css">
    <script src="${pageContext.request.contextPath}/js/createRecipe/createRecipe.js"></script>
</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

<!--主體-->
<div class="container">
    <form action="${pageContext.request.contextPath}/createRecipe/add" method="get">
        <div class="row justify-content-around onTop">
            <div class="col-md-7">
                <div class="row">
                    <label for="CategoryName">選擇食譜的分類</label>
                    <select class="form-control inner" id="CategoryName" name="CategoryId">
                        <c:forEach items="${categoryList}" var="category">
                            <option value="${category.categoryId}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row">
                    <label for="RecTitle">請輸入食譜名稱</label>
                    <div class="input-group inner">
                        <input type="text" class="form-control" placeholder="例如：番茄炒蛋" id="RecTitle" name="RecTitle" required>
                    </div>
                    <div>
                        <p style="color: #bcbebf">建議不要加上個人化名稱，像是「安德森的廚房」，避免食譜名稱過長。</p>
                        <button type="button" id="autologin" style="width: 4px ;height: 3px"></button>
                    </div>
                    <div class="form-check smallInner">
                        <input class="form-check-input" type="checkbox" value="" id="agree"><!--checked disabled-->
                        <label class="form-check-label" for="agree">
                            發布食譜及代表同意海貓食屋「服務條款」。
                        </label>
                    </div>
                    <div id="CreateNow" style="position: static">
                        <input type="submit" class="btn btn-outline-danger" value="開始寫食譜" id="StartWriter" disabled>
                    </div>
                </div>
            </div>
            <div class="col-md-3 showAD">
                <div class="row" id="pic"><img src="https://tokyo-kitchen.icook.network/uploads/recipe/cover/379611/c9be9889992d1b90.jpg"></div>
                <div class="row"><h4>十六穀米蔬菜鹹粥</h4></div>
                <div class="row">翻出冰箱的剩菜剩飯清一清，煮成鹹粥，想加什麼都可以～顏色繽紛又營養的一餐</div>
            </div>
        </div>
    </form>
</div>
<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>

</body>
</html>
