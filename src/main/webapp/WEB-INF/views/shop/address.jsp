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


    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="/recipe/css/demo.css">
    <title>✿海貓食屋✿</title>
</head>
<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<canvas id="canvas"></canvas>
<jsp:include page="../user/inculeLogin.jsp"></jsp:include>
<div class=".container">
    <div class="row">
        dib
    </div>
    <div class="row cat ">
        <div class="col-lg-3">xx</div>
        <div class="col-lg-3">xx</div>
        <div class="col-lg-3">xx</div>
        <div class="col-lg-3">xx</div>
    </div>
         ${user}<br>
        ${cat}<br>
        ${state}
<%--            <div>--%>
<%--                $('.cat').prepend('<div class="catProduct" id="catProduct' + product.productid + '">' +--%>
<%--                '<img src="../images/' + product.productmodel + '-1.jpg" alt="">' +--%>
<%--                '<div class="context"><h3>' + product.productname + '</h3><br>' +--%>
<%--                    '<span>商品規格:' + product.productspecifications + '</span></div>' +--%>
<%--                '<div><span class="cash">' + product.sellingprice + '</span>' +--%>
<%--                    '<button class="catProductLeftButton" type="button" onclick="cutCat(' + product.productid + ')">-</button>' +--%>
<%--                    '<input type="number" name="catProductNum' + product.productid + '" value="' + json[product.productid] + '" class="pnum" id="pnum' + product.productid + '">' +--%>
<%--                    '<button class="catProductRightButton" type="button" onclick="addCat(' + product.productid + ')">+</button>' +--%>
<%--                    '<span class="total" id="total' + product.productid + '">合計:' + c[product.productid] + '</span></div>' +--%>
<%--                '<button class="del" onclick="delCat(' + product.productid + ')">刪除</button></div>');--%>
<%--            </div>--%>


        <script>
            var sell = [];
            var c = [];
            $.ajax({
                url: "/recipe/catData",
                type: "get",
                async: false,
                // dataType: "json",
                success: function(json) {
                    CatProduct = json;
                    var key = Object.keys(json);
                    for (var A in json) {
                        //用id找資料
                        $.ajax({
                            url: "/recipe/product/" + A,
                            type: "get",
                            async: false,
                            success: function(product) {
                                sell[product.productid] = product.sellingprice;
                                c[product.productid] = product.sellingprice * json[product.productid];//合計
                                $('.cat').prepend('<div class="col-lg-3">xx<div class="catProduct" id="catProduct' + product.productid + '">' +
                                    '<img src="./images/shop/' + product.productmodel + '-1.jpg" alt="">' +
                                    '<div class="context"><h3>' + product.productname + '</h3><br>' +
                                    '<span>商品規格:' + product.productspecifications + '</span></div>' +
                                    '<div><span class="cash">' + product.sellingprice + '</span>' +
                                    '<button class="catProductLeftButton" type="button" onclick="cutCat(' + product.productid + ')">-</button>' +
                                    '<input type="number" name="catProductNum' + product.productid + '" value="' + json[product.productid] + '" class="pnum" id="pnum' + product.productid + '">' +
                                    '<button class="catProductRightButton" type="button" onclick="addCat(' + product.productid + ')">+</button>' +
                                    '<span class="total" id="total' + product.productid + '">合計:' + c[product.productid] + '</span></div>' +
                                    '<button class="del" onclick="delCat(' + product.productid + ')">刪除</button></div></div>');

                            }
                            , error: function(json) {
                                console.log("err " + json);
                                function suc(product, A) {

                                }



                            }
                        })


                    }
                }, error: function(json) {
                    console.log("err " + json);
                }
            })
            <%--if(cat == 0) {--%>
            <%--    alert("未購買商品");--%>
            <%--    window.location.href = "/recipe/views/ShoppingMall";--%>
            <%--}--%>
            <%--var user = '${user}';--%>
            <%--if(user == 0){--%>
            <%--    alert("請先登入");--%>
            <%--}--%>
        </script>
    <style>
    .main {
        visibility: hidden;
    }
    </style>
</div>
</body>
</html>
