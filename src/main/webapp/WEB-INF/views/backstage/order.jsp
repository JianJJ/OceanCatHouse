<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        #timeCenter {
            color: #ffffff;
            position: relative;
            top : 350px;
            margin:  auto;
            width: 40px;
        }
        .TTT:hover {
            background-color: #afe3d5;
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
        <button class="list-group-item" onclick="javascript:location.href='/recipe/backstage/order?pag=1'">訂單管理</label>
        <button class="list-group-item" onclick="javascript:location.href='../backstage/product?pag=1'">商品管理</button>
        <label class="list-group-item">會員管理</label>
        <label class="list-group-item">員工管理</label>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>
             <div class="row">   第1層  </div>

            <div class="row">
                <div class="row">
                    <table class="table table-striped">
                        <tr>
                            <td>訂單編號</td>
                            <td>顧客ID</td>
                            <td>日期</td>
                            <td>狀態</td>

                        </tr>
                    </table>
                </div>
            </div>
                <div class="row">  底層   </div>
        </div>
    </div>
</div>


<script>
    $.ajax({
        url: "/recipe/backstage/selectorder",
        type: "post",
        async: false,
        success: doSuccess,
        error: doError
    });

    //取得列表
    function doSuccess(json) {
    var state ;


        $(".TTT").remove();
        for (var A of json) {
            var  StatusId = A.orderStatusId;
            switch (StatusId) {
                case 0 : state ="刪除";break;
                case 1 :state ="訂單成立,未付款";break;
                case 2 :state ="訂單成立,已付款";break;
                case 3 :state ="運送中";break;
                case 4 :state ="已完成";break;
            }

            console.log(A);
            $(".table").append('<tr class="TTT" onclick="Detailed(' + A.orderId + ')">' +
                '<td class="col-lg-1">' + A.orderId + '</td>' +
                '<td class="col-lg-1 ">' + A.userId + '</td>' +
                '<td class="col-lg-1 ">' + A.orderCreateOn + '</td>' +
                '<td class="col-lg-1 ">' + state + '</td>' +
                '</tr>');
        }
    }
    function doError(json) {
        console.log("error ajax");
    }
    function Detailed(id) {
        console.log(id);
        $(".hazy").css("visibility", "visible");
        $.ajax({
            url: "/recipe/backstage/orderDetail/" + id,
            type: "get",
            success: function (A) {
                // $("#productid").text("商品ID : " + A.productid);
                // $("#productname").val(A.productname);
                // $("#productmodel").val(A.productmodel);
                // $("#producttext").val(A.producttext);
                // $("#purchaseprice").val(A.purchaseprice);
                // $("#sellingprice").val(A.sellingprice);
                // $("#stocks").val(A.stocks);
                // $("#productspecifications").val(A.productspecifications);
                // $("#vendorid").val(A.vendorid);
                // $("#productcategoryid").val(A.productcategoryid);
                //
                // $("#productstatus").val(A.productstatus);
                // $("#createdon").text("創建日期 : " + A.createdon);
                // $("#lastupdatedon").text("上次修改日期 : " + A.lastupdatedon);
                //
                // $(".form").attr("action", "/recipe/backstage/updata/" + A.productid);
            },
            error: doError
        });


    }
</script>
</body>
</html>
