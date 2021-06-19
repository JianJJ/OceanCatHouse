<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!-- 拼接header -->
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
    <script src="../js/jquery-3.4.1.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="../css/demo.css">
    <link rel="stylesheet" href="../css/ShoppingMall.css">
    <title>✿海貓食屋✿</title>

</head>

<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<canvas id="canvas"></canvas>
<!-- <%--購物車插入--%> -->

<jsp:include page="/WEB-INF/views/shop/shopCat.jsp"></jsp:include>

<div class="container-fluid">
    <%--                <div class="row">--%>
    <%--                    <div class="col-lg-12">--%>

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
        <div class="col-lg-3 barNav">
            <ul>
                <li class="fontIcon" id="f1"></li>
                <li class="fontIcon"></li>
                <li class="fontIcon"></li>
                <li class="fontIcon"></li>
            </ul>
        </div>

        <!-- 網頁中間內文 -->

        <div class=" main col-lg-6">


            <!-- 這裡有商品 -->
            <script>


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
                            $(".AAA" + x).append('<div class="col-sm-6 col-lg-3 Product"><a href="/recipe/Details/' + json[i].productid + '"><figure><img src="../images/shop/' + json[i].productmodel + '-1.jpg" alt=""><h2>' + json[i].productname + '</h2></figure></a></div>');
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
        <div class="col-lg-3">
            <!-- 右邊至頂 -->
            <div class="toUP">
                <span class="fontIcon" id="toUp"></span>
            </div>
        </div>

    </div>
    <!-- 分頁表 -->
    <%--        //最多頁數--%>
    <script>
        $(document).ready(function () {
            var url = location.href;
            if (url.indexOf("pag") == -1 || url.indexOf("pag=1") != -1) {
                $(".per").remove();
            }
            $.ajax({
                url: "/recipe/pag/${param.categoryid}",
                type: "get",
                success: function (max) {

                    for(var i = 1; i<= max ; i ++ ){

                        $(".pagination").append('<li class="page-item"><a class="page-link" href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag='+i+'">'+i+'</a></li>');
                    }
                    if(max != '${param.pag}' )
                     $(".pagination").append('<li class="page-item"><a class="page-link" href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=${param.pag==null?2:param.pag+1}"'+
                    'aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>');


                },
                error: function (pag) {
                    console.log("error");
                }
            })


            // $(".page-item").remove();
        })
    </script>


    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item per">
                <a class="page-link"
                   href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=${param.pag==1?1:param.pag-1}"
                   aria-label="Previous">
                    <span>&laquo;</span>
                </a>
            </li>


<%-- <li class="page-item"><a class="page-link" href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=${param.pag+1}"--%>
<%--                   aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>--%>
        </ul>
    </nav>


    <script src="../js/umbrella.js"></script>
    <script src="../js/shoopCat.js"></script>
    <%--                </div>--%>
    <%--                <div class="row">--%>

    <%--                </div>--%>
</div>
</body>

</html>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>