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
        <button class="list-group-item" onclick="javascript:location.href='../backstage/product?pag=1'">商品管理</button>
        <button class="list-group-item"
                onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/user'">會員管理
        </button>
        <label class="list-group-item">員工管理</label>
    </ul>
</div>
<%--    中間主體--%>
<div class="container-fluid">
    <div class="row justify-content-end">
        <div class="col-md-10">
            <%--            抬頭--%>

            <div class="row">
                <table class="Table table-striped orderTable">
                    <tr>
                        <td>ID</td>
                        <td>姓名</td>
                        <td>電話</td>
                        <td>狀態</td>
                        <td>訂單</td>
                    </tr>

                    <c:forEach varStatus="loop" begin="0" end="${user.size()-1}" items="${user}" var="s">
                        <tr class="TTT" onclick="order('${s.userid}')">
                            <td>${s.userid}</td>
                            <td>${s.username}</td>
                            <td>${s.userphone}</td>
                            <td>${s.state == 1?"正常":"壞掉的"}</td>
                            <td>訂單</td>
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

<script>
    function order(userId) {
        console.log("userID :" + userId);
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/userOrder/"+userId,
            type: "post",
            async: false,
            success: doSuccess,
            error: doError
        });

        //取得列表
        function doSuccess(json) {
        }

        function doError(json) {
            console.log("error ajax : " + json);
        }


    }

</script>


</body>
</html>
