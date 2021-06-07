<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <script src="../js/jquery-3.4.1.js"></script>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="../css/demo.css">
            <link rel="stylesheet" href="../css/Details.css">


            <title>Louiswwwww</title>
        </head>

        <body>
            <script>
                $.ajax({
                    url: "/recipe/Details/" + ${ param.id },
                    type: "get",
                    success: doSuccess,
                    error: doError
                })
                function doSuccess(json) {
                    console.log(json);
                    $(".productname").text(json.productname);
                    $(".producttext").text(json.producttext);
                    $(".sellingprice").text("售價" + json.sellingprice);
                    $(".productspecifications").text("商品規格 :" + json.productspecifications);
                    console.log(json.productmodel);
                    $.ajax({
                        url: "/recipe/pic/" + json.productid,
                        type: "get",
                        success: function (pic) {
                            var i = 0;
                            for (var A of pic) {
                                $(".list").append('<img class="rsimg" src="../images/' + A.producturl + '.jpg" alt="">');
                                $(".producturl").append('<img class="rsNavItem" onclick="rsmove(' + i + ')" src="../images/' + A.producturl + '.jpg" alt="">');
                                i++;
                            }
                        }
                    })
                }
                function doError(json) {
                    console.log("error");
                    console.log(json);
                }
            </script>
            <canvas id="canvas"></canvas>
            <!-- header部分 -->
            <header class="mainColor">
                <div class="title">✿海貓食屋✿</div>
                <div class="littleNav">
                    <ul>
                        <li><a href="#">RECIPES</a> </li>
                        <li><a href="#">SHOP</a></li>
                    </ul>
                </div>
                <div class="simpleSearch">
                    <input type="text" id="searchLine" placeholder="Search...">
                    <label for="searchLine">
                        <span class="fontIcon searchIcon"></span></label>
                </div>

                <div class="Login">
                    <span class="text">SIGN UP</span><em>/</em>
                    <span class="text">LOG IN</span>
                </div>

                <button class="userIcon"></button>

            </header>


            <!-- 中間部分 -->
            <div class="center">
                <!-- 購物車 -->
                <div class="cat">
                    <button class="catReturn">X</button>
                    <div class="catProduct">
                        <img src="../images/AA-01-1.jpg" alt="">
                        <h1>YYYYYYYYYYYYYYYYYYYYYYYYY</h1><br>
                        <p>XXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                        <button class="catProductLeftButton" type="button" onclick="leftButton()">-</button>
                        <input type="text" name="catProductNum" value="1" class="num">
                        <button class="catProductRightButton" type="button" onclick="rightButton()">+</button>
                        <button class="del">刪除</button>

                    </div>
                    <p>合計:</p><button class="catSubmit">確定</button>
                </div>

                <!-- 左邊浮動區塊 -->
                <div class="barNav">
                    <ul>
                        <li class="fontIcon"></li>
                        <li class="fontIcon"></li>
                        <li class="fontIcon"></li>
                        <li class="fontIcon"></li>
                    </ul>
                </div>


                <!-- 網頁中間內文 -->
                <!-- 分類條 -->
                <div class="menu">
                    <div id="home">
                        <a href="../views/ShoppingMall.jsp"><img src="../images/home.png" alt=""></a>
                    </div>
                    <a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=1">米麵五穀</a>
                    <a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=5">油</a>
                    <a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=4">醬料</a>
                    <a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=2">蔬果</a>
                    <a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=3">生鮮</a>
                </div>
                <div class="main">
                    <div class="cenBody">
                        <!-- 輪播圖  -->
                        <div class="cenDetail">
                            <div class="leftImg">
                                <div class="banner">
                                    <div class="list">
                                        <!--這裡有輪播圖  -->
                                    </div>
                                </div>
                                <div class="producturl">
                                    <!--這裡有小圖  -->

                                </div>
                            </div>
                            <div class="rightImg">
                                <br>
                                <h2 class="productname">里仁亞麻仁油300ml</h2>
                                <br>
                                <hr>
                                <br>
                                <div class="producttext">補充人體缺乏的Omega-3脂肪酸，第一道冷壓初榨的亞麻仁油最好，Omega-3含量50%以上。淡淡果香，生飲涼拌好健康。
                                </div>
                                <br><br>
                                <div class="productspecifications">商品規格</div>
                                <br><br>
                                <div>付款方式
                                    信用卡支付 / ATM轉帳 / 貨到付款($30)
                                    運送方式
                                    宅配 / 7-11取貨($60)</div><br>
                                <hr><br>
                                <div class="sellingprice">售價 $420</div>
                                <div>

                                    <form action="">
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
                        <div class="recommend">
                            <script>
                            </script>
                            <div class="recommendRecipe">
                                <img class="rsNavItem" src="../images/4.jpg" alt="">
                                <p>推薦食譜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                            </div>
                            <div class="recommendRecipe">
                                <img class="rsNavItem" src="../images/4.jpg" alt="">
                                <p>推薦食譜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                            </div>
                            <div class="recommendRecipe">
                                <img class="rsNavItem" src="../images/4.jpg" alt="">
                                <p>推薦食譜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                            </div>
                            <div class="recommendRecipe">
                                <img class="rsNavItem" src="../images/4.jpg" alt="">
                                <p>推薦食譜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                            </div>
                            <div class="recommendRecipe">
                                <img class="rsNavItem" src="../images/4.jpg" alt="">
                                <p>推薦食譜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                            </div>
                            <div class="recommendRecipe">
                                <img class="rsNavItem" src="../images/4.jpg" alt="">
                                <p>推薦食譜xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
                            </div>
                        </div>
                        <!-- 同類商品 -->
                        <div class="SimilarProducts">
                            <script>
                                $.ajax({
                                    url: "/recipe/category/" + ${ param.id },
                                    type: "get",
                                    success: function (json) {
                                        for (var A of json)

                                            $(".SimilarProducts").append('<figure><a href="/recipe/views/Details.jsp?id=' + A.productid + '"><img src="../images/' + A.productmodel + '-1.jpg" alt="">' + A.productname + '</a></figure>');

                                    },
                                    error: function (json) {
                                        console.log(json);
                                    }
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

            <footer class="mainColor">
                <dl>
                    <dt>關於我們</dt>
                    <dd><a href="#">公司資訊</a></dd>
                    <dd><a href="#">徵才訊息</a></dd>
                    <dd><a href="#">廣告合作</a></dd>
                    <dd><a href="#">市集上架</a></dd>
                    <dd><a href="#">品牌資產</a></dd>
                    <dd><a href="#">隱私權與條款</a></dd>
                </dl>
                <dl>
                    <dt>會員服務</dt>
                    <dd><a href="#">個人頁面</a></dd>
                    <dd><a href="#">食譜收藏</a></dd>
                    <dd><a href="#">商品訂單</a></dd>
                    <dd><a href="#">帳號設定</a></dd>
                    <dd><a href="#">忘記密碼</a></dd>
                    <dd><a href="#">VIP會員</a></dd>
                </dl>
                <dl>
                    <dt>逛食譜</dt>
                    <dd><a href="#">人氣食譜</a></dd>
                    <dd><a href="#">新廚上菜</a></dd>
                    <dd><a href="#">今日話題</a></dd>
                    <dd><a href="#">醉心食譜</a></dd>
                    <dd><a href="#">全部分類</a></dd>
                </dl>
            </footer>
            <script src="../js/umbrella.js"></script>
            <script>

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
                $(".catReturn").click(function(){
                    $(".cat").css("visibility","hidden");
                });

            </script>
        </body>

        </html>