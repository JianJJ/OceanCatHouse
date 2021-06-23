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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">

    <%-- jQuery放這裡 --%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">--%>
    <link rel="stylesheet" href="../css/Details.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav_forShop.css">

    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="../css/demo.css">

    <script type="text/javascript">
        var id = "${id}";
        console.log("id : " + id);
    </script>
    <style>
        footer {
            margin:-42px;
            z-index: 10;
        }
        .cenBody{
            position: relative;
            top: 30px;
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
<!-- 分類條 -->
<div class="container-fluid">
<%--    <div class="row menu">--%>
<%--        <div id="home" class="col-lg-1">--%>
<%--            <a href="../views/ShoppingMall"><img src="../images/homepic/home.png" alt=""></a>--%>
<%--        </div>--%>
<%--        <a class="col-lg-1 col-md-2 menuDetail" href="../views/ShoppingMall?categoryid=1">五穀</a>--%>
<%--        <a class="col-lg-1 col-md-2 menuDetail" href="../views/ShoppingMall?categoryid=5">油</a>--%>
<%--        <a class="col-lg-1 col-md-2 menuDetail" href="../views/ShoppingMall?categoryid=4">醬料</a>--%>
<%--        <a class="col-lg-1 col-md-2 menuDetail" href="../views/ShoppingMall?categoryid=2">蔬果</a>--%>
<%--        <a class="col-lg-1 col-md-2 menuDetail" href="../views/ShoppingMall?categoryid=3">生鮮</a>--%>
<%--        <a class="col-lg-1 col-md-2 menuDetail" href="../views/ShoppingMall?categoryid=6">乾貨</a>--%>
<%--    </div>--%>


    <!-- 中間部分 -->

    <div class="row ">
        <!-- 左邊浮動區塊 -->
        <div class="col-lg-2 ">
            <div class="barNav">

                <ul>
                    <li class="fontIcon" id="f1"></li>
                    <li class="fontIcon"></li>
                    <li class="fontIcon"></li>
                    <li class="fontIcon"></li>
                </ul>
            </div>
        </div>
        <style>
            .cenBody .SimilarProducts figure {
                width: 200px;
                height: 300px;
                z-index: 5;
                margin: 18px;
            }

        </style>


        <!-- 網頁中間內文 -->
        <div class="col-lg-8 ">
            <div class="cenBody">
                <!-- 輪播圖  -->
                <div class="cenDetail row">
                    <div class="col-lg-6 col-md-12 leftImg ">
                        <div class="banner">
                            <div class="list">
                                <!--這裡有輪播圖  -->
                            </div>
                        </div>
                        <div class="producturl">
                            <!--這裡有小圖  -->

                        </div>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5 col-md-12 rightImg ">
                    <br>
                    <h2 class="productname"> ${productname}</h2>

                    <hr>
                    <br>
                    <div class="producttext">${producttext}</div>

                    <br>
                    <div class="productspecifications">商品規格:${productspecifications}</div>
                    <br>
                    <div>付款方式 : 貨到付款
                        <br> 運送方式
                        宅配 ($30)
                    </div>
                    <hr>
                    <div class="sellingprice">售價 ${sellingprice}</div>
                    <div>

                        <form action="${pageContext.request.contextPath}/cat/${id}">
                            <button class="leftButton" type="button" onclick="leftButton()">-</button>
                            <input type="text" name="num" value="1" class="num">
                            <button class="rightButton" type="button" onclick="rightButton()">+</button>

                            <button type="submit" value="加入購物車" class="btn btn-outline-dark btn-lg bs">加入購物車</button>
                        </form>

                    </div>


                </div>
            </div>
            <!-- 推薦食譜 -->
            <div class="recommend row">
                <p>推薦食譜</p>
                <script>
                    $.ajax({
                        url: "${pageContext.request.contextPath}/recommend/${id}",
                        type: "get",
                        success: function (json) {
                            for (var A of json) {
                                console.log(A);
                                $(".recommend").append('<a href="../recipeDetails?id=' + A.recId + '" class="col-lg-6 col-sm-6"><div class="row recommendRecipe">' +
                                    '<img class="col-lg-3 col-md-7 col-sm-6 rsNavItem" src=' + A.recPic + ' alt="">' +
                                    ' <p class="col-lg-6 col-sm-6">' + A.recTitle + '</p>' +
                                    ' </div> </a>');
                            }
                        },
                        error: function (json) {
                            console.log("error 推薦食譜" + json);
                        }
                    });
                </script>
            </div>
            <!-- 同類商品 -->
            <div class="SimilarProducts row">
                <hr>
                <p>同類商品</p>

                <script>
                    $.ajax({
                        url: "${pageContext.request.contextPath}/category/" + id,
                        type: "get",
                        success: function (json) {
                            var arr = Object.keys(json);
                            var a = 1
                            if (arr.length > 4) {
                                a = 4;
                            } else {
                                a = arr.length;
                            }

                            for (var i = 0; i < a; i++)
                                $(".SimilarProducts").append('<figure class="col-lg-2 col-sm-4"><a href="${pageContext.request.contextPath}/Details/' + json[i].productid + '"><img src="../images/shop/' + json[i].productmodel + '-1.jpg" alt="">' + json[i].productname + '</a></figure>');
                        },
                        error: function (json) {
                            console.log("errr");
                        }
                    });
                    $('.catReturn').click(function () {
                        $(".hazy").css("visibility", "hidden");
                    });

                </script>

            </div>
        </div>
    </div>

    <!-- 右邊至頂 -->

    <div class="toUP">
        <span class="fontIcon" id="toUp"></span>
    </div>
</div>
</div>
<script src="../js/umbrella.js"></script>
<script src="../js/shoopCat.js"></script>
</body>

<script>
    // 商品資料
    $.ajax({
        url: "${pageContext.request.contextPath}/pic/" + id,
        type: "get",
        async: false,
        success: function (pic) {

            var i = 0;
            for (var A of pic) {

                $(".list").append('<img class="rsimg" src="../images/shop/' + A.producturl + '.jpg" alt="">');
                $(".producturl").append('<img class="rsNavItem" onclick="rsmove(' + i + ')" src="../images/shop/' + A.producturl + '.jpg" alt="">');
                i++;
            }
        }
    })
</script>

</html>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>