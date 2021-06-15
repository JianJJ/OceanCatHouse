<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

            <!-- Latest compiled and minified JavaScript -->
            <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
            <script src="../js/jquery-3.4.1.js"></script>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="../css/demo.css">
            <link rel="stylesheet" href="../css/Details.css">
			<script type="text/javascript"> 
            var id ="${id}";
            console.log("id : "+id);
            </script>

            <title>✿海貓食屋✿</title>
        </head>

        <body>
            <!-- 動態背景 -->
            <canvas id="canvas"></canvas>
            <!-- <%--購物車插入--%> -->
            <jsp:include page="/shoopCat.jsp"></jsp:include>
            <!-- 1header部分 -->
            <div class="row ">
            <jsp:include page="/header.jsp"></jsp:include>
			</div>
            <!-- 分類條 -->
            <div class="row menu">
                <div id="home" class="col-lg-1">
                    <a href="../views/ShoppingMall"><img src="../images/home.png" alt=""></a>
                </div>
                <a class="col-lg-1 menuDetail" href="../views/ShoppingMall?categoryid=1">米麵五穀</a>
                <a class="col-lg-1 menuDetail" href="../views/ShoppingMall?categoryid=5">油</a>
                <a class="col-lg-1 menuDetail" href="../views/ShoppingMall?categoryid=4">醬料</a>
                <a class="col-lg-1 menuDetail" href="../views/ShoppingMall?categoryid=2">蔬果</a>
                <a class="col-lg-1 menuDetail" href="../views/ShoppingMall?categoryid=3">生鮮</a>
                <a class="col-lg-1 menuDetail" href="../views/ShoppingMall?categoryid=6">乾貨</a>
            </div>


            <!-- 中間部分 -->

            <div class="row ">
                <!-- 左邊浮動區塊 -->
                <div class="col-lg-1 ">
                    <div class="barNav">

                        <ul>
                            <li class="fontIcon" id="f1"></li>
                            <li class="fontIcon"></li>
                            <li class="fontIcon"></li>
                            <li class="fontIcon"></li>
                        </ul>
                    </div>
                </div>

                <!-- 網頁中間內文 -->
                <div class="col-lg-10 ">
                    <div class="cenBody">
                        <!-- 輪播圖  -->
                        <div class="cenDetail row" >
                            <div class="col-lg-6 col-sm-12 leftImg ">
                                <div class="banner">
                                    <div class="list">
                                        <!--這裡有輪播圖  -->
                                    </div>
                                </div>
                                <div class="producturl">
                                    <!--這裡有小圖  -->

                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-12 rightImg ">
                                <br>
                                <h2 class="productname"> ${productname}</h2>
                                
                                <hr>
                                <br>
                                <div class="producttext">${producttext}
                                </div>
                                <br>
                                <div class="productspecifications">商品規格:${productspecifications}</div>
                                <br>
                                <div>付款方式
                                    信用卡支付 / ATM轉帳 / 貨到付款($30)
                                    運送方式
                                    宅配 / 7-11取貨($60)</div>
                                <hr>
                                <div class="sellingprice">售價 ${sellingprice}</div>
                                <div>

                                    <form action="/recipe/cat/${id}">
                                        <button class="leftButton" type="button" onclick="leftButton()">-</button>
                                        <input type="text" name="num" value="1" class="num">
                                        <button class="rightButton" type="button" onclick="rightButton()">+</button>
                                        <input type="submit" value="加入購物車">
                                    </form>

                                </div>
                                <div></div>

                            </div>
                        </div>
                        <!-- 推薦食譜 -->
                        <div class="recommend row">
                            <p>推薦食譜</p>
                            <script>
                                $.ajax({
                                    url: "/recipe/recommend/${id}",
                                    type: "get",
                                    success: function (json) {
                                        for (var A of json) {
                                                $(".recommend").append('<div class="col-lg-6 col-sm-12 recommendRecipe">' +
                                                '<img class="rsNavItem" src=' + A.recPic + ' alt="">' +
                                                ' <p>' + A.recTitle + '</p>' +
                                                ' </div>');
                                        }
                                    },
                                    error: function (json) {
                                        console.log("error" + json);
                                    }
                                });
                            </script>
                        </div>
                        <!-- 同類商品 -->
                        <div class="SimilarProducts row">
                            <p>同類商品</p>
                            <script>
                                $.ajax({
                                    url: "/recipe/category/"+id,
                                    type: "get",
                                    success: function (json) {
                                        var arr = Object.keys(json);
                                        var a = 1
                                        if (arr.length > 6) {
                                            a = 6;
                                        } else {
                                            a = arr.length;
                                        }

                                        for (var i = 0; i < a; i++)
                                            $(".SimilarProducts").append('<figure class="col-lg-2 col-sm-4"><a href="/recipe/Details/' + json[i].productid + '"><img src="../images/' + json[i].productmodel + '-1.jpg" alt="">' + json[i].productname + '</a></figure>');
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

            <jsp:include page="/footer.jsp"></jsp:include>
            <script src="../js/umbrella.js"></script>
            <script src="../js/shoopCat.js"></script>
        </body>

        </html>