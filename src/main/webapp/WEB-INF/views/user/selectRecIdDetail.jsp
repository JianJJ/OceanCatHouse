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

    <script src="${pageContext.request.contextPath}/js/createRecipe/selectRecIdDetail.js"></script>
    <script>
        $(document).ready(function (){
            $('#RecNum').val('${main.recNum}');
            $('#RecTime').val('${main.recTime}');
        })
    </script>
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

        #img-main, .img-step {
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
        i{
            font-size: 1.3rem;
        }
        .iBtn{
            border-width: 0px;
            background-color: white;
        }
    </style>

</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

<!--主體-->
<div class="container Cbody">
    <div class="row justify-content-around">
        <div class="col-md-7 Lbody" id="divStart">
            <div class="row">
<%--                食譜Id--%>
                <input type="text" id="recid" value="${main.recId}" hidden>
                <%--                食譜分類 RecCategory--%>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="分類" style="font-size: 2rem"
                           id="CategoryId" name="CategoryId" value="${main.categoryId}" hidden>
                </div>
                <%--                食譜名稱 RecTitle--%>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="食譜名稱" style="font-size: 1.5rem"
                           id="RecTitle" value="${main.recTitle}">
                </div>
            </div>
            <%--                上傳檔案+顯示圖片 RecPic--%>
            <div class="row">
                <div class="picmain">
                    <div style="width: 350px;height: 280px; margin:0 auto;">
                        <img src="${pageContext.request.contextPath}/images/mainpic/${main.recPic!=null?main.recPic:"uploadpic.png"}" id="img-main"
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
                    <textarea class="form-control" id="RecText" rows="3">${main.recText}</textarea>
                </div>
            </div>
            <%--                標籤 RecTag --%>
            <div class="row">
                <div class="form-group">
                    <label for="RecTag">設定關鍵字標籤</label>
                    <textarea class="form-control" id="RecTag" rows="3" placeholder="雞蛋、玉米、海苔...">${main.recTag}</textarea>
                </div>
            </div>
            <%--                熱量 RecCal--%>
            <div class="row justify-content-start">
                <label for="RecCal">熱量</label>
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="800" required oninput="value=value.replace(/[^\d]/g,'')"
                               id="RecCal" value="${main.recCal}">
                    </div>
                </div>
                <div class="col-md-6">大卡（千卡，kcal）</div>
            </div>
            <div class="row justify-content-between">
                <%--                 份量 RecNum--%>
                <div class="form-group col-md-6">
                    <label for="RecNum">份量<span>(人份)</span></label>
                    <select class="form-control" id="RecNum" name="">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10+</option>
                    </select>
                </div>
                <%--                 分鐘數 RecTime  --%>
                <div class="form-group col-md-6">
                    <label for="RecTime">烹調時間<span>(分鐘)</span></label>
                    <select class="form-control" id="RecTime">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="45">45</option>
                        <option value="60">60</option>
                        <option value="90">90</option>
                        <option value="120">120</option>
                        <option value="180+">180+</option>
                    </select>
                </div>
            </div>
            <%--            食材--%>
            <div class="row" style="margin-bottom: 0px" id="foodStart">
                <label>食材<span>食材15字以內，份量10字以內</span></label><br/>
            </div>
            <%--            食材新增位置--%>
            <c:forEach items="${materialList}" var="material" varStatus="status">
                <div class="row justify-content-between MName" style="margin-top: 2px" id="food${status.count}">
                    <div class="col-md-7">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="食材"
                                   name="MaterialName" value="${material.materialName}" id="MaterialName${status.count}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="份量"
                                   name="UnitNum" value="${material.unitNum}" id="UnitNum${status.count}">
                        </div>
                    </div>
                    <div class="col-md-1">
                        <button type="button" class="iBtn" onclick="delFood('food${status.count}')" id="DFBtn${status.count}">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </div>
            </c:forEach>
                <div class="row justify-content-between" style="margin-top: 0px" id="addMaterial">
                    <button type="button" onclick="createFood()" class="btn btn-outline-info" style=" width: 100%">加入食材</button>
                </div>

            <%--            步驟--%>
            <div class="row" style="margin-bottom: 0px" id="stepStart" >
                <label>步驟</label><br/>
            </div>
            <c:forEach items="${stepList}" var="step" varStatus="status">
                <div class="row stepCol" id="divId${status.count}">
                    <div class="col-md-5">
                        <div class="picstep checkPic">
                            <div style="width: 280px;height: 210px; margin:0 auto;">
                                <input hidden type="text" id="SPicName${status.count}"  value="${step.stepPic}">
                                <img src="${pageContext.request.contextPath}/images/stepPic/${step.stepPic!=null?step.stepPic:"uploadstep.png"}"
                                     class="img-thumbnail img-step"
                                     id="img-step${status.count}"/>
                                <input type="file" accept="image/*" id="file-step${status.count}" name="file"
                                       onchange="upload('#file-step${status.count}', '#img-step${status.count}');" class="fileInput fileStep"
                                       value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="row justify-content-between" style="margin: 0px">
                            <div class="col-md-1"><span style="font-size: 32px" id="step${status.count}">${status.count}</span></div>
                            <div class="col-md-8"></div>
                            <div class="col-md-1">
                                <button type="button" onclick="createStep()" class="iBtn">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                            </div>
                            <div class="col-md-1">
                                <button type="button" class="iBtn" onclick="delStep('divId${status.count}')" id="delbtn${status.count}">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                        </div>
                        <div class="row" style="margin: 0px">
                            <div class="form-group col-md-12">
                            <textarea class="form-control" id="stepText${status.count}" rows="6"
                                      placeholder="請輸入步驟說明(最多 150 字)">${step.stepText}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <%--            增刪修--%>
        <div class="col-md-1">
            <div class="row justify-content-start">
                <button id="insert" onclick="doUpload()" type="button" class="btn btn-outline-danger">發布</button>
            </div>
            <div class="row justify-content-start">
                <button type="button" class="btn btn-outline-danger" onclick="goBack()">取消</button>
            </div>
            <div class="row justify-content-start">
                <button id="delete" onclick="deleteRec()" type="button" class="btn btn-outline-danger">下架</button>
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
