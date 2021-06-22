<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>✿海貓食屋✿訂單管理</title>
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
        .table {
            position: relative;
            width: 95%;
            left: 20px;
            top: 10px;
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

        .TTT:hover {
            background-color: #afe3d5;
        }

        .hazy {
            visibility: hidden;
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 40;

        }

        .cat {
            border: blue 1px solid;
            background-color: white;
            width: 830px;
            height: 850px;
            z-index: 50;
            position: absolute;
            left: 0%;
            right: 0%;
            margin: auto;
            top: 50px;
            border-radius: 15px;
            visibility: hidden;

        }

        .cat p {
            position: relative;
            text-align: right;
            right: 100px;
        }

        .cat form {
            top: 10px;
            position: relative;
            left: 20px;
        }

        .cat input {
            width: 95%;
        }

        .cat select {
            width: 95%;
        }

        /* 購物車返回 */
        .catReturn {
            top: -10px;
            right: -10px;
            position: absolute;
            background-color: red;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            z-index: 20;
        }
        .pciSubmit{
            width: 95%;
        }
    </style>
</head>
<body>


<%--// 訂單細節--%>
<div class="hazy">

</div>
<div class="cat">
    <button class="catReturn">X</button>
    <div class="row">
        <table class="table table-striped detailTable">
            <tr>
                <td>訂單編號</td>
                <td>商品名稱</td>
                <td>數量</td>
                <td>售價</td>
            </tr>
        </table>
    </div>
    <hr>
    <span class="address">地址</span><br>
    <span class="name">名稱</span>
    <p>小記:1000</p><br>
    <form action="/recipe/backstage/state" class="form" method="post">
        <select class="form-select" aria-label="Default select example" id="orderStatus" name="orderStatus">
            <option value="1">1 新訂單</option>
            <option value="2">2 包裝完成</option>
            <option value="3">3 出貨</option>
        </select><br>
        <button type="submit" class="btn btn-primary pciSubmit ">完成</button>
    </form>
</div>

<%--    頁首--%>
<header class="container-fluid mainColor headtop">
    <div class="title">廠商後台</div>
    <button class="userIcon"></button>
</header>


<%--    側邊欄--%>
<div class="col-md-2 navfix mainColor">
    <ul class="list-group">
        <button class="list-group-item" onclick="javascript:location.href='/recipe/backstage/order?pag=1&state=1'">
            訂單管理
        </button>
        <button class="list-group-item" onclick="javascript:location.href='../backstage/product?pag=1'">商品管理
        </button>
        <label class="list-group-item">會員管理</label>
        <label class="list-group-item">員工管理</label>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>

            <div class="row">
                <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" onclick="sta(1)">
                    <label class="btn btn-outline-primary state1" for="btncheck1">新訂單</label>

                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                    <label class="btn btn-outline-primary state2" for="btncheck2" onclick="sta(2)">已包裝</label>

                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck3" onclick="sta(3)">歷史訂單</label>
                </div>
            </div>


            <div class="row">
                <table class="Table table-striped orderTable">
                    <tr>
                        <td>訂單編號</td>
                        <td>顧客</td>
                        <td>日期</td>
                        <td>狀態</td>
                        <td>細節</td>
                    </tr>
                </table>
            </div>

            <div class="row"> 底層</div>
        </div>
    </div>
</div>


<script>
    console.log("/recipe/backstage/selectorder?state=${param.state}");
    $.ajax({
        url: "/recipe/backstage/selectorder?state=${param.state}",
        type: "post",
        async: false,
        success: doSuccess,
        error: doError
    });

    //取得列表
    function doSuccess(json) {
        var state;
        $(".TTT").remove();
        for (var A of json) {
            var StatusId = A.orderStatusId;
            switch (StatusId) {
                case "0" :
                    state = "刪除";
                    break;
                case "1" :
                    state = "訂單成立,未包裝";
                    break;
                case "2" :
                    state = "訂單成立,未出貨";
                    break;
                case "3" :
                    state = "已出貨";
                    break;
                case "4" :
                    state = "已完成";
                    break;
            }
            $(".orderTable").append('<tr class="TTT" onclick="Detailed(' + A.orderId + ',`' + A.address + '`,`' + A.userName + '`)">' +
                '<td class="col-lg-1">' + A.orderId + '</td>' +
                '<td class="col-lg-1 ">' + A.userName + '</td>' +
                '<td class="col-lg-1 ">' + A.orderCreateOn + '</td>' +
                '<td class="col-lg-1 ">' + state + '</td>' +
                '<td class="col-lg-1 ">細節</td>' +
                '</tr>');
            console.log(A.address);

        }
    }

    function doError(json) {
        console.log("error ajax");
    }

    // 訂單細節
    function Detailed(id, address, name) {
        $(".detailTTT").remove();
        console.log(id);
        $(".hazy").css("visibility", "visible");
        $(".cat").css("visibility", "visible");
        $.ajax({
            url: "/recipe/backstage/orderDetail/" + id,
            type: "get",
            success: function (J) {
                console.log(J);
                var sell = 0;
                for (var A of J) {
                    sell += A.Unit * A.SellingPrice;
                    $(".detailTable").append('<tr class="detailTTT" ">' +
                        '<td class="col-lg-1">' + A.orderId + '</td>' +
                        '<td class="col-lg-2 ">' + A.productname + '</td>' +
                        '<td class="col-lg-1 ">' + A.Unit + '</td>' +
                        '<td class="col-lg-1 ">' + A.SellingPrice + '</td>' +
                        '</tr>');
                    $("p").text("總價 : " + sell);
                    $(".address").text("地址 : " + address);
                    $(".name").text("顧客 : " + name);
                    $(".form").attr("action", "/recipe/backstage/state/" + A.orderId);
                }
            },
            error: doError
        });
    }

    $(document).ready(function () {
        $(".package").click(function () {
            console.log("package");
        })
        // 關閉按紐
        $('.catReturn').click(function () {
            $(".hazy").css("visibility", "hidden");
            $(".cat").css("visibility", "hidden");
        });
    });

    function sta(state) {
        console.log("ddddddddddd" + state);
        window.location.href = "/recipe/backstage/order?pag=1&state=" + state;
    }

</script>
</body>
</html>
