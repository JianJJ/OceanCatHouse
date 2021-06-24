<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>✿海貓食屋✿廠商後台</title>
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

        .TTT:hover {
            background-color: #afe3d5;
        }

        .hazy {
            visibility: hidden;
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 40;

        }

        /*.cat {*/
        /*    border: blue 1px solid;*/
        /*    background-color: white;*/
        /*    width: 830px;*/
        /*    height: 850px;*/
        /*    z-index: 50;*/
        /*    position: absolute;*/
        /*    left: 0%;*/
        /*    right: 0%;*/
        /*    margin: auto;*/
        /*    top: 50px;*/
        /*    border-radius: 15px;*/
        /*    visibility: visible;*/

        /*}*/

        /*.cat p {*/
        /*    position: relative;*/
        /*    text-align: right;*/
        /*    right: 100px;*/
        /*}*/

        /*.cat form {*/
        /*    top: 10px;*/
        /*    position: relative;*/
        /*    left: 20px;*/
        /*}*/

        /*.cat input {*/
        /*    width: 95%;*/
        /*}*/

        /*.cat select {*/
        /*    width: 95%;*/
        /*}*/

        /*!* 購物車返回 *!*/
        /*.catReturn {*/
        /*    top: -10px;*/
        /*    right: -10px;*/
        /*    position: absolute;*/
        /*    background-color: red;*/
        /*    width: 40px;*/
        /*    height: 40px;*/
        /*    border-radius: 50%;*/
        /*    z-index: 20;*/
        /*}*/
        /*.pciSubmit{*/
        /*    width: 95%;*/
        /*}*/

    </style>
</head>
<body>
<%--    頁首--%>
<header class="container-fluid mainColor headtop">
    <div class="title">廠商後台</div>

    <button class="userIcon"></button>
</header>


<%--    側邊欄--%>
<div class="col-md-2 navfix mainColor">
    <ul class="list-group">
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/order?pag=1&state=1'">
            訂單管理
        </button>
        <button class="list-group-item" onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/product?pag=1'">商品管理</button>
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/user/0'">會員管理
        </button>
<%--        <label class="list-group-item">員工管理</label>--%>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>
                <div class="col-lg-3 ccc">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="會員ID" aria-label="Recipient's username"
                               aria-describedby="button-addon2" id="selectProduct">
                        <button class="btn btn-outline-secondary" type="button" id="buttonaddon2">搜索</button>
                    </div>
                </div>


            <div class="row">
                <table class="Table table-striped orderTable">
                    <tr>
                        <td>ID</td>
                        <td>姓名</td>
                        <td>電話</td>
                        <td>Email</td>
                        <td>狀態</td>
                        <td>訂單</td>
                    </tr>

                    <c:forEach varStatus="loop" begin="0" end="${user.size()-1}" items="${user}" var="s">
                        <tr class="TTT" >
                            <td>${s.userid}</td>
                            <td>${s.username}</td>
                            <td>${s.userphone}</td>
                            <td>${s.email}</td>
                            <td>${s.state == 1?"正常":"壞掉的"}</td>
                            <td  class="col-lg-1 "><button type="button" class="btn btn-primary" onclick="order('${s.userid}')">訂單 </button> </td>
                        </tr>
                    </c:forEach>


                </table>
            </div>

            <div class="row">

                <%--                底層--%>
            </div>
            <%--                分頁--%>
            <nav>
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="row">

                <%--                中間之後要放的內容--%>
            </div>
        </div>
    </div>
</div>


<%--<div class="cat">--%>
<%--    <button class="catReturn">X</button>--%>
<%--    <div class="row">--%>
<%--        <table class="table table-striped detailTable">--%>
<%--            <tr>--%>
<%--                <td>訂單編號</td>--%>
<%--                <td>商品名稱</td>--%>
<%--                <td>數量</td>--%>
<%--                <td>售價</td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <hr>--%>
<%--    <span class="address">地址</span><br>--%>
<%--    <span class="name">名稱</span>--%>
<%--    <p>小記:1000</p><br>--%>
<%--    <form action="${pageContext.request.contextPath}/backstage/state" class="form" method="post">--%>
<%--        <select class="form-select" aria-label="Default select example" id="orderStatus" name="orderStatus">--%>
<%--            <option value="1">1 新訂單</option>--%>
<%--            <option value="2">2 包裝完成</option>--%>
<%--            <option value="3">3 出貨</option>--%>
<%--        </select><br>--%>
<%--        <button type="submit" class="btn btn-primary pciSubmit ">完成</button>--%>
<%--    </form>--%>
<%--</div>--%>
<script>
    function order(userId) {
        window.location.href = "/OceanCatHouse/backstage/order?userId=" + userId;
    }
    $("#buttonaddon2").click(function () {
        console.log("#buttonaddon2" + $("#selectProduct").val());
        window.location.href = "/OceanCatHouse/backstage/user/" + $("#selectProduct").val();
    });
</script>


</body>
</html>
