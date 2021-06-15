<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
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
    <style>
    </style>
</head>
<body>
<div class="container-fluid">
<%--    頁首--%>
    <header class="container-fluid mainColor">
        <div class="title">廠商後台</div>

        <button class="userIcon"></button>
    </header>


    <div class="row">
        <%--    側邊欄--%>
        <div class="flex-column col-md-2">
            <ul class="list-group">
                <li class="list-group-item disabled" aria-disabled="true">訂單管理</li>
                <li class="list-group-item">商品管理</li>
                <li class="list-group-item">會員管理</li>
                <li class="list-group-item">員工管理</li>
            </ul>
        </div>
        <%--    中間主體--%>
        <div class="col-md-10">
<%--            導航列--%>
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">Home</li>
                    </ol>
                </nav>
            </div>

            <div class="row innerBody">
<%--                中間之後要放的內容--%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
