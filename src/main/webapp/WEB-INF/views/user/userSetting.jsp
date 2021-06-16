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
        }
        // 抓取要更新的資料
        var name = '${sessionScope.user.username}';
        var phone = '${sessionScope.user.userphone}';
        var email = '${sessionScope.user.email}';
        changeNPE = function (){
            var newName = $('#username').val();
            var newPhone = $('#userPhone').val();
            var newEmail = $('#userEmail').val();
            if(name != newName || phone != newPhone || email != newEmail){
                $.ajax({
                    url : "/recipe/userBack/changeNPE/"+newName+"/"+newPhone+"/"+newEmail,
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
                <dd><a href="${pageContext.request.contextPath}/userBack/userSetting">基本資料</a></dd>
                <dd class="current"><a href="${pageContext.request.contextPath}/userBack/userSetPassword">密碼修改</a></dd>
                <dd class="current"><a href="${pageContext.request.contextPath}/userBack/home">返回個人首頁</a></dd>
            </dl>
        </section>

        <section class="col-xs-7 col-md-7" id='settingInfoBlock'>

            <h3>個人資料</h3>
            <hr>
            <p>你的個人資料只用於海貓食屋相關事宜，例如：海貓食屋活動中獎的獎品寄送使用。</p>
            <form action="#">
                <label for="username"><h5>＊基本資料</h5></label><br/>

                <span>姓名：</span><input type="text" placeholder="姓名" id='username' name='userName' value="${sessionScope.user.username}"><br/>
                <label for="userPhone"><h5>＊聯絡資料</h5></label><br/>
                <span>手機：</span><input type="tel" name="userPhone" id="userPhone" pattern="[0-9]{10}" placeholder="手機號碼" value="${sessionScope.user.userphone}"><br/>
                <span>信箱：</span><input type="email" name="userEmail" id="userEmail" placeholder="E-mail" value="${sessionScope.user.email}">
                <span id="emailMsg" hidden style="color: red">Email驗證尚未通過</span>
                <br><br>
                <input type="button" value="儲存更新" onclick="changeNPE()">
            </form>
        </section>

    </div>
</div>

<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
