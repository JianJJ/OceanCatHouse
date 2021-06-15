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
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <script src="../js/jquery-3.4.1.js"></script>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="../css/demo.css">
            <link rel="stylesheet" href="../css/Details.css">


            <title>Louiswwwww</title>
        </head>

        <body>
            <!-- 動態背景 -->
            <canvas id="canvas"></canvas>
            <%--購物車插入--%>
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
                            <div class="col-lg-6 leftImg ">
                                <div class="banner">
                                    <div class="list">
                                        <!--這裡有輪播圖  -->
                                    </div>
                                </div>
                                <div class="producturl">
                                    <!--這裡有小圖  -->

                                </div>
                            </div>
                            <div class="col-lg-6 rightImg ">
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
                                            console.log(A);
                                            $(".recommend").append('<div class="col-lg-6 recommendRecipe">' +
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
                                    url: "/recipe/category/${id}",
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
                                            $(".SimilarProducts").append('<figure class="col-lg-2"><a href="/recipe/Details/' + json[i].productid + '"><img src="../images/' + json[i].productmodel + '-1.jpg" alt="">' + json[i].productname + '</a></figure>');
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
            <script>
                var CatProduct;//購物車 id:數量
                var c = [];//合計
                var sell = [];//售價
                // 商品資料
                $.ajax({
                    url: "/recipe/pic/${id}",
                    type: "get",
                    async: false,
                    success: function (pic) {

                        var i = 0;
                        for (var A of pic) {

                            $(".list").append('<img class="rsimg" src="../images/' + A.producturl + '.jpg" alt="">');
                            $(".producturl").append('<img class="rsNavItem" onclick="rsmove(' + i + ')" src="../images/' + A.producturl + '.jpg" alt="">');
                            i++;
                        }
                    }
                })
                //購物車資料

                $.ajax({
                    url: "/recipe/catData",
                    type: "get",
                    async: false,
                    // dataType: "json",
                    success: function (json) {
                        CatProduct = json;
                        var key = Object.keys(json);
                        $('.barNav').prepend('<spean class="catNum">' + key.length + '</spean>');
                        for (var A in json) {

                            //用id找資料
                            $.ajax({
                                url: "/recipe/product/" + A,
                                type: "get",
                                async: false,
                                success: function (product) {
                                    sell[product.productid] = product.sellingprice;
                                    c[product.productid] = product.sellingprice * json[product.productid];//合計
                                    $('.cat').prepend('<div class="catProduct" id="catProduct' + product.productid + '">' +
                                        '<img src="../images/' + product.productmodel + '-1.jpg" alt="">' +
                                        '<div class="context"><h1>' + product.productname + '</h1><br>' +
                                        '<span>商品規格:' + product.productspecifications + '</span></div>' +
                                        '<div><span class="cash">' + product.sellingprice + '</span>' +
                                        '<button class="catProductLeftButton" type="button" onclick="cutCat(' + product.productid + ')">-</button>' +
                                        '<input type="number" name="catProductNum' + product.productid + '" value="' + json[product.productid] + '" class="pnum" id="pnum' + product.productid + '">' +
                                        '<button class="catProductRightButton" type="button" onclick="addCat(' + product.productid + ')">+</button>' +
                                        '<span class="total" id="total' + product.productid + '">合計:' + c[product.productid] + '</span></div>' +
                                        '<button class="del" onclick="delCat(' + product.productid + ')">刪除</button></div>');

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
                // 數量按鈕
                // $(document).ready(function() {
                function rsmove(i) {
                    $(".list").css("left", -i * 505 + 'px');
                }
                function rightButton() {
                    var i = $(".num").val();
                    i++;
                    $(".num").val(i);
                }
                function leftButton() {
                    var i = $(".num").val();
                    if (i == 1) {
                        i = 1;
                    } else {
                        i--;
                    }
                    $(".num").val(i);
                }
                //購物車數量
                // 增加數量
                function addCat(A) {
                    var AAA = JSON.stringify(CatProduct);

                    $.ajax({
                        url: "/recipe/addCat/" + A,
                        type: "post",
                        contentType: "application/json",
                        dataType: "json",
                        data: AAA,
                        success: function (json) {
                            //總價
                            var key = Object.keys(json);

                            var m = 0;
                            for (var k in json) {

                                m += json[k] * sell[k];
                            }

                            $(".PPP").text("總價:" + m);

                        },
                        error: function (json) {
                            console.log("delCat*****err " + json);
                        }
                    })
                    var i = $("#pnum" + A).val();
                    i++;
                    $("#pnum" + A).val(i);
                    CatProduct[A]++;
                    $("#total" + A).text("合計:" + CatProduct[A] * sell[A]);//計算合計


                }
                function cutCat(A) {

                    var i = $("#pnum" + A).val();
                    if (i == 1) {
                        i = 1;
                        CatProduct[A] = 1;
                    } else {
                        var AAA = JSON.stringify(CatProduct);
                        $.ajax({
                            url: "/recipe/cutCat/" + A,
                            type: "post",
                            contentType: "application/json",
                            dataType: "json",
                            data: AAA,
                            success: function (json) {
                                //總價
                                var key = Object.keys(json);
                                var m = 0;
                                for (var k in json) {

                                    m += json[k] * sell[k];
                                }
                                $(".PPP").text("總價:" + m);
                            },
                            error: function (json) {
                                console.log("delCat*****err " + json);
                            }
                        });
                        i--;
                        CatProduct[A]--;

                    }
                    $("#pnum" + A).val(i);
                    $("#total" + A).text("合計:" + CatProduct[A] * sell[A]);//計算合計

                }
                //購物車刪除

                function delCat(id) {
                    var AAA = JSON.stringify(CatProduct);
                    $.ajax({
                        url: "/recipe/delCat/" + id,
                        type: "post",
                        contentType: "application/json",
                        dataType: "json",
                        async: false,
                        data: AAA,
                        success: function (json) {
                            var key = Object.keys(json);
                            $(".catNum").text(key.length);
                            $("#catProduct" + id).remove();
                            CatProduct = json;
                            if (key.length == 0)
                                window.location.assign("/recipe/Details/${id}");
                        },
                        error: function (json) {
                            console.log("delCat*****err " + json);
                        }
                    })

                }
                var tt = 0;
                //開關購物車  
                $('#f1').click(function () {
                    $(".hazy").css("visibility", "visible");
                });
                $('.barNav').click(function () {
                    $(".hazy").css("visibility", "visible");
                });


                //總價
                var key = Object.keys(CatProduct);
                var m = 0;
                for (var k of key) {
                    m += CatProduct[k] * sell[k];
                }
                $(".PPP").text("總價:" + m);


                $(".catSubmit").click(function () {
                    console.log("總價 " + m);
                    // window.location.assign("/recipe/Details/${id}");
                })

            </script>
        </body>

        </html>