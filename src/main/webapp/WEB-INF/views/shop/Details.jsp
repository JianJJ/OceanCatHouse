<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <%-- bootstrap的CSS、JS樣式放這裡 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">


    <%-- jQuery放這裡 --%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav_forShop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Details.css">

    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <script type="text/javascript">
        var id = "${id}";
        console.log("id : " + id);
    </script>
    <style>
        body{
           color: rgba(0,0,0,0.9);

        }

    </style>

    <title>✿海貓食屋✿</title>
</head>

<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav_forShop.jsp"></jsp:include>
<!-- 動態背景 -->
<canvas id="canvas"></canvas>
<!-- <%--購物車插入--%> -->
<jsp:include page="/WEB-INF/views/shop/shopCat.jsp"></jsp:include>

<!-- 左邊浮動區塊 -->
<div class="barNav d-none d-lg-inline-block">
    <ul>
        <li class="fontIcon"><span id="f1"></span></li>
    </ul>
</div>
<div class="container">
    <!-- 中間部分 -->
    <div class="row">
        <!-- 網頁中間內文 -->
        <div class="col-lg-11">
            <div class="cenBody">
                <!-- 輪播圖  -->
                <div class="cenDetail row">
                    <div class="col-lg-6 col-md-12 leftImg ">
                        <div class="banner">
                            <button class="bLeft">&laquo;</button>
                            <button class="bRight">&raquo;</button>
                            <div class="list">
                                <!--這裡有輪播圖  -->
                            </div>
                        </div>
                        <div class="producturl">
                            <!--這裡有小圖  -->

                        </div>
                    </div>

                    <div class="col-lg-5 col-md-12 rightImg ">

                        <h2 class="productname"> ${productname}</h2>

                        <hr>

                        <div class="producttext">${producttext}</div>


                        <div class="productspecifications">商品規格 : ${productspecifications}</div>

                        <div class='productPayment'>付款方式 : 貨到付款 , 信用卡 , 第三方支付-綠界支付
                            <br> 運送方式 :
                            宅配 ($60)
                        </div>
                        <hr>
                        <div class="sellingprice">售價 $${sellingprice}</div>
                        <div>

                            <form action="${pageContext.request.contextPath}/cat/${id}">
                                <button class="leftButton" type="button" onclick="leftButton()">-</button>
                                <input type="text" name="num" value="1" class="num">
                                <button class="rightButton" type="button" onclick="rightButton()">+</button>

                                <button type="submit" value="加入購物車" class="btn btn-outline-dark btn-lg bs">加入購物車
                                </button>
                            </form>

                        </div>


                    </div>
                </div>

                <hr class='divLine'>

                <!-- 推薦食譜 -->
                <div class="recommend row">
                    <p>推薦食譜</p>
                    <c:forEach varStatus="loop" begin="0" end="${recommend.size()-1}" items="${recommend}"
                               var="r">
                        <a href="../recipeDetails?id=${r.recId}" class="col-lg-6 col-sm-6">
                            <div class="row recommendRecipe">
                                <img class="col-lg-3 col-md-7 col-sm-6 rsNavItem" src='${r.recPic}' alt="">
                                <p class="col-lg-6 col-sm-6">${r.recTitle}</p>
                            </div>
                        </a>
                    </c:forEach>


                </div>
                <hr class='divLine'>
                <!-- 同類商品 -->
                <div class="SimilarProducts row">
                    <p>同類商品</p>
                    <c:forEach varStatus="loop" begin="0" end="${SimilarProducts.size()-1}" items="${SimilarProducts}"
                               var="s">
                        <figure class="col-lg-2 col-sm-4">
                            <a href="${pageContext.request.contextPath}/Details/${s.productid}">
                                <img src="../images/shop/${s.productmodel}-1.jpg" alt="">
                                    ${s.productname}
                            </a>
                        </figure>

                    </c:forEach>


                </div>
            </div>
        </div>

        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon" id="toUp"></span>
        </div>
    </div>
</div>

</body>


<script>
    var index = 0;//設定輪播圖位置
    var maxIdex//設定有幾張圖片

    $('.catReturn').click(function () {
        $(".hazy").css("visibility", "hidden");
    });


    $('.toUP').click(function () {
        $('html, body').stop().animate({
            scrollTop: 0
        }, 100)
    });

    $(window).scroll(function () {
        if ($(document).scrollTop() >= 450) {
            $('.toUP').fadeIn(300);
        }

        if ($(document).scrollTop() < 450) {
            $('.toUP').fadeOut(300);
        }
    });

    // 商品圖片
    $.ajax({
        url: "${pageContext.request.contextPath}/pic/" + id,
        type: "get",
        async: false,
        success: function (pic) {
            maxIdex = pic.length;
            var i = 0;
            for (var A of pic) {
                $(".list").append('<img class="rsimg" src="../images/shop/' + A.producturl + '.jpg" alt="">');
                $(".producturl").append('<img class="rsNavItem" onclick="rsmove(' + i + ')" src="../images/shop/' + A.producturl + '.jpg" alt="">');
                i++;
            }
        }
    })

    // 輪播圖按紐
    function rsmove(i) {
        $(".list").css("left", -i * 505 + 'px');
        index = i;
        if (index == 0) {
            $(".bLeft").css("visibility", "hidden");
        } else {
            $(".bLeft").css("visibility", "visible");
        }

        if (index == maxIdex - 1) {
            $(".bRight").css("visibility", "hidden");
        } else {
            $(".bRight").css("visibility", "visible");
        }


    }

    $(".bLeft").css("visibility", "hidden");

    $(".bLeft").click(function () {
        $(".bRight").css("visibility", "visible");
        index--;
        if (index == 0) $(".bLeft").css("visibility", "hidden");
        $(".list").css("left", -index * 505 + 'px');
    })

    $(".bRight").click(function () {
        $(".bLeft").css("visibility", "visible");
        index++;
        $(".list").css("left", -index * 505 + 'px');

        if (index == maxIdex - 1) $(".bRight").css("visibility", "hidden");

    })


</script>
<script src="../js/shoopCat.js"></script>
<script src="../js/umbrella.js"></script>
</html>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>