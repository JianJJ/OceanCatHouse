<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>✿海貓食屋✿</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.min.css">
    <!--    JavaScript; choose one of the two!-->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/jquery-3.6.0.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">
    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userFavoriteRec.css">
    <script src="${pageContext.request.contextPath}/js/userBack/favorites.js"></script>
    <style>
        /*  彈跳視窗*/
        #jump{
            border: 2px solid #9ff5eb;
            margin-top: 7%;
            border-radius: 10%;
            width: 550px;
            height: 650px;
            text-align: center;
            background-color: white;
            overflow-y: auto;
        }
        #jump>div{
            margin: 10px;
            padding: 10px;
        }
        #add{
            font-weight: bolder;
            margin-bottom:3px ;
        }
        #add>input{
            border: 0px;
        }
        #jump>button{
            border: 0px;
        }
        #add>button{
            border: 0px;
        }
        i{
            font-size: 1.3rem;
        }

    </style>

</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

<%--    彈跳式 修改分類 --%>
<div class="row justify-content-center fixed-top" hidden id="jumpDiv">
    <div id="jump" class="col-md-4" style="position: relative">
        <div class="input-group mb-3" id="add">
            <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2"
                   placeholder="新增類別" required>
            <button class="btn btn-outline-secondary" type="button" onclick="addRow(this)">
                <i class="bi bi-plus-lg"></i>
            </button>
        </div>

        <hr/>
        <div id="liDiv">
<%--放類別的地方--%>
        </div>
        <div>
            <button class="btn btn-outline-secondary" onclick="updateOk()">保存</button>
            <button class="btn btn-outline-secondary" onclick="cancel()">取消</button>
        </div>
    </div>
</div>
<%--主體--%>
<div class="container">
    <div class='row justify-content-start'>
<%--        標籤欄--%>
        <section class="col-xs-12 col-lg-3" id='recCategoryList'>
            <h3>食譜收藏</h3>
            <hr>
            <div>
                <h6>收藏分類</h6>
                <button id="btnNewCategory" onclick="addCategory()"><span>+</span>新增分類</button>
                <button id="updateBtn" onclick="updateC()">編輯分類</button>
            </div>
            <ul id="FCategory">
                <li class="current" onclick="selectCategory()"><a>全部</a></li>
                <c:forEach items="${UFCBList}" var="UFCB">
                    <li onclick="selectCategory('${UFCB.favoriteCategoryName}')" id="${UFCB.favoriteCategoryName}"><a>${UFCB.favoriteCategoryName}</a></li>
                </c:forEach>
            </ul>
        </section>

        <%--有收藏, 顯示收藏食譜--%>
        <section class="col-xs-12 col-lg-8 recResult offset-lg-4">
            <ul class="row justify-content-start" id="showMain">
                <%--                顯示全部收藏的食譜--%>
                <h1>親愛的${sessionScope.user.username}，您目前收藏有<span id="countMain">${mainBeanList.size()!=0?mainBeanList.size():0}</span>篇食譜</h1>
                <c:forEach items="${mainBeanList}" var="main">
                    <li class="col-lg-3 col-xs-6 recipe"><a
                            href="${pageContext.request.contextPath}/recipeDetails?id=${main.recId}">
                        <img src="${main.recPic}" alt="${main.recTitle}">
                        <h4 class='showLines'>"${main.recTitle}"</h4>
                        <p class='showLines'>${main.recText}</p>
                    </a></li>
                </c:forEach>
            </ul>
            <%-- 分頁按鈕 --%>
        </section>
        <%-- 沒有收藏的畫面--%>
        <c:choose>
            <c:when test="${mainBeanList.size() != 0}">
                <section class="col-xs-12 col-lg-7" id='recFavoriteList'/>
            </c:when>
            <c:otherwise>
                <section class="col-xs-12 col-lg-7" id='recFavoriteList' hidden/>
            </c:otherwise>
        </c:choose>
            <h4>未分類</h4>
            <p><span id='favoriteRecs'> 0 </span>道食譜</p>
            <div class='recBlock row'>
                <img class="col-xs-5 col-md-5"
                     src="${pageContext.request.contextPath}/images/homePic/recipe-save-empty.png">
                <div class="col-xs-7 col-md-7">
                    <h6>此收藏分類目前是空的</h6>
                    <p> 這個分類目前沒有收藏哦， 快收藏喜歡的食譜， 以後就不怕找不到囉！</p>

                    <a href="#">快去看看人氣食譜吧</a>
                </div>
            </div>
        </section>

    </div>
    <!-- 遮罩層 -->
    <div id="cover" style="background: #000; position: absolute; left: 0px; top: 0px; width: 100%; filter: alpha(opacity=30); opacity: 0.3; display: none; z-index: 2 ">
    </div>
</div>
<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
