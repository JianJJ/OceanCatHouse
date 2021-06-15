<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="../css/demo.css">
            <link rel="stylesheet" href="../css/ShoppingMall.css">
            <title>✿海貓食屋✿</title>

        </head>

        <body>
             <canvas id="canvas"></canvas>
            <!-- <%--購物車插入--%> -->

            <jsp:include page="/shoopCat.jsp"></jsp:include>

            <div class=".container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- header部分 -->
                        <div class="row">
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
                        <div class="row centerA">
                            <!-- 左邊浮動區塊 -->
                            <div class="col-lg-1 barNav">
                                <ul>
                                    <li class="fontIcon" id="f1"></li>
                                    <li class="fontIcon"></li>
                                    <li class="fontIcon"></li>
                                    <li class="fontIcon"></li>
                                </ul>
                            </div>

                            <!-- 網頁中間內文 -->

                            <div class="col-lg-10 main ">


                                <!-- 這裡有商品 -->
                                <script>
                                    var categoryid = 0;
                                    // categoryid= '${param.categoryid}';
                                    if (categoryid == null) {
                                        console("categoryid")
                                    };
                                    $.ajax({
                                        url: "/recipe/shopping/${param.categoryid}/${param.pag}",
                                        type: "get",
                                        success: doSuccess,
                                        error: doError
                                    })
                                    var i = 0;
                                    function doSuccess(json) {
                                        console.log(json);
                                        for (var x = 0; x < 3; x++) {
                                            $(".main").append('<div class="row AAA' + x + '">');
                                            for (var y = 1; y < 5; y++) {
                                                $(".AAA" + x).append('<div class="col-sm-6 col-lg-3 Product"><a href="/recipe/Details/' + json[i].productid + '"><figure><img src="../images/' + json[i].productmodel + '-1.jpg" alt=""><h2>' + json[i].productname + '</h2></figure></a></div>');
                                                i++;
                                            }
                                            $(".main").append('</div>');

                                        }

                                    }

                                    function doError(json) {
                                        console.log("error");
                                    }
                                </script>

                            </div>
                            <div class="col-lg-1">
                                <!-- 右邊至頂 -->
                                <div class="toUP">
                                    <span class="fontIcon" id="toUp"></span>
                                </div>
                            </div>

                        </div>
                        <!-- 分頁表 -->
                        <nav class="pag">
                            <ul class="pagination">
                                <li>
                                    <a href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=${param.pag-1}"
                                        aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li>
                                    <a
                                        href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=1">1</a>
                                </li>
                                <li>
                                    <a
                                        href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=2">2</a>
                                </li>
                                <li>
                                    <a
                                        href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=3">3</a>
                                </li>
                                <li>
                                    <a
                                        href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=4">4</a>
                                </li>
                                <li>
                                    <a
                                        href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=5">5</a>
                                </li>
                                <li>
                                    <a href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=${param.pag+1}"
                                        aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>

                    <script src="../js/umbrella.js"></script>
                    <script src="../js/shoopCat.js"></script>
                </div>
                <div class="row">
                    <jsp:include page="/footer.jsp"></jsp:include>
                </div>
            </div>
        </body>

        </html>