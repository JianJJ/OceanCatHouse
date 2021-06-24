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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/css/bootstrap.rtl.min.css">--%>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderPayment.css">

    <script src="${pageContext.request.contextPath}/js/userBack/userOrders.js"></script>
</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<%--主體--%>
<div class="contain">
    <h3>訂單管理</h3>

    <ul>
        <li class="current" id="showOrdersBtn"><a href="javascript:void(0);">訂單紀錄</a></li>
        <li id="showCardBtn"><a href="javascript:void(0);">付款方式</a></li>
    </ul>

    <div class="showOrders">
        訂單
    </div>

    <%--顯示卡片--%>
    <section class="showContain showCard">
        <div class="createNew" onclick="findCard()">
            <p>加入付款方式</p>
        </div>
    </section>


        <%--新增卡片--%>
    <div class="mask">
        <form id="editConsole">
            <h2>新增付款方式</h2>
            <div id='cardPaySection'>
                持卡人姓名:
                <input type="text" name="userCardName" size='30'><br/>
                信用卡號碼:
                <input type="text" maxlength="4" size="2" name="cardNumberP1" class="cardNumber"> -
                <input type="text" maxlength="4" size="2" name="cardNumberP2" class="cardNumber"> -
                <input type="text" maxlength="4" size="2" name="cardNumberP3" class="cardNumber"> -
                <input type="text" maxlength="4" size="2" name="cardNumberP4" class="cardNumber"><br/>
                到期日:
                <select name="hour" id="expireMonth" ></select> / <select name="hour" id="expireYear"></select><br/>

                安全驗證碼:
                <input type="text" size="2" maxlength=3 name="checkNumber" class="cardNumber">
                <input type="submit" id='btnSave' value="儲存付款方式"></input>
            </div>
        </form>
    </div>

</div>


<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
