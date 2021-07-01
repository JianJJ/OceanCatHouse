<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
</head>

<body>


    <footer class="mainColor">
    <div class='info d-none d-lg-block'>
    	<h4>客服電話： 0975-999-789</h4>
    	<h4>信箱： c999889@gmail.com</h4>
    	<h4>客服時間： 週一 ~ 週五&nbsp;&nbsp; 早上8點 ~ 下午6點</h4>
    </div>
        <div class='clearfix'>
            <dl>
                <dt>逛食譜</dt>
                <dd><a href="${pageContext.request.contextPath}/recipeHome">人氣食譜</a></dd>
                <dd><a href="${pageContext.request.contextPath}/recipeSearch">醉心食譜</a></dd>
            </dl>
            <dl>
                <dt>會員服務</dt>
                <dd><a href="${pageContext.request.contextPath}/userBack/home">個人頁面</a></dd>
                <dd><a href="${pageContext.request.contextPath}/userBack/favorites">食譜收藏</a></dd>
                <dd><a href="${pageContext.request.contextPath}/userBack/userOrders">訂單查詢</a></dd>
                <dd><a href="${pageContext.request.contextPath}/views/forget">忘記密碼</a></dd>
            </dl>
            <dl>
                <dt>關於我們</dt>
                <dd><a href="#">公司資訊</a></dd>
                <dd><a href="#">隱私權與條款</a></dd>
            </dl>
        </div>
    </footer>
</body>

</html>