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
        <%--        這裡有圖--%>
    </div>
    <div class="row">
        <form action="">
            <input type="text">
            <input type="text">
            <input type="text">
            <input type="submit">
        </form>
    </div>

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
                            $('.cat').prepend('<div class="col-lg-5">xx<div class="catProduct" id="catProduct' + product.productid + '">' +
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
            position: absolute;
            top : 50px;
            visibility: hidden;
            z-index: 30;
        }
        .catProduct img{
            width: 100px;
        }
        .cat {
            /*border: blue 1px solid;*/
            /*background-color: white;*/
            /*width: 830px;*/
            /*height: 600px;*/
            /*z-index: 25;*/
            /*position: fixed;*/
            /*left: 0%;*/
            /*right: 0%;*/
            /*margin: auto;*/
            /*top: 150px;*/
            /*border-radius: 15px;*/
            /*overflow: scroll;*/
            /*overflow-X: hidden;*/

        }

        /* 購物車返回 */
        /*.catReturn {*/
        /*    top: 0px;*/
        /*    right: 0px;*/
        /*    position: absolute;*/
        /*    background-color: red;*/
        /*    width: 40px;*/
        /*    height: 40px;*/
        /*    border-radius: 50%;*/
        /*    z-index: 20;*/
        /*}*/

        /*.cat .foot {*/
        /*    bottom: 0px;*/
        /*    position: relative;*/
        /*    width: 800px;*/
        /*    height: 50px;*/

        /*}*/

        /*.cat .foot .PPP {*/
        /*    position: absolute;*/
        /*    right: 100px;*/
        /*    bottom: 10px;*/
        /*}*/

        /*.cat .foot .catSubmit {*/
        /*    position: absolute;*/
        /*    right: 10px;*/
        /*    bottom: 10px;*/

        /*}*/

        .cat .catProduct {
            position: relative;
            border: #69AE1E 3px solid;
            /*width: 480px;*/
            height: 140px;
            margin: 15px;
            border-radius: 15px;
        }

        .cat .catProduct img {
            position: absolute;
            /*width: 140px;*/
            height: 133px;
            border-radius: 15px;
        }

        .cat .catProduct .del {
            top: 100px;
            position: absolute;
            height: 30px;
            right: 10px;
        }

        /* 文字部分 */
        .cat .catProduct .context {
            position: absolute;
            right: 100px;
            bottom: 10px;
            left: 150px;
            width: 400px;
        }

        .cat .catProduct .cash {
            position: absolute;
            top: 60px;
            right: 210px;
        }

        /* +-按鈕 */
        .cat .catProduct .catProductLeftButton {
            position: absolute;
            width: 20px;
            height: 20px;
            right: 155px;
            z-index: 16;
            top: 60px;
        }

        .cat .catProduct .pnum {
            position: absolute;
            width: 50px;
            text-align: center;
            right: 110px;
            top: 60px;
            height: 20px;
        }

        .cat .catProduct .catProductRightButton {
            position: absolute;
            width: 20px;
            height: 20px;
            right: 110px;
            top: 60px;
        }

        .cat .catProduct .total {
            position: absolute;
            top: 60px;
            right: 10px;
        }
    </style>
</div>
</body>
</html>
