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
        .headtop{
            position: sticky;
            top: 0px;
            z-index: 5;
        }
        .navfix{
            position: fixed;
            top:80px;
            height: 100vh;
        }
        .navfix li{
            border: none;
            cursor: pointer;
        }
        .navfix li:hover{
            background-color: #afe3d5;
            color: #0c4128;
        }
        .list-group-item{
            background-color: transparent;
            color: white;
        }
    </style>
</head>
<body>
<%--    頁首--%>
<header class="container-fluid mainColor headtop">
    <div class="title">廠商後台</div>

    <button class="userIcon"></button>
</header>


        <%--    側邊欄--%>
        <div class="col-md-2 navfix mainColor">
            <ul class="list-group">
                <li class="list-group-item" aria-disabled="true">訂單管理</li>
                <li class="list-group-item">商品管理</li>
                <li class="list-group-item">會員管理</li>
                <li class="list-group-item">員工管理</li>
            </ul>
        </div>
        <%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>
            <div class="row">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">總覽</li>
                    </ol>
                </nav>
            </div>

            <div class="row">
                <%--                中間之後要放的內容--%>
                範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字
            </div>
        </div>
    </div>
</div>

</body>
</html>
