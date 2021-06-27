<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addfavorite.css">
    <script src="${pageContext.request.contextPath}/js/addFavorite.js"></script>


</head>

<body>

    <div class="maskForFavorite">

        <div id='editConsole'>
            <h2>選擇收藏夾</h2>
            <button id='cancel'>x</button>
            <hr>
            <section>
                <div class="nothing">目前無任何收藏夾<br>快新建一個吧</div>
                <a href="${pageContext.request.contextPath}/userBack/favorites" target="_blank"><button class='btnAdd' id='btnAddNew'><span>+</span>新建收藏夾</button></a>
            </section>

        </div>
    </div>



</body>



</html>