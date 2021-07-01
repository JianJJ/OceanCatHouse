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
            <input type="radio" name="payMethod" id='pay2' value="${lastUccb.cardId}">
            <label for='pay2'>信用卡</label><br/>
            <div class="contain" id="usedCardDiv">
                <div class="created" id="myCard">
                    <c:choose>
                        <c:when test="${lastUccb != null}">
                            <img src="${pageContext.request.contextPath}/images/homePic/VISA.jpg">
                            <h5>Visa <span>****</span> <span id='cardLastFour'>${lastUccb.cardNumberP4}</span></h5>
                            <p>過期時間 <span id='expiredDate'>${lastUccb.expireMonth}/20${lastUccb.expireYear}</span></p>
                            <p>最近一次消費使用這張卡片</p>
                        </c:when>
                        <c:otherwise>
                            <h5>請選擇使用的卡片</h5>
                        </c:otherwise>
                    </c:choose>
                </div>
                <button type="button" class="btn btn-outline-dark" id="changeCardBtn" style="height: 50px">選擇其他卡片</button>
            </div>
<%--                2-1 瀏覽全部卡片--%>
            <div class="mask">
                <div class="mask1">
                    <c:forEach items="${uccbList}" var="uccb">
                        <div class="contain">
                            <div class="created thisCard" id="${uccb.cardId}">
                                <img src="${pageContext.request.contextPath}/images/homePic/VISA.jpg">
                                <h5>Visa <span>****</span>${uccb.cardNumberP4}</h5>
                                <p>過期時間 ${uccb.expireMonth}/20${uccb.expireYear}</p>
                                <p>${uccb.useCard == 1? "最近一次消費使用這張卡片":""}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

<%--               3. 輸入其他卡片, 並新增卡片--%>
            <div>
                <input type="radio" name="payMethod" id='pay3' value='newCard'>
                <label for='pay3'>使用並新增信用卡</label><br/>
                <div id='addNewCard' style="margin-left:45px">
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
                </div>
            </div>
            <div>
                <input type="radio" name="payMethod" id='pay4' value='newCard'>
                <label for='pay4'>第三方支付-綠界科技Ecpay</label><br/>
            </div>
            <div class="g-recaptcha"
                 data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                 data-callback='verifyCallback' data-action='ubmit'>Submit
            </div>
            <p id="robotCheck" style="color: red" hidden>需要通過驗證</p>

            <button class="btn btn-primary sbtn" id="insertOrder">送出訂單</button>
            <span class="err">${errors.address} </span><span class="err">${errors.recaptcha}</span>

            <div id="orderForEcpay">
            </div>
            <button class="btn btn-primary sbtn" id="insertEcpayOrder" hidden>送出訂單</button>
        </div>

    </div>

</div>
<%--拼接footer--%>
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
