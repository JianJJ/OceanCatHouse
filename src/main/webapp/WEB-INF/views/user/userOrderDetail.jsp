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
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <%--    詳細訂單--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderDetails.css">

    <script src="${pageContext.request.contextPath}/js/userBack/userOrderDetail.js"></script>
</head>
<body>
<!--頁首-->
<jsp:include page="../RecipePages/top_nav.jsp"></jsp:include>
<%--主體--%>
<div class="contain">
    <h3>訂單管理</h3>


    <a href="${pageContext.request.contextPath}/userBack/userOrders"><span>&lt;</span>返回訂單記錄</a>
    <section>
        <table>
            <tr>
                <th>商品</th>
                <th>數量</th>
                <th>金額</th>
                <th>小記</th>
            </tr>
            <c:forEach items="${ordersBean.orderDetailBeans}" var="orderDetail">
                <tr>
                    <td class="productName">${orderDetail.productBean.productname}</td>
                    <td class="productNum">${orderDetail.quantity}</td>
                    <td class="productPrice">${orderDetail.sellingprice}</td>
                    <td class="productStatus">
                        NT$ <span class="productPrice">${orderDetail.sellingprice * orderDetail.quantity}</span>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="shipmentTitle">宅配到府運費</td>
                <td></td>
                <td></td>
                <td>    NT$ <span class="productPrice">60</span></td>
            </tr>
        </table>


    </section>

    <section class="customer">
        <h4>收件人資訊</h4>
        <div>
            <p>姓名：<span class="customerName">${sessionScope.user.username}</span></p>
            <p>地址：<span class="customerAddress">${ordersBean.address}</span></p>
            <p>手機：<span class="customerPhone">${sessionScope.user.userphone}</span></p>
            <p>Email：<span class="customerEmail">${sessionScope.user.email}</span></p>

        </div>
    </section>
</div>


<!--頁尾-->
<jsp:include page="../RecipePages/bottom_nav.jsp"></jsp:include>
</body>
</html>
