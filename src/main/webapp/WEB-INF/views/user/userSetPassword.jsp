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
    <script src="${pageContext.request.contextPath}/js/userBack/userSetPassword.js"></script>
</head>
<body>
<%--頁首--%>
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>

<div class="container">
    <div class='row justify-content-around'>
        <section class="col-xs-3 col-md-3" id='settingList'>
            <dl>
                <dt>帳號管理</dt>
                <dd><a href="${pageContext.request.contextPath}/userBack/userSetting">基本資料</a></dd>
                <dd class="current"><a href="${pageContext.request.contextPath}/userBack/userSetPassword">密碼修改</a></dd>
                <dd><a href="${pageContext.request.contextPath}/userBack/home">返回個人首頁</a></dd>
            </dl>
        </section>

        <section class="col-xs-7 col-md-7" id='settingInfoBlock'>

            <h3>密碼修改</h3>
            <hr>
            <form action="#" method="" class="form-floating">
            	 <h6>舊密碼</h6>
            	 <div class="form-floating mb-3">
                      <input type="password" class="form-control" id='pwdNow' name='pwdNow' maxlength="12">
                      <label for="pwdNow">目前在用的密碼</label>
                 </div>
                 <h6>新密碼</h6>
                 <div class="form-floating mb-3">
                      <input type="password" class="form-control" id='pwdNew' name='pwdNew' maxlength="12">
                      <label for="pwdNew">點此輸入新密碼</label>
                 </div>
                 <h6>二次輸入新密碼</h6>
                 <div class="form-floating mb-3">
                      <input type="password" class="form-control" id='pwdNewAgian' name='pwdNewAgian' maxlength="12">
                      <label for="pwdNewAgian">點此再次輸入新密碼</label>
                 </div>

                <p hidden="hidden" style="color: red" id="Msg0">欄位不能空白</p>
                <p hidden="hidden" style="color: red" id="notMsg">原始密碼不正確</p>
                <p hidden="hidden" style="color: red" id="secMsg">二次密碼不正確</p>
                <input type="button" value="儲存新密碼" onclick="changePassword()">
            </form>
        </section>

    </div>
</div>

<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
