<%--
  Created by IntelliJ IDEA.
  User: wiz71
  Date: 2021/6/19
  Time: 下午 04:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <%-- bootstrap的CSS、JS樣式放這裡 --%>
    <%--            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/recipe/css/bootstrap.min.css">
    <link rel="stylesheet" href="/recipe/css/bootstrap.rtl.min.css">


    <%-- jQuery放這裡 --%>
    <script src="/recipe/js/jquery-3.6.0.min.js"></script>
    <script src="/recipe/js/jquery-3.4.1.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/bottom_nav.css">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>
    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="/recipe/css/demo.css">
    <title>✿海貓食屋✿</title>
</head>
<body>
<div class="container-sm">
    <div class="row ">
    </div>
    <div class="row main">
        <h1> ${sessionScope.orderId}感謝購買</h1>
        <div class="col-lg-1"></div>
        <div class="col-lg-10 cat"></div>
    </div>
    <div class="row main">
        <div class="col-lg-1"></div>
        <div class="col-lg-10 name"></div>
    </div>

</div>
</body>
<script>
    var CatProduct = [];
    var sell = [];
    var c = [];
    //讀去cat資料
    <%--console.log('orderId = ${sessionScope.orderId}');--%>
    $.ajax({
        url: "/recipe/completeData/${sessionScope.orderId}",
        type: "get",
        async: false,
        // dataType: "json",
        success: function (json) {
            CatProduct = json;
            console.log(json);
            var key = Object.keys(json);
            for (var A of json) {
                //用id找資料
                $.ajax({
                    url: "/recipe/product/" + A.productId,
                    type: "get",
                    async: false,
                    success: function (product) {
                        console.log( product);
                        sell[product.productid] = product.sellingprice;
                        c[product.productid] = product.sellingprice * A.unit;//合計
                        $('.cat').append('<div class="catProduct  " id="catProduct' + product.productid + '">' +
                            '<img src="/recipe/images/shop/' + product.productmodel + '-1.jpg" alt="">' +
                            '<div class="context"><h3>' + product.productname + '</h3><br>' +
                            '<span>商品規格:' + product.productspecifications + '</span>' +
                            ' </div>' +
                            '<div><span class="pnum">X' + A.unit + '</span>' +
                            '<span class="total" id="total' + product.productid + '">合計:' + c[product.productid] + '</span>' +
                            '</div>' +
                            '</div>');
                    }
                    , error: function (json) {
                        console.log("err " + json);

                        function suc(product, A) {

                        }

                    }
                })


            }
            $('.cat').append('<h1>送貨地址 : ${sessionScope.address}</h1><br><button type="button" class="btn btn-primary phone">返回首頁</button>')

        }, error: function (json) {
            console.log("err " + json);
        }
    })
    $(".phone").click(function () {
        window.location.href = "/recipe/homePage";
    });
</script>
<style>
    .main{
        background-color: #afe3d5;
        text-align: center;
    }
    .cat {
        top: 10px;
        border: #69AE1E 3px solid;
        margin: 10px;
    }
    .cat .catProduct {
        position: relative;
        border: #69AE1E 3px solid;

        height: 140px;
        margin: 15px;
        border-radius: 15px;
    }

    .cat .catProduct img {
        position: absolute;
        left: 0px;
        width: 133px;
        height: 133px;
        border-radius: 15px;
    }


    /* 文字部分 */
    .cat .catProduct .context {
        position: absolute;
        right: 100px;
        bottom: 10px;
        left: 150px;

    }

    .cat .catProduct .cash {
        position: absolute;
        top: 60px;
        right: 210px;
    }


    /* x數量  */
    .cat .catProduct .pnum {
        position: absolute;
        width: 50px;
        text-align: center;
        right: 70px;
        top: 60px;
        height: 20px;
    }


    .cat .catProduct .total {
        position: absolute;
        top: 60px;
        right: 10px;
    }
</style>
</html>
