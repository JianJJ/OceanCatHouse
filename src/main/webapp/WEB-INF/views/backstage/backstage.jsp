<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>✿海貓食屋✿廠商後台</title>
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
        body {
            background-color: #222;
        }

        .headtop {
            position: sticky;
            top: 0px;
            z-index: 5;
        }

        .navfix {
            position: fixed;
            top: 80px;
            height: 100vh;
        }

        .navfix li {
            border: none;
            cursor: pointer;
        }

        .navfix li:hover {
            background-color: #afe3d5;
            color: #0c4128;
        }

        .list-group-item {
            background-color: transparent;
            color: white;
        }

        #timeCenter {
            color: #ffffff;
            position: relative;
            top: 350px;
            margin: auto;
            width: 40px;
        }

        .accordion-item {
            text-align: center;
            background-color: #62A5A1;
            color: #0c4128;
        }

        .AAA {
            padding-left: 38%;
            text-align: center;
            background-color: #62A5A1;
            color: white;
        }

        .accordion-button {
            text-align: center;
        }

        .accordion-button:focus {
            text-align: center;
            background-color: #62A5A1;
            color: white;
        }

        .accordion-button:not(.collapsed) {
            text-align: center;
            background-color: #62A5A1;
            color: white;
        }

        .list-group-item {
            background-color: transparent;
            color: white;
        }
    </style>
</head>
<body>
<%--    頁首--%>
<header class="container-fluid mainColor headtop">
    <a href="<c:url value="/backstage/home" />" class="title">廠商後台</a>
<%--    <button class="userIcon"></button>--%>
</header>


<%--    側邊欄--%>
<div class="col-md-2 navfix mainColor">
    <ul class="list-group">
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/order?pag=1&state=1'">
            訂單管理
        </button>
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/product?pag=1&state=1'">
            商品管理
        </button>
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/user/0'">會員管理
        </button>
        <button class="list-group-item "
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/staff'">員工管理
        </button>
        <div class="accordion accordion-flush" id="accordionExample">
            <div class="accordion-item ">
                <h2 class="accordion-header BBB text-center" id="headingOne">
                    <button class="accordion-button  AAA " type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <%--                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        銷售圖表
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse " aria-labelledby="headingOne"
                     data-bs-parent="#accordionExample">

                    <div class="accordion-body">
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=1&time=3'">米麵五穀
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=5&time=3'">植物油
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=4&time=3'">醬料
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=2&time=3'">蔬果
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=3&time=3'">生鮮
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=6&time=3'">乾貨
                        </a><br>

                    </div>
                </div>
            </div>
        </div>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>

            <div class="row">

            </div>

            <div class="row">
                <div id="timeCenter">Error</div>
                <script src="${pageContext.request.contextPath}/js/time.js"></script>
                <%--                中間之後要放的內容--%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
