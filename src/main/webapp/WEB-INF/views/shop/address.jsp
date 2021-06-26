<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <%-- bootstrap的CSS、JS樣式放這裡 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">

    <%-- jQuery放這裡 --%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav_forShop.css">

    <%-- GOOGLE API 放這裡    --%>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>

    <%-- footer的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">

    <%-- 主要的CSS、JS放在這裡--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/address.css">
    <script src="${pageContext.request.contextPath}/js/shop/address.js"></script>


    <title>✿海貓食屋✿</title>
</head>

<body>
<!-- 拼接header -->
<jsp:include page="../RecipePages/top_nav_forShop.jsp"></jsp:include>

<%--<jsp:include page="../user/inculeLogin.jsp"></jsp:include>--%>
<%--<div class="hazy"></div>--%>

<div class="container BBB cartMain">
    <h3 class="row col-lg-3 justify-content-center">購物清單</h3>

    <div class="row AAA justify-content-center col-lg-11 ">
        <div class="col-lg-12 justify-content-center row cat">
            <ul class='col-lg-12 d-none d-lg-inline-block justify-content-around  row'>
                <li class='col-lg-4'>訂單商品</li>
                <li class='col-lg-3'>商品規格</li>
                <li class='col-lg-3'>數量</li>
                <li class='col-lg-1'>總價</li>
            </ul>

        </div>
        <h6 class='PPP'></h6>
    </div>


    <div class="row justify-content-between col-lg-11 mainCenter">

        <div class='col-lg-4 order-sm-1 order-lg-2 col-md-12 row allTotal'>
            <h3>付款詳情</h3>
            <p class="PPP">總價:100000000</p>
            <p>運費 :$ 60</p>
            <hr>
            <p class="SSS">合計:100000060</p>

        </div>

        <div class="col-lg-8 col-md-12 order-sm-2 order-lg-1 address">
            <form>
                <h3>收件人資料</h3>

                <input type="text" name="userName" placeholder="姓名" size="50"
                       value="${sessionScope.user.username}"><br/>
                <input type="tel" name="userPhone" placeholder="手機號碼" size="50"
                       value="${sessionScope.user.userphone}"><br/>
                <input type="email" name="userEmail" placeholder="Email" size="50"
                       value="${sessionScope.user.email}"><br/>
                <input type="text" name="address" placeholder="收件地址" size="50"
                       value="${sessionScope.user.deliveryAddress}"><br/>


                <h3 style="margin-top:50px;">付款方式</h3>
<%--                1. 貨到付款--%>
                <input type="radio" name="payMethod" id='pay1' value='byCash'>
                <label for='pay1'>貨到付款</label><br/>

                <%--        2. 如果上次使用信用卡付款, 顯示上次的卡片--%>
                <input type="radio" name="payMethod" id='pay2' value='byCreditCard'>
                <label for='pay2'>使用最近一次結帳的卡片</label><br/>
                <div class="contain">
                    <div class="created used">
                        <img src="${pageContext.request.contextPath}/images/homePic/VISA.jpg">
                        <h5>Visa <span>****</span> <span id='cardLastFour'>2363</span></h5>
                        <p>過期時間 <span id='expiredDate'>09/2026</span></p>
                    </div>
                </div>
<%--               3. 輸入其他卡片, 並新增卡片--%>
                <input type="radio" name="payMethod" id='pay3' value='byCreditCard'>
                <label for='pay3'>使用並儲存新的卡片</label><br/>
                <div id='cardPaySection' style="margin-left:45px">
                    持卡人姓名:
                    <input type="text" name="userCardName"><br/>
                    信用卡號碼:
                    <input type="text" maxlength="4" size="2" name="cardNumberP1" class="cardNumber"> -
                    <input type="text" maxlength="4" size="2" name="cardNumberP2" class="cardNumber"> -
                    <input type="text" maxlength="4" size="2" name="cardNumberP3" class="cardNumber"> -
                    <input type="text" maxlength="4" size="2" name="cardNumberP4" class="cardNumber"><br/>
                    到期日:
                    <select name="hour" id="expireMonth"></select> / <select name="hour" id="expireYear"></select><br/>

                    安全驗證碼:
                    <input type="text" size="2" maxlength=3 name="checkNumber" class="cardNumber">
                </div>

                <div class="g-recaptcha"
                     data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                     data-callback='verifyCallback' data-action='ubmit'>Submit
                </div>

                <button class="btn btn-primary sbtn" id="insertOrder">送出訂單</button>
                <span class="err">${errors.address} </span><span class="err">${errors.recaptcha}</span>
            </form>
        </div>

    </div>

</div>
<%--拼接footer--%>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
