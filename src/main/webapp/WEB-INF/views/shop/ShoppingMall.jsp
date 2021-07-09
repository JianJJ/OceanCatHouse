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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">


    <%-- jQuery放這裡 --%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav_forShop.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ShoppingMall.css">
    <title>✿海貓食屋✿</title>

</head>

<body>
<!-- <%--購物車插入--%> -->
<jsp:include page="/WEB-INF/views/shop/shopCat.jsp"></jsp:include>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav_forShop.jsp"></jsp:include>

<!-- 動態背景 -->
<canvas id="canvas"></canvas>




<!-- 左邊浮動區塊 -->
<div class="barNav d-none d-lg-inline-block">
    <ul>
        <li class="fontIcon"><span  id="f1"></span></li>
    </ul>
</div>
<div class="container">
    <!-- 中間部分 -->
    <div class="row">


        <!-- 網頁中間內文 -->

        <div class="main col-lg-11">

            <!-- 這裡有商品 -->
            <script>

                if ('${param.searchString}'!= ""){
                    console.log("param.searchString   null");
                    var url ="${pageContext.request.contextPath}/backstage/selectproduct/${param.searchString}";
                }else{
                    var url ="${pageContext.request.contextPath}/shopping/${param.categoryid}/${param.pag}";
                }
                $.ajax({
                    url: url,
                    type: "get",
                    success: doSuccess,
                    error: doError
                })
                var i = 0;

                function doSuccess(json) {

                    for (var x = 0; x < 3; x++) {
                        $(".main").append('<div class="row AAA' + x + ' ">');
                        for (var y = 1; y < 5; y++) {
                            if(json[i]==null)break;
                            $(".AAA" + x).append('' +
                                '<div class="col-sm-6 col-md-6 col-lg-3 Product">' +
                                '<a href="${pageContext.request.contextPath}/Details/' + json[i].productid + '">' +
                                '<figure><img src="../images/shop/' + json[i].productmodel + '-1.jpg" alt="">' +
                                '<h2>' + json[i].productname + '</h2></figure></a></div>');
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


    </div>
    <!-- 分頁表 -->
    <%--        //最多頁數--%>
    <script>
        $(document).ready(function () {
            var url = location.href;
            // 上一頁
            if (url.indexOf("pag") == -1 || url.indexOf("pag=1") != -1) {
                $(".per").remove();
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/pag/${param.categoryid}",
                type: "get",
                success: function (max) {

                    for(var i = 1; i<= max ; i ++ ){

                        $(".pagination").append('<li class="page-item"><a class="page-link" href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag='+i+'">'+i+'</a></li>');
                    }
                    //下一頁
                    if(max != '${param.pag}' )
                     $(".pagination").append('<li class="page-item"><a class="page-link" href="../views/ShoppingMall?categoryid=${param.categoryid==null?0:param.categoryid}&pag=${param.pag==null?2:param.pag+1}"'+
                    'aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>');

                    if(max == '${param.pag}')$(".n").remove();
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



</div>
</body>
<%--    <script src="../js/star2.js"></script>--%>
    <script src="../js/shoopCat.js"></script>

</html>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>