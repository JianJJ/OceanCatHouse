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

        .pciSubmit {
            width: 95%;
        }
        .accordion-item{
            text-align: center;
            background-color: #62A5A1;
            color: #0c4128;
        }
        .AAA{
            padding-left: 38%;
            text-align: center;
            background-color: #62A5A1;
            color: white;
        }
        .accordion-button {
            text-align: center;
        }

        .accordion-button:focus{
            text-align: center;
            background-color: #62A5A1;
            color:white;
        }
        .accordion-button:not(.collapsed) {
            text-align: center;
            background-color: #62A5A1;
            color:white;
        }
        .list-group-item {
            background-color: transparent;
            color: white;
        }
    </style>
</head>
<body>


<%--// 訂單細節--%>
<div class="hazy"></div>
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
    <form action="${pageContext.request.contextPath}/backstage/state" class="form" method="post">
        <select class="form-select" aria-label="Default select example" id="orderStatus" name="orderStatus">
            <option value="1">1 新訂單</option>
            <option value="2">2 包裝完成</option>
            <option value="3">3 出貨</option>
            <option value="4">4 完成</option>
        </select><br>
        <button type="submit" class="btn btn-primary pciSubmit ">完成</button>
    </form>
</div>

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
        <%--        <button class="list-group-item"--%>
        <%--                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics'">統計--%>
        <%--        </button>--%>
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
                <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" onclick="sta(1)">
                    <label class="btn btn-outline-primary state1" for="btncheck1">新訂單</label>

                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                    <label class="btn btn-outline-primary state2" for="btncheck2" onclick="sta(2)">已包裝</label>

                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btncheck3" onclick="sta(3)">歷史訂單</label>
                </div>
            </div>
            <%--            <div class="col-lg-3 ccc">--%>
            <%--                <div class="input-group mb-3">--%>
            <%--                    <input type="text" class="form-control" placeholder="訂單編號" aria-label="Recipient's username"--%>
            <%--                           aria-describedby="button-addon2" id="selectProduct">--%>
            <%--                    <button class="btn btn-outline-secondary" type="button" id="buttonaddon2">搜索</button>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <div class="row">
                <table class="Table table-striped orderTable">
                    <tr>
                        <td>訂單編號</td>
                        <td>顧客(ID)</td>
                        <td>日期</td>
                        <td>狀態</td>
                        <td>細節</td>
                    </tr>


                    <%--                    <c:forEach varStatus="loop" begin="0" end="${order.size()-1}" items="${order}" var="s">--%>
                    <%--                        <tr class="TTT" onclick="Detailed(' + A.orderId + ',`' + A.address + '`,`' + A.userName + '`)">--%>
                    <%--                        <td class="col-lg-1">${order}s.orderId + '</td>--%>
                    <%--                        <td class="col-lg-1 ">${s.}s.userName + '('+A.userId+')</td>--%>
                    <%--                        <td class="col-lg-1 ">${s.ordercreateon} s.orderCreateOn + '</td>--%>
                    <%--                        <td class="col-lg-1 ">${s.orderstatusid} state + '</td>--%>
                    <%--                        <td class="col-lg-1 ">細節</td>--%>
                    <%--                        </tr>--%>
                    <%--                    </c:forEach>--%>
                </table>
            </div>

            <div class="row">

                <%--                底層--%>
            </div>
        </div>
    </div>
</div>


<script>
    //取得列表
    var url
    var userId = '${param.userId}';
    if (userId == "") {
        console.log(userId + " == ");
        url = "${pageContext.request.contextPath}/backstage/selectorder?state=${param.state}";
    } else {
        url = '${pageContext.request.contextPath}/backstage/userOrder/' + userId;
    }
    console.log(url);
    $.ajax({
        url: url,
        type: "post",
        async: false,
        success: doSuccess,
        error: doError
    });

    function doSuccess(json) {
        var state;
        $(".TTT").remove();
        for (var A of json) {
            var StatusId = A.orderStatusId;
            switch (StatusId) {
                case "0" :
                    state = "訂單成立,未付款";
                    break;
                case "1" :
                    state = "訂單成立,未包裝";
                    break;
                case "2" :
                    state = "包裝完成,未出貨";
                    break;
                case "3" :
                    state = "已出貨";
                    break;
                case "4" :
                    state = "已完成";
                    break;
            }
            $(".orderTable").append('' +
                '<tr class="TTT" onclick="Detailed(' + A.orderId + ',`' + A.address + '`,`' + A.userName + '`,' + A.orderStatusId + ')">' +
                '<td class="col-lg-1">' + A.orderId + '</td>' +
                '<td class="col-lg-1 ">' + A.userName + '(' + A.userId + ')</td>' +
                '<td class="col-lg-1 ">' + A.orderCreateOn + '</td>' +
                '<td class="col-lg-1 ">' + state + '</td>' +
                '<td class="col-lg-1 ">細節</td>' +
                '</tr>');
        }
    }

    function doError(json) {
        console.log("error ajax");
    }

    // 訂單細節
    function Detailed(id, address, name,state) {
        $(".detailTTT").remove();
        $(".hazy").css("visibility", "visible");
        $(".cat").css("visibility", "visible");
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/orderDetail/" + id,
            type: "get",
            success: function (J) {
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
                    $(".form").attr("action", "${pageContext.request.contextPath}/backstage/state/" + A.orderId);
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
        window.location.href = "${pageContext.request.contextPath}/backstage/order?pag=1&state=" + state;
    }

    <%--//搜索按鈕--%>
    <%--$("#buttonaddon2").click(function () {--%>
    <%--    console.log("#buttonaddon2" + $("#selectProduct").val());--%>
    <%--    window.location.href = "${pageContext.request.contextPath}/backstage/order?orderId=" + $("#selectProduct").val();--%>
    <%--})--%>
</script>
</body>
</html>
