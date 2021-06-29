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
<%--    訂單--%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orders.css">
<%--信用卡--%>
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
        <section>
            <table id="Otable">
                <tr>
                    <th>商品</th>
                    <th>時間</th>
                    <th>總計</th>
                    <th>付款方式</th>
                    <th>訂單狀態</th>
                </tr>
            </table>
        </section>
    </div>

    <%--顯示卡片--%>
    <section class="showContain showCard">
        <div class="createNew">
            <p>加入付款方式</p>
        </div>
    </section>

        <%--新增卡片--%>
    <div class="mask">
        <form id="editConsole">
            <h2>新增付款方式</h2>
            <div id='cardPaySection'>
                <input type="text" id="checkCardId" hidden>
                持卡人姓名:
                <input type="text" id="userCardName" name="CardName" size='30' required><br/>
                信用卡號碼:
                <input type="text" maxlength="4" size="2" id="cardNumberP1" name="CardNumberP1" class="cardNumber" pattern="\d{4}" required> -
                <input type="text" maxlength="4" size="2" id="cardNumberP2" name="CardNumberP2" class="cardNumber" pattern="\d{4}" required> -
                <input type="text" maxlength="4" size="2" id="cardNumberP3" name="CardNumberP3" class="cardNumber" pattern="\d{4}" required> -
                <input type="text" maxlength="4" size="2" id="cardNumberP4" name="CardNumberP4" class="cardNumber" pattern="\d{4}" required><br/>
                到期日:
                <select name="ExpireMonth" id="expireMonth" required></select> / <select name="ExpireYear" id="expireYear" required></select><br/>

                安全驗證碼:
                <input type="text" size="2" maxlength=3 id="checkNumber" name="VerificationCode" class="cardNumber" pattern="\d{3}" required>
                <button type="button" id="autologin" style="width: 5px ;height: 3px"></button>
                <input type="button" id='btnSave' value="儲存付款方式"/><br/>
            </div>
        </form>
    </div>

</div>


<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
