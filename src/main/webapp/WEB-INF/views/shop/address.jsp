<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<canvas id="canvas"></canvas>
<%--<jsp:include page="../user/inculeLogin.jsp"></jsp:include>--%>
<%--<div class="hazy"></div>--%>
<div class=" BBB">
    <%--    --%>
    <div class=" row AAA">
        <div class="col-lg-2"></div>
        <div class="col-lg-8 row cat ">
            <%--        這裡有圖--%>
        </div>
<%--        <div class="col-lg-2"></div>--%>
    </div>
    <%--    --%>
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8 row ">
            <div class="col-lg-8 address">
                <form action="/recipe/saveOrder/${id}" class="">
                    送貨地址:<span class="err">${errors.address} : </span><span class="err">${errors.recaptcha}</span>
                    <input type="text" class="form-control" name="address" style="margin: 10px 0 10px 0">

                    <button class="btn btn-primary col-lg-1 sbtn" type="submit">完成訂單</button>
                        <div class="g-recaptcha"
                             data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                             data-callback='verifyCallback' data-action='ubmit'>Submit
                        </div>

                    <style>
                        .sbtn{
                            position: absolute;
                            right: 0px;
                            left: 0%;
                            margin: auto;
                        }
                    </style>

                </form>
            </div>
            <div class="col-lg-4 allTotal">
                <br>
                <p class="PPP">總價:100000000</p>
                <p>運費 : 60</p>
                <hr>
                <p class="SSS">合計:100000060</p>
                <div class="d-grid gap-2">

                </div>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>
    <script>
        var CatProduct = [];
        var sell = [];
        var c = [];//合計
        //讀去cat資料
        $.ajax({
            url: "/recipe/catData",
            type: "get",
            async: false,
            // dataType: "json",
            success: function (json) {
                CatProduct = json;
                var key = Object.keys(json);

                for (var A in json) {

                    //用id找資料
                    $.ajax({
                        url: "/recipe/product/" + A,
                        type: "get",
                        async: false,
                        success: function (product) {
                            sell[product.productid] = product.sellingprice;
                            c[product.productid] = product.sellingprice * json[product.productid];//合計
                            $('.cat').append('<div class="catProduct col-lg-6 " id="catProduct' + product.productid + '">' +
                                '<img src="/recipe/images/shop/' + product.productmodel + '-1.jpg" alt="">' +
                                '<div class="context"><h3>' + product.productname + '</h3><br>' +
                                '<span>商品規格:' + product.productspecifications + '</span>' +
                                ' </div>' +
                                '<div><span class="pnum">X' + json[product.productid] + '</span>' +
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
            }, error: function (json) {
                console.log("err " + json);
            }
        })
        var cat = '${cat}';
        if (cat == 0) {
            alert("未購買商品");
            window.location.href = "/recipe/views/ShoppingMall";
        }
        var user = '${id}';
        // if (user == 0) {
        //     alert("請先登入");
        //     window.location.href = "/recipe/views/login";
        // }
        //總價
        var key = Object.keys(CatProduct);
        var m = 0;
        for (var k of key) {
            m += CatProduct[k] * sell[k];
        }
        $(".PPP").text("小記 : " + m);
        var a = m + 60
        $(".SSS").text("總價 : " + a);


    </script>
    <style>
        .err {
            color: red;
        }

        .cat {
            top: 10px;
            border: #69AE1E 3px solid;
            margin: 10px;
        }

        .address {
            width: 60%;
            top: 10px;
            border: #69AE1E 3px solid;
            margin: 10px;
        }

        .allTotal {
            position: relative;
            left: 50px;
            margin: 10px;
            text-align: center;

        }


        .cat .catProduct {
            position: relative;
            border: #69AE1E 3px solid;
            width: 47%;
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
</div>
</div>
</body>
</html>
