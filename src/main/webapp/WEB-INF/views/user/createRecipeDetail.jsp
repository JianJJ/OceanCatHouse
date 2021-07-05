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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createRecipeDetail.css">
    <script src="${pageContext.request.contextPath}/js/createRecipe/createRecipeDetail.js"></script>

</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

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
                    <input type="text" class="form-control" placeholder="食譜名稱" style="font-size: 1.5rem" required
                           id="RecTitle" value="${RecTitle}">
                </div>
            </div>
            <%--                上傳檔案+顯示圖片 RecPic--%>
            <div class="row">
                <div class="picmain">
                    <div style="width: 350px;height: 280px; margin:0 auto;">
                        <img src="${pageContext.request.contextPath}/images/mainpic/uploadpic.png" id="img-main"
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
                <button type="button" id="autologin" style="width: 4px ;height: 3px"></button>
            </div>
            <%--                標籤 RecTag --%>
            <div class="row">
                <div class="form-group">
                    <label for="RecTag">設定關鍵字標籤</label>
                    <textarea class="form-control" id="RecTag" rows="3" placeholder="雞蛋、玉米、海苔..."></textarea>
                </div>
            </div>
            <%--                熱量 RecCal--%>
            <div class="row justify-content-start">
                <label for="RecCal">熱量</label>
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control"  placeholder="800" required oninput="value=value.replace(/[^\d]/g,'')"
                               id="RecCal">
                    </div>
                </div>
                <div class="col-md-6">大卡（千卡，kcal）</div>
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
                        <option value="4">4</option>
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
                        <option value="20">20</option>
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
            <div class="row" style="margin-bottom: 0px" id="foodStart">
                <label>食材<span>食材15字以內，份量10字以內</span></label><br/>
            </div>
                <%--            食材新增位置--%>
            <div class="row justify-content-between" style="margin-top: 0px">
                <button type="button" onclick="createFood()" class="btn btn-outline-info" style=" width: 100%">加入食材</button>
            </div>
            <%--            步驟--%>
            <div class="row" style="margin-bottom: 0px" id="stepStart" >
                <label>步驟</label><br/>
            </div>

<%--                這裡用jQuery 載入步驟、步驟圖片--%>

        </div>
        <%--            增刪修--%>
        <div class="col-md-1">
            <div class="row justify-content-start">
                <button id="insert" onclick="doUpload()" type="button" class="btn btn-outline-danger">發布</button>
            </div>
            <div class="row justify-content-start">
                <button type="button" class="btn btn-outline-danger" onclick="goBack()">取消</button>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>

</div>
<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
