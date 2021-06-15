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
    <script src="${pageContext.request.contextPath}/js/createRecipe/createRecipeDetail.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePage.css">

    <style>
        body {
            background-color: #EFECE8;
        }

        .fileInput {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            opacity: 0;
            display: block;
            width: 100%;
            clear: both;
        }

        .inner {
            border: 1px solid #bcbebf;
            padding: 15px;
        }

        .picmain, .picstep {
            position: relative;
            background-color: #EFECE8;
            text-align: center;
        }

        #img-main {
            width: 100%;
            height: 100%;
        }

        .row {
            margin: 30px 0px;
        }

        .Lbody {
            background-color: #ffffff;
            padding: 20px;
        }
    </style>
</head>
<body>
<!--頁首-->
<header class="container-fluid mainColor">
    <div class="title">✿海貓食屋✿</div>
    <div class="littleNav">
        <ul>
            <li><a href="#" class="top">RECIPES</a></li>
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

<!--主體-->
<div class="container Cbody">
    <div class="row justify-content-around">
        <div class="col-md-7 Lbody" id="divStart">
            <div class="row">
            <%--                食譜分類 RecCategory--%>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="分類" style="font-size: 2rem"
                           id="CategoryId" name="CategoryId" value="${CategoryId}" hidden>
                </div>
            <%--                食譜名稱 RecTitle--%>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="食材" style="font-size: 1.5rem"
                           id="RecTitle" value="${RecTitle}">
                </div>
            </div>
            <%--                上傳檔案+顯示圖片 RecPic--%>
            <div class="row">
                <div class="picmain">
                    <div style="width: 350px;height: 280px; margin:0 auto;">
                        <img src="${pageContext.request.contextPath}/images/uploadpic.png" id="img-main"
                             class="img-thumbnail"/>
                        <input type="file" accept="image/*" id="file-main" name="file"
                               onchange="upload('#file-main', '#img-main');" class="fileInput" value=""/>
                    </div>
                </div>
            </div>
            <%--                簡介 RecText --%>
            <div class="row">
                <div class="form-group">
                    <label for="RecText">請輸入食譜簡介</label>
                    <textarea class="form-control" id="RecText" rows="3"></textarea>
                </div>
            </div>
            <%--                    --%>
            <div class="row justify-content-between">
                <%--                 份量 RecNum--%>
                <div class="form-group col-md-6">
                    <label for="RecNum">份量<span>(人份)</span></label>
                    <select class="form-control" id="RecNum">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10+</option>
                    </select>
                </div>
                <%--                 分鐘數 RecTime  --%>
                <div class="form-group col-md-6">
                    <label for="RecTime">烹調時間<span>(分鐘)</span></label>
                    <select class="form-control" id="RecTime">
                        <option>5</option>
                        <option>10</option>
                        <option>15</option>
                        <option>20</option>
                        <option>30</option>
                        <option>45</option>
                        <option>60</option>
                        <option>90</option>
                        <option>120</option>
                        <option>180+</option>
                    </select>
                </div>
            </div>
            <%--            食材--%>
            <div class="row" style="margin-bottom: 0px" id="frodStart">
                <label>食材<span>食材15字以內，份量10字以內</span></label><br/>
            </div>
                <%--            食材新增位置--%>
            <div class="row justify-content-between" style="margin-top: 0px">
                <button type="button" onclick="createFrod()" class="btn btn-outline-info" style=" width: 100%">加入食材</button>
            </div>
            <%--            步驟--%>
            <div class="row" style="margin-bottom: 0px" id="stepStart" >
                <label>步驟</label><br/>
            </div>

<%--                這裡用jQuery 載入步驟、步驟圖片--%>

        </div>
        <%--            增刪修--%>
        <div class="col-md-1 sticky-top">
            <div class="row justify-content-start">
                <button id="insert" onclick="doUpload()" type="button" class="btn btn-outline-danger">發布</button>
            </div>
            <div class="row justify-content-start">
                <button type="button" class="btn btn-outline-danger">儲存</button>
            </div>
            <div class="row justify-content-start">
                <button type="button" class="btn btn-outline-danger">取消</button>
            </div>
            <div class="row justify-content-start">
                <button type="button" class="btn btn-outline-danger">刪除</button>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>

</div>
<!--頁尾-->
<footer class="container-fluid mainColor">
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
</body>
</html>
