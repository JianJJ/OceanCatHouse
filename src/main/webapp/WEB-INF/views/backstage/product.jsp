<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <!--    JavaScript; choose one of the two!-->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/jquery-3.6.0.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/createRecipe/createRecipeDetail.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">
    <style>
        .headtop {
            position: sticky;
            top: 0px;
            z-index: 5;
        }

        .navfix {
            position: fixed;
            top: 80px;
            height: 100vh;
        }

        .navfix li {
            border: none;
            cursor: pointer;
        }

        .navfix li:hover {
            background-color: #afe3d5;
            color: #0c4128;
        }

        .list-group-item {
            background-color: transparent;
            color: white;
        }
    </style>
</head>


<body>
<!-- 購物車 -->
<div class="hazy">
    <div class="cat">
        <button class="catReturn">X</button>
        <form action="/recipe/backstage/updata/" class="form" method="post">
            <button type="submit" class="">修改</button>
            <!-- 這裡有圖 -->
            <div class="form-group"><label id="productid">商品ID : '+A.productid+'</label></div>

            <div class="form-group"><label for="productname">名稱</label>
                <input type="text" class="form-control" id="productname" value="'+A.productname+'" name="productname">
            </div>

            <div class="form-group"><label for="productmodel">商品號</label>
                <input type="text" class="form-control" id="productmodel" value="'+A.productmodel+'"
                       name="productmodel"></div>

            <div class="form-group"><label for="producttext">詳細描述</label>
                <input type="text" class="form-control" id="producttext" value="'+A.producttext+'" name="producttext">

            </div>
            <div class="form-group"><label for="purchaseprice">進價</label>
                <input type="text" class="form-control" id="purchaseprice" value="'+A.purchaseprice+'"
                       name="purchaseprice"></div>

            <div class="form-group"><label for="sellingprice">售價</label>
                <input type="text" class="form-control" id="sellingprice" value="'+A.sellingprice+'"
                       name="sellingprice"></div>

            <div class="form-group"><label for="stocks">庫存</label>
                <input type="text" class="form-control" id="stocks" value="'+A.stocks+'" name="stocks"></div>

            <div class="form-group"><label for="productspecifications">商品規格</label>
                <input type="text" class="form-control" id="productspecifications" value="'+A.productspecifications+'"
                       name="productspecifications"></div>


            <label for="vendorid">廠商號</label>
            <select class="form-select" aria-label="Default select example" id="vendorid" name="vendorid">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>

            <label for="productcategoryid">分類號</label>
            <select class="form-select" aria-label="Default select example" id="productcategoryid"
                    name="productcategoryid">
                <option value="1">1 五穀雜糧</option>
                <option value="2">2 蔬果</option>
                <option value="3">3 生鮮</option>
                <option value="4">4 醬料</option>
                <option value="5">5 油</option>
                <option value="6">6 乾貨</option>
            </select>

            <label for="vendorid">產品狀態</label>
            <select class="form-select" aria-label="Default select example" id="productstatus" name="productstatus">
                <option value="1">1 銷售</option>
                <option value="2">2 下架</option>
            </select>

            <div class="form-group"><label id="createdon">創建日期 : '+A.createdon+'</label></div>
            <div class="form-group"><label id="lastupdatedon">上次修改日期 : '+A.lastupdatedon+'</label></div>

        </form>
    </div>
</div>



<%--    頁首--%>
<header class="container-fluid mainColor headtop">
    <div class="title">廠商後台</div>

    <button class="userIcon"></button>
</header>


<%--    側邊欄--%>
<div class="col-md-2 navfix mainColor">
    <ul class="list-group">
        <button class="list-group-item" onclick="javascript:location.href='/recipe/backstage/order?pag=1'">訂單管理</button>
        <button class="list-group-item" onclick="javascript:location.href='/recipe/backstage/product?pag=1'">商品管理</button>
        <button class="list-group-item">會員管理</button>
        <button class="list-group-item">員工管理</button>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>
            <div class="row ">
                <div class="col-lg-1">
                <button type="button" class="btn btn-primary ccc " id="addPoduct">新增</button>
                </div >
                <style>
                    .ccc{
                        position: relative;
                        top: 5px;
                    }
                </style>
                <div class="col-lg-3 ccc">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="名稱" aria-label="Recipient's username" aria-describedby="button-addon2" id="selectProduct">
                        <button class="btn btn-outline-secondary" type="button" id="buttonaddon2">搜索</button>
                    </div>
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->

            <div class="row">
                <table class="table table-striped">
                    <tr>
                        <td>id</td>
                        <td>modela</td>
                        <td>名稱</td>
                        <td>進價</td>
                        <td>售價</td>
                        <td>庫存</td>
                        <td>規格</td>
                        <td>圖片</td>
                    </tr>
                </table>
            </div>
            <%--       分頁表--%>
            <div class="row lll">
                <div class="col-lg-5"></div>
                <nav aria-label="Page navigation example" class="col-lg-1">
                    <ul class="pagination">
                        <li class="page-item per">
                            <a class="page-link" href="" aria-label="Previous"> <span>&laquo;</span> </a>
                        </li>
<%--                        <li class="page-item"><a class="page-link" href="">1</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>--%>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<script>
    var p = '${param.pag}';
    if(p == "")p=1;
    // 分頁管理
    $(document).ready(function () {
        var url = location.href;
        if (url.indexOf("pag") == -1 || url.indexOf("pag=1") != -1) {
            $(".per").remove();
        }
        $.ajax({
            url: "/recipe/backstage/product/data/"+p,
            type: "get",
            success: function (max) {

                for(var i = 1; i<= max ; i ++ ){

                    $(".pagination").append('<li class="page-item"><a class="page-link" href="/recipe/backstage/product?pag='+i+'">'+i+'</a></li>');
                }
                if(max != '${param.pag}' )
                    $(".pagination").append('<li class="page-item"><a class="page-link" href="/recipe/backstage/product?pag=${param.pag==null?2:param.pag+1}"'+
                        'aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>');


            },
            error: function (pag) {
                console.log("error");
            }
        })


        // $(".page-item").remove();
    })

    <%--    商品管理--%>

    $.ajax({
        url: "/recipe/backstage/product/"+p,
        type: "post",
        async: false,
        success: doSuccess,
        error: doError
    });

    //取得列表
    function doSuccess(json) {
        $(".TTT").remove();
        for (var A of json) {
            $(".table").append('<tr class="TTT" >' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-1">' + A.productid + '</td>' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-1 ">' + A.productmodel + '</td>' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-2 ">' + A.productname + '</td>' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-1 ">' + A.purchaseprice + '</td>' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-1 ">' + A.sellingprice + '</td>' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-1 ">' + A.stocks + '</td>' +
                '<td onclick="Detailed(' + A.productid + ')" class="col-lg-1 ">' + A.productspecifications + '</td>' +
                '<td  class="col-lg-1 "> 圖片 </td>' +
                '</tr>');
        }
    }

    function doError(json) {
        console.log(json);
    }

    // 顯細資料
    function Detailed(id) {
        console.log(id);
        $(".hazy").css("visibility", "visible");
        $.ajax({
            url: "/recipe/product/" + id,
            type: "get",
            contentType: "application/json",
            dataType: "json",
            success: function (A) {
                $("#productid").text("商品ID : " + A.productid);
                $("#productname").val(A.productname);
                $("#productmodel").val(A.productmodel);
                $("#producttext").val(A.producttext);
                $("#purchaseprice").val(A.purchaseprice);
                $("#sellingprice").val(A.sellingprice);
                $("#stocks").val(A.stocks);
                $("#productspecifications").val(A.productspecifications);
                $("#vendorid").val(A.vendorid);
                $("#productcategoryid").val(A.productcategoryid);
                $("#productstatus").val(A.productstatus);
                $("#createdon").text("創建日期 : " + A.createdon);
                $("#lastupdatedon").text("上次修改日期 : " + A.lastupdatedon);
                $(".form").attr("action", "/recipe/backstage/updata/" + A.productid);
            },
            error: doError
        });


    }

    $(document).ready(function () {
            //新增商品
            $("#addPoduct").click(function () {
                $(".form").empty();
                $(".hazy").css("visibility", "visible");
                $(".form").prepend('<button type="submit" class="">新增</button>' +
                    '  <div class="form-group"><label id="productid">商品ID : </label></div>' +
                    '<div class="form-group"><label for="productname">名稱</label>' +
                    '<input type="text" class="form-control" id="productname" placeholder="productname" name="productname"></div>' +
                    '<div class="form-group"><label for="productmodel">商品號</label>${errors.productmodel}' +
                    '<input type="text" class="form-control" id="productmodel" placeholder="productmodel" name="productmodel"></div>' +
                    '<div class="form-group"><label for="producttext">詳細描述</label>${errors.producttext}' +
                    '<input type="text" class="form-control" id="producttext" placeholder="producttext" name="producttext">' +
                    '</div><div class="form-group"><label for="purchaseprice">進價</label>${errors.purchaseprice}' +
                    '<input type="text" class="form-control" id="purchaseprice" placeholder="purchaseprice" name="purchaseprice"></div>' +
                    '<div class="form-group"><label for="sellingprice">售價</label>${errors.sellingprice}' +
                    '<input type="text" class="form-control" id="sellingprice" placeholder="sellingprice" name="sellingprice"></div>' +
                    '<div class="form-group"><label for="stocks">庫存</label>${errors.stocks}' +
                    '<input type="text" class="form-control" id="stocks" placeholder="stocks" name="stocks"></div>' +
                    '<div class="form-group"><label for="productspecifications">商品規格</label>${errors.productspecifications}' +
                    ' <input type="text" class="form-control" id="productspecifications" placeholder="productspecifications" name="productspecifications"></div>' +
                    '<label for="vendorid">廠商號</label>' +
                    '<select class="form-select" aria-label="Default select example" id="vendorid" name="vendorid">' +
                    '<option value="1">1</option> <option value="2">2</option><option value="3">3</option></select>' +
                    '<label for="productcategoryid">分類號</label>' +
                    '<select class="form-select" aria-label="Default select example" id="productcategoryid" name="productcategoryid">' +
                    '<option value="1">1 五穀雜糧</option><option value="2">2 蔬果</option><option value="3">3 生鮮</option><option value="4">4 醬料</option>' +
                    '<option value="5">5 油</option><option value="6">6 乾貨</option></select>' +
                    '<label for="vendorid">產品狀態</label>' +
                    '<select class="form-select" aria-label="Default select example" id="productstatus" name="productstatus">' +
                    '<option value="1">1 銷售</option><option value="2">2 下架</option></select>' +
                    '<div class="form-group"><label id="createdon">創建日期</label></div>' +
                    '<div class="form-group"><label id="lastupdatedon">上次修改日期</label></div>'
                )
                ;
            })
            // 關閉按紐
            $('.catReturn').click(function () {
                $(".hazy").css("visibility", "hidden");
                // $(".form").empty();

            });
        }
    );
    //搜索按鈕
    $("#buttonaddon2").click(function (){
        console.log("#buttonaddon2" +$("#selectProduct").val());

        $.ajax({
            url: "/recipe/backstage/selectproduct/"+$("#selectProduct").val(),
            type: "post",
            async: false,
            success: doSuc,
            error: doError
        });

        //取得列表
        function doSuc(json) {
            $(".TTT").remove();
            $(".lll").remove();
            for (var A of json) {
                $(".table").append('<tr class="TTT" onclick="Detailed(' + A.productid + ')"><td class="col-lg-1">' + A.productid + '</td>' +
                    '<td class="col-lg-1 ">' + A.productmodel + '</td>' +
                    '<td class="col-lg-2 ">' + A.productname + '</td>' +
                    '<td class="col-lg-1 ">' + A.purchaseprice + '</td>' +
                    '<td class="col-lg-1 ">' + A.sellingprice + '</td>' +
                    '<td class="col-lg-1 ">' + A.stocks + '</td>' +
                    '<td class="col-lg-1 ">' + A.productspecifications + '</td>' +
                    '<td class="col-lg-1 "> 圖片 </td>' +
                    '</tr>');
            }
        }










    })


</script>
<style>
    .TTT:hover {
        background-color: #afe3d5;
    }

    .hazy {
        visibility: hidden;
        position: fixed;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 50;

    }

    .cat {
        border: blue 1px solid;
        background-color: white;
        width: 830px;
        height: 850px;
        z-index: 25;
        position: fixed;
        left: 0%;
        right: 0%;
        margin: auto;
        top: 50px;
        border-radius: 15px;
    }

    .cat form {
        top: 10px;
        position: relative;
        left: 20px;
    }

    .cat input {
        width: 95%;
    }

    .cat select {
        width: 95%;
    }

    /* 購物車返回 */
    .catReturn {
        top: -10px;
        right: -10px;
        position: absolute;
        background-color: red;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        z-index: 20;
    }
</style>
</body>
</html>
