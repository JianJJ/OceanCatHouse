<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        .cat {
            border: blue 1px solid;
            background-color: white;
            width: 830px;
            height: 850px;
            z-index: 50;
            position: absolute;
            left: 0%;
            right: 0%;
            margin: auto;
            top: 50px;
            border-radius: 15px;
            visibility: hidden;

        }

        .cat p {
            position: relative;
            text-align: right;
            right: 100px;
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

        .pciSubmit {
            width: 95%;
        }
        .accordion-item{
            text-align: center;
            background-color: #62A5A1;
            color: #0c4128;
        }
        .AAA{
            padding-left: 38%;
            text-align: center;
            background-color: #62A5A1;
            color: white;
        }
        .accordion-button {
            text-align: center;
        }

        .accordion-button:focus{
            text-align: center;
            background-color: #62A5A1;
            color:white;
        }
        .accordion-button:not(.collapsed) {
            text-align: center;
            background-color: #62A5A1;
            color:white;
        }
        .list-group-item {
            background-color: transparent;
            color: white;
        }
    </style>
</head>
<body>
<div class="hazy"></div>
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
                        <a href="#" class="btn btn-primary active" aria-current="page" id="addStaff">新增員工</a>
                    </div>
                </div>
            <div class="row">
                <div>
                    <table class="table table-striped">
                        <tr>
                            <td>ID</td>
                            <td>帳號</td>
                            <td>名子</td>
                            <td>電話</td>
                            <td>職位</td>
                            <td>狀態</td>
                        </tr>
                        <c:forEach varStatus="loop" begin="0" end="${staff.size()-1}" items="${staff}" var="s">
                            <tr class="TTT" onclick="detail(${s.id})">
                                <td>${s.id}</td>
                                <td>${s.email}</td>
                                <td>${s.name}</td>
                                <td>${s.phone}</td>
                                <td>${s.position}</td>
                                <td>${s.state}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>


                <%--                中間之後要放的內容--%>
            </div>
        </div>
    </div>
</div>
<%--// 細節--%>

<div class="cat">
    <button class="catReturn">X</button>
    <div class="row">
        <form action="${pageContext.request.contextPath}/backstage/changStaff" class="form" method="post">
            <div class="form-group"><label for="name">名稱</label>
                <input type="text" class="form-control" id="name" value="'+A.name+'" name="name"></div>
            <div class="form-group"><label for="email">Emaill</label>
                <input type="text" class="form-control" id="email" value="'+A.email+'" name="email"></div>
            <div class="form-group"><label for="password">密碼</label>
                <input type="text" class="form-control" id="password" value="'+A.password+'" name="password"></div>
            <div class="form-group"><label for="position">職位</label>
                <input type="text" class="form-control" id="position" value="'+A.position+'" name="position"></div>
            <div class="form-group"><label for="phone">電話</label>
                <input type="text" class="form-control" id="phone" value="'+A.phone+'" name="phone"></div>
            <div class="form-group"><label for="address">地址</label>
                <input type="text" class="form-control" id="address" value="'+A.address+'" name="address"></div>
            <hr>

            <select class="form-select" aria-label="Default select example" id="state" name="state">
                <option value="在職">1 在職</option>
                <option value="離職">2 離職</option>
            </select><br>
            <button type="submit" class="btn btn-primary pciSubmit ">完成</button>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        // 關閉按紐
        $('.catReturn').click(function () {
            $(".hazy").css("visibility", "hidden");
            $(".cat").css("visibility", "hidden");

        });
        //新增會員
        $("#addStaff").click(function (){
            $(".hazy").css("visibility", "visible");
            $(".cat").css("visibility", "visible");
            $("#name").val(null);
            $("#email").val(null);
            $("#password").val(null);
            $("#position").val(null);
            $("#phone").val(null);
            $("#address").val(null);
            $("form").attr("action","${pageContext.request.contextPath}/backstage/addStaff/");
        })

    });
    function detail(staffId) {
        console.log(staffId);
        $(".hazy").css("visibility", "visible");
        $(".cat").css("visibility", "visible");
        console.log("${pageContext.request.contextPath}/staffDetail/" +staffId);
        $.ajax({
            url: "${pageContext.request.contextPath}/backstage/staffDetail/" +staffId,
            type: "get",
            contentType: "application/json",
            dataType: "json",
            success: function (A) {

                $("#name").val(A.name);
                $("#email").val(A.email);
                $("#password").val(A.password);
                $("#position").val(A.position);
                $("#phone").val(A.phone);
                $("#address").val(A.address);
                $("#state").val(A.state);
                $("form").attr("action","${pageContext.request.contextPath}/backstage/changStaff/"+A.id);
            },
            error: doError
        });
    }
    function doError(json) {
        console.log(json);
    }
</script>



</body>
</html>
