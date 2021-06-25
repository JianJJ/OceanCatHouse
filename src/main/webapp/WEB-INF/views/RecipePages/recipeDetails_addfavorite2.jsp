<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addfavorite.css">
    <script src="${pageContext.request.contextPath}/js/addFavorite.js"></script>


</head>

<body>
<%--    <button id='addFavorite'>範例按鈕</button>--%>
    <div class="maskForFavorite">
        <div id='editConsole'>
            <h2>選擇收藏夾</h2>
            <button id='cancel'>x</button>
            <hr>
            <section>
                <form action="">
                    <div class="form-floating mb-3"> 
                        <input type="text" class="form-control" id="favoriteCategoryName" name="favoriteCategoryName"> 
                        <label for="favoriteCategoryName">收藏夾名稱</label> 
                    </div> 
                    <input type="submit" class="btnAdd" value="新增"> 
                </form>
            </section>

        </div>
    </div>
</body>



</html>