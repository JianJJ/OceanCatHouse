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
  
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.rtl.min.css">--%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <!--    JavaScript; choose one of the two!-->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/jquery-3.6.0.js"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-icons-1.5.0/bootstrap-icons.css">
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">
    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userProfile.css">
</head>
<script>
    $(document).ready(function (){
        // 查看信箱是否驗證
        var state = '${sessionScope.user.state}';
        if(state == '0'){
            $('#emailMsg').prop('hidden', false);
            $('#floatingInputEmail').addClass('is-invalid');
        } else {
            $('#emailMsg').prop('hidden', true);
            $('#floatingInputEmail').removeClass('is-invalid');
        }
        // 抓取要更新的資料
        var name = '${sessionScope.user.username}';
        var phone = '${sessionScope.user.userphone}';
        var email = '${sessionScope.user.email}';
        var ad = '${sessionScope.user.deliveryAddress}';
        changeNPE = function (){
            var newName = $('#floatingInput').val();
            var newPhone = $('#floatingTel').val();
            var newEmail = $('#floatingInputEmail').val();
            var newAd = $('#floatingInputAd').val();
            if(name != newName || phone != newPhone || email != newEmail || ad != newAd){
                $.ajax({
                    url : "/OceanCatHouse/userBack/changeNPE/"+newName+"/"+newPhone+"/"+newEmail+"/"+newAd,
                    type : 'PUT',
                    data : "",
                    async : false,
                    cache: false,  //不做快取
                    success : function (ok){
                        alert(ok);
                    },
                    error : function (returndata){
                        console.log("變更失敗");
                    }
                })
                if(email != newEmail){
                    $('#emailMsg').prop('hidden', false);
                }
            }else{
                alert("儲存成功");
            }
        }
    })
</script>
<body>
<%--頁首--%>
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

<%--主體--%>
<div class="container">
    <div class='row justify-content-around'>
        <section class="col-xs-3 col-md-3" id='settingList'>
            <dl>
                <dt>帳號管理</dt>
                <dd class="current"><a href="${pageContext.request.contextPath}/userBack/userSetting">基本資料</a></dd>
                <dd><a href="${pageContext.request.contextPath}/userBack/userSetPassword">密碼修改</a></dd>
                <dd><a href="${pageContext.request.contextPath}/userBack/home">返回個人首頁</a></dd>
            </dl>
        </section>

        <section class="col-xs-7 col-md-7" id='settingInfoBlock'>

            <h3>個人資料</h3>
            <hr>
            <form>
                  <h5>＊基本資料</h5>
                  
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Brad" name='userName' value="${sessionScope.user.username}">
                    <label for="floatingInput">姓名</label>
                  </div>
                  
                   <h5>＊聯絡資料</h5>
                 
                    <div class="form-floating mb-3">
                      <input type="tel" class="form-control" id="floatingTel" pattern="[0-9]{10}" placeholder="手機號碼" name="userPhone" value="${sessionScope.user.userphone}">
                      <label for="floatingInput">手機號碼</label>
                    </div>
                    <div class="form-floating mb-3">
                      <input type="email" class="form-control  is-invalid" id="floatingInputEmail" placeholder="name@example.com" name="userEmail" value="${sessionScope.user.email}">
                      <label for="floatingInputEmail">Email</label>
                      <span id="emailMsg" hidden style="color: red">Email驗證尚未通過</span>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="tel" class="form-control" id="floatingInputAd" placeholder="送貨地址" name="userAddress" value="${sessionScope.user.deliveryAddress}">
                        <label for="floatingInputAd">送貨地址</label>
                    </div>
                   	<input type="button" value="儲存更新" onclick="changeNPE()">
                </form>

            </form>
        </section>

    </div>
</div>

<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>

</html>
