<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>✿海貓食屋✿商品管理</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <!--    JavaScript; choose one of the two!-->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/jquery-3.6.0.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>


<body>
<div class="char">
    <button class="catReturn">X</button>
<canvas id="canvas">Error</canvas>
</div>
<%--圖片--%>
<div class=" pic">
    <button class="catReturn">X</button>

    <form class="row picmain" action="${pageContext.request.contextPath}/backstage/addPic" method="post"
          enctype='multipart/form-data'>
        <div style="width: 350px;height: 280px; ">
            <img src="${pageContext.request.contextPath}/images/homePic/uploadstep.png" id="img-main1"
                 class="img-thumbnail"/>
            <input type="file" accept="image/*" id="file-main1" name="file"
                   onchange="upload('#file-main', '#img-main');" class="fileInput" value=""/>
        </div>
        <div style="width: 350px;height: 280px; ">
            <img src="${pageContext.request.contextPath}/images/homePic/uploadstep.png" id="img-main2"
                 class="img-thumbnail"/>
            <input type="file" accept="image/*" id="file-main2" name="file"
                   onchange="upload('#file-main', '#img-main');" class="fileInput" value=""/>
        </div>
        <button type="submit" class="btn btn-primary pciSubmit">提交</button>
    </form>

</div>

<!-- 購物車 -->
<div class="hazy">
</div>
<div class="cat">
    <button class="catReturn">X</button>
    <form action="${pageContext.request.contextPath}/backstage/updata/" class="form" method="post">

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

        <%--        <div class="form-group"><label id="createdon">創建日期 : '+A.createdon+'</label></div>--%>
        <%--        <div class="form-group"><label id="lastupdatedon">上次修改日期 : '+A.lastupdatedon+'</label></div>--%>
        <button type="submit" class="">修改</button>
    </form>
</div>

<%--    頁首--%>
<header class="container-fluid mainColor headtop">
    <a href="<c:url value="/backstage/home" />" class="title">廠商後台</a>
<%--    <button class="userIcon"></button>--%>
</header>


<%--    側邊欄--%>
<div class="col-md-2 navfix mainColor">
    <ul class="list-group">
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/order?pag=1&state=1'">
            訂單管理
        </button>
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/product?pag=1&state=1'">
            商品管理
        </button>
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/user/0'">會員管理
        </button>
        <button class="list-group-item "
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/staff'">員工管理
        </button>
        <%--        <button class="list-group-item"--%>
        <%--                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics'">統計--%>
        <%--        </button>--%>
        <div class="accordion accordion-flush" id="accordionExample">
            <div class="accordion-item ">
                <h2 class="accordion-header BBB text-center" id="headingOne">
                    <button class="accordion-button  AAA " type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <%--                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        銷售圖表
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse " aria-labelledby="headingOne"
                     data-bs-parent="#accordionExample">

                    <div class="accordion-body">
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=1&time=3'">米麵五穀
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=5&time=3'">植物油
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=4&time=3'">醬料
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=2&time=3'">蔬果
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=3&time=3'">生鮮
                        </a><br>
                        <a class=""
                           onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/statistics?category=6&time=3'">乾貨
                        </a><br>

                    </div>
                </div>
            </div>
        </div>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>
            <div class="row ">
                <div class="col-lg-3 btn-grou ccc">
                    <a href="#" class="btn btn-primary active" aria-current="page" id="addPoduct">新增商品</a>
                    <a href="${pageContext.request.contextPath}/backstage/product?pag=1&state=1" class="btn btn-primary active"
                       aria-current="page" id="Poduct">一般商品</a>
                    <a href="#" class=" state btn btn-primary ">下架商品</a>
                </div>


                <style>
                    .ccc {
                        position: relative;
                        top: 5px;
                    }
                </style>
                <div class="col-lg-3 ccc">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="名稱" aria-label="Recipient's username"
                               aria-describedby="button-addon2" id="selectProduct">
                        <button class="btn btn-outline-secondary" type="button" id="buttonaddon2">搜索</button>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table table-striped">
                    <tr>
                        <td>ID</td>
                        <td>商品號</td>
                        <td>名稱</td>
                        <td>售價</td>
                        <td>庫存</td>
                        <td>圖片</td>
                        <td>圖表</td>
                    </tr>
                    <c:forEach varStatus="loop" begin="0" end="${product.size()-1}" items="${product}" var="s">
                        <tr class="TTT">
                            <td onclick="Detailed(${s.productid})" class="col-lg-1">${s.productid}</td>
                            <td onclick="Detailed(${s.productid})" class="col-lg-1 ">${s.productmodel}</td>
                            <td onclick="Detailed(${s.productid})" class="col-lg-1 ">${s.productname}</td>
                            <td onclick="Detailed(${s.productid})" class="col-lg-1 ">${s.sellingprice}</td>
                            <td onclick="Detailed(${s.productid})" class="col-lg-1 ">${s.stocks}</td>
                            <td class="col-lg-1 ">
                                <button type="button" class="btn btn-primary" onclick="addPic(${s.productid})">圖片</button>
                            </td>
                            <td class="col-lg-1 ">
                                <button type="button" class="btn btn-primary" onclick="chart(${s.productid})">圖表</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>


            <%--       分頁表--%>
            <div class="row lll">
                <div class="col-lg-5"></div>
                <nav aria-label="Page navigation example" class="col-lg-1">
                    <ul class="pagination">
                        <li class="page-item per">
                            <a class="page-link" href="${pageContext.request.contextPath}/backstage/product?pag=${param.pag==1?1:param.pag-1}&state=1" aria-label="Previous"> <span>&laquo;</span> </a>
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
    if (p == "") p = 1;

    $(document).ready(function () {
        var url = location.href;
        if (url.indexOf("pag") == -1 || url.indexOf("pag=1") != -1) {
            $(".per").remove();
        }

        // 分頁管理
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/product/data/" + p,
            type: "get",
            success: function (max) {
                for (var i = 1; i <= max; i++) {

                    $(".pagination").append('<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/backstage/product?pag=' + i + '&state=1">' + i + '</a></li>');
                }
                if (max != '${param.pag}')
                    $(".pagination").append('<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/backstage/product?pag=${param.pag==null?2:param.pag+1}&state=1"' +
                        'aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>');
            },
            error: function (pag) {
                console.log("error");
            }
        })
    })


    // 下架商品
    $(".state").click(function () {
        window.location.href = "${pageContext.request.contextPath}/backstage/product?pag=1&state=2";

    })
    //////////////////////////////////////////////////////////////////////////////////////////
    // 顯細資料
    function Detailed(id) {
        console.log("${pageContext.request.contextPath}/product/" + id);
        $(".hazy").css("visibility", "visible");
        $(".cat").css("visibility", "visible");
        $.ajax({
            url: "${pageContext.request.contextPath}/product/" + id,
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
                $(".form").attr("action", "${pageContext.request.contextPath}/backstage/updata/" + A.productid);
            },
            error: doError
        });


    }

    ///////////////////////////////////////////////////
    //圖片按鈕
    function addPic(Productid) {
        $(".pic").css("visibility", "visible");
        $(".picmain").empty();
        $(".picmain").attr("action", "${pageContext.request.contextPath}/backstage/addPic/" + Productid);
        // 去讀取有多少圖片
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/selectPic/" + Productid,
            type: "get",
            contentType: "application/json",
            dataType: "json",
            success: function (json) {
                var i = 0;
                console.log(json);
                for (var A of json) {
                    i++;
                    console.log(A.productpictureid);

                    $(".picmain").append('<div style="width: 350px;height: 340px; position: relative;" class="col-lg-6 d' + A.productpictureid + ' "><img style="width: 350px;height: 280px; " src="${pageContext.request.contextPath}/images/shop/' + A.producturl + '.jpg" id="img' + i + '" class="img-thumbnail"/>' +
                        '<input type="file" accept="image/*" id="file' + i + '" name="nofile' + i + '" onchange="upload(' + i + ');" class="fileInput col-lg-3" value=""/>' +
                        '<button type="button"  class="col-lg-4 offset-4 btn btn-primary  " onclick="delPic(`' + i + '`,' + A.productpictureid + ')">刪除</button>' +
                        '</div>');

                }
                // 新圖
                i++;
                $(".picmain").append(' <div style="width: 350px;height: 340px;" class="col-lg-6 d' + i + '">' +
                    '<img style="width: 350px;height: 280px; " src="${pageContext.request.contextPath}/images/homePic/uploadstep.png" id="img' + i + '" class="img-thumbnail"/>' +
                    '<input type="file" accept="image/*" id="file' + i + '" name="nofile' + i + '" onchange="newPic(`' + i + '`);" class="fileInput col-lg-3" value=""/>' +
                    '<button type="button"  class="col-lg-4 offset-4 btn btn-primary  " onclick="delPic(`' + Productid + '`,' + i + ')">刪除</button>' +
                    '</div>');
                $(".picmain").append('<button type="submit"  class="btn btn-primary pciSubmit">提交</button>');
                pid = Productid;
            },
            error: doError
        });
    }

    // 換圖片 .
    upload = function (i) {
        var f = document.querySelector("#file" + i);
        var d = document.querySelector("#img" + i);
        $("#file" + i).attr("name", "file" + i);
        var reader = new FileReader();
        reader.readAsDataURL(f.files[0]);
        reader.onload = function (e) {
            d.setAttribute("src", e.target.result);
        };
    };

    //新增圖片
    newPic = function (i) {
        var f = document.querySelector("#file" + i);
        var d = document.querySelector("#img" + i);
        $("#file" + i).attr("name", "file" + i);
        var reader = new FileReader();
        reader.readAsDataURL(f.files[0]);
        reader.onload = function (e) {
            d.setAttribute("src", e.target.result);
        };
        i++;
        $(".pciSubmit").remove();
        $(".picmain").append(' <div style="width: 350px;height: 340px;" class="d' + i + '">' +
            '<img style="width: 350px;height: 280px; " src="${pageContext.request.contextPath}/images/homePic/uploadstep.png" id="img' + i + '" class="img-thumbnail"/>' +
            '<input type="file" accept="image/*" id="file' + i + '" name="nofile' + i + '" onchange="newPic(`' + i + '`);" class="fileInput col-lg-3" value=""/>' +
            '<button type="button"  class="col-lg-4 offset-4 btn btn-primary  " onclick="delNewPic(' + i + ')">刪除</button>' +
            '</div>');
        $(".picmain").append('<button  type="submit" class="btn btn-primary pciSubmit">提交</button>');
    };
    //刪除圖片
    delPic = function (Productid, productpictureid) {
        var result = confirm("確定刪除？");
        if (result) {
            console.log("點了確定");
            $(".d" + productpictureid).remove();
            $.ajax({
                url: "${pageContext.request.contextPath}/backstage/delPic/" + Productid + "/" + productpictureid,
                type: "get",

                success: function (json) {
                    console.log(json);
                },
                error: doError
            });
        } else {
            console.log("點了取消");
        }
    }

    delNewPic = function (productpictureid) {
        var result = confirm("確定刪除？");
        $(".d" + productpictureid).remove();
    }

    $(document).ready(function () {
        //新增商品
        $("#addPoduct").click(function () {

            $(".hazy").css("visibility", "visible");
            $(".cat").css("visibility", "visible");
            $(".form").remove();
            $(".cat").append('<form action="${pageContext.request.contextPath}/backstage/updata/" class="form" method="post">');
            // <form action="${pageContext.request.contextPath}/backstage/updata/" class="form" method="post">
            $(".form").prepend(
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
                '<button type="submit" class="btn btn-primary ccc " id="newPoduct">新增</button>'
            );
            $(".form").attr("action", "${pageContext.request.contextPath}/backstage/updata/");

        })
        // 關閉按紐
        $('.catReturn').click(function () {
            window.location.href = "${pageContext.request.contextPath}/backstage/product?pag=1&state=1";
            // $(".hazy").css("visibility", "hidden");
            // $(".cat").css("visibility", "hidden");
            // $(".pic").css("visibility", "hidden");
        });

        //如果有錯誤

        if ('${errors}' != "" && '${errors}' != "{}") {

            $(".form").empty();
            $(".hazy").css("visibility", "visible");
            $(".cat").css("visibility", "visible");
            $(".form").prepend(
                '  <div class="form-group"><label id="productid">商品ID : </label></div>' +
                '<div class="form-group"><label for="productname">名稱</label><span class="error">${errors.productname}</span>' +
                '<input type="text" class="form-control" id="productname" placeholder="productname" name="productname" value="${productname}"></div>' +
                '<div class="form-group"><label for="productmodel">商品號</label><span class="error">${errors.productmodel}</span>' +
                '<input type="text" class="form-control" id="productmodel" placeholder="productmodel" name="productmodel" value="${productmodel}"></div>' +
                '<div class="form-group"><label for="producttext">詳細描述</label><span class="error">${errors.producttext}</span>' +
                '<input type="text" class="form-control" id="producttext" placeholder="producttext" name="producttext" value="${producttext}">' +
                '</div><div class="form-group"><label for="purchaseprice">進價</label><span class="error">${errors.purchaseprice}</span>' +
                '<input type="text" class="form-control" id="purchaseprice" placeholder="purchaseprice" name="purchaseprice" value="${purchaseprice}"></div>' +
                '<div class="form-group"><label for="sellingprice">售價</label><span class="error">${errors.sellingprice}</span>' +
                '<input type="text" class="form-control" id="sellingprice" placeholder="sellingprice" name="sellingprice" value="${sellingprice}"></div>' +
                '<div class="form-group"><label for="stocks">庫存</label><span class="error">${errors.stocks}</span>' +
                '<input type="text" class="form-control" id="stocks" placeholder="stocks" name="stocks" value="${stocks}"></div>' +
                '<div class="form-group"><label for="productspecifications">商品規格</label><span class="error">${errors.productspecifications}</span>' +
                ' <input type="text" class="form-control" id="productspecifications" placeholder="productspecifications" name="productspecifications" value="${productspecifications}"></div>' +
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
                '<button type="submit" class="btn btn-primary ccc " id="newPoduct">新增</button>'
            );

        }


    });
    //搜索按鈕
    $("#buttonaddon2").click(function () {
        console.log("#buttonaddon2" + $("#selectProduct").val());
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/selectproduct/" + $("#selectProduct").val(),
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
                    // '<td class="col-lg-1 ">' + A.purchaseprice + '</td>' +
                    '<td class="col-lg-1 ">' + A.sellingprice + '</td>' +
                    '<td class="col-lg-1 ">' + A.stocks + '</td>' +
                    // '<td class="col-lg-1 ">' + A.productspecifications + '</td>' +
                    '<td  class="col-lg-1 "><button type="button" class="btn btn-primary" onclick="addPic(' + A.productid + ')">圖片 </button> </td>' +
                    '<td  class="col-lg-1 "> <button type="button" class="btn btn-primary" onclick="chart('+A.productid+')">圖表</button></td>' +

                    '</tr>');
            }
        }

    })

    function doError(json) {
        console.log(json);
    }


    //圖表
    function chart(productId){
        $(".char").css("visibility", "visible");
        console.log(productId);
        var labels = [];
        var data = [];
        var ctx = document.getElementById('canvas').getContext('2d');
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/productLine/"+productId,
            type: "get",
            async: false,
            success: function (J) {
                labels = Object.keys(J);
                for (var i in J) {
                    data.push(J[i]);
                }
            },
            error: doError
        });


        console.log(labels);
        console.log(data);
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: '# of Votes',
                    data: data,
                    fill: true,
                    tension: 0.1,
                    // backgroundColor: [
                    //     'rgba(255, 99, 132, 1)',
                    //
                    // ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',

                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });



    }

</script>
</body>
</html>
