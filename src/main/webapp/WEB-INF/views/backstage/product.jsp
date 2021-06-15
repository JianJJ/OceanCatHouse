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
        <button class="list-group-item" aria-disabled="true">訂單管理</button>
        <button class="list-group-item" onclick="javascript:location.href='../backstage/product'">商品管理</button>
        <button class="list-group-item">會員管理</button>
        <button class="list-group-item">員工管理</button>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>
                <div class="row">
                    <button class="col-lg-1">新增</button>
                    <button class="col-lg-1">bbb</button>
                    <button class="col-lg-1">ccc</button> </div>
            <div class="row">
                <table class="table table-striped">
                    <tr>
                        <td>id</td>
                        <td>modela</td>
                        <td>名稱</td>
                        <td>進價</td>
                        <td>售價</td>
                        <td>庫存</td>
                        <td>規格</td>
                    </tr>
                </table>
            </div>
<%--                分頁--%>
                <nav>
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            <div class="row">
                <%--                中間之後要放的內容--%>
                範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字範例字
            </div>
        </div>
    </div>
</div>
<script>
    <%--    商品管理--%>
    $.ajax({
        url: "/recipe/backstage/product/data",
        type: "post",
        // contentType: "application/json",
        // dataType: "json",
        success: doSuccess,
        error: doError
    });
    function doSuccess(json) {
        $(".TTT").remove();
        console.log(json);
        for (var A of json){
            $(".table").append('<tr class="TTT" onclick="Detailed('+A+')"><td class="col-lg-1">'+A.productid+'</td>'+
                '<td class="col-lg-1 ">'+A.productmodel+'</td>'+
                '<td class="col-lg-2 ">'+A.productname+'</td>'+
                '<td class="col-lg-1 ">'+A.purchaseprice+'</td>'+
                '<td class="col-lg-1 ">'+A.sellingprice+'</td>' +
                '<td class="col-lg-1 ">'+A.stocks+'</td>' +
                '<td class="col-lg-1 ">'+A.productspecifications+'</td>' +
                '</tr>');}
    }
    function doError(json) {
        console.log(json);

    }
</script>
<style>
    .TTT:hover{
    background-color: #afe3d5;
    }


</style>
</body>
</html>
