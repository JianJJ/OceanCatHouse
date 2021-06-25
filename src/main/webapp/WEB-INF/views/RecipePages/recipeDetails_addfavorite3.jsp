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
                    <label for="cate1">
                        <div class="favoriteCategory">
                            <h5 class="categoryName">豬肚雞湯</h5>
                            <input type="checkbox" name="chooseFavorite" id="cate1" value="">
                        </div>
                    </label>
            
                    <label for="cate2">
                        <div class="favoriteCategory">
                            <h5 class="categoryName">酸菜魚</h5>
                            <input type="checkbox" name="chooseFavorite" id="cate2" value="">
                        </div>
                    </label>
                    <label for="cate3">
                        <div class="favoriteCategory">
                            <h5 class="categoryName">河豚生魚片</h5>
                            <input type="checkbox" name="chooseFavorite" id="cate3" value="">
                        </div>
                    </label>

                    <label for="cate4">
                        <div class="favoriteCategory">
                            <h5 class="categoryName">酸辣土豆絲</h5>
                            <input type="checkbox" name="chooseFavorite" id="cate4" value="">
                           
                        </div>
                    </label>
                    <label for="cate5">
                        <div class="favoriteCategory">
                            <h5 class="categoryName">麻的豆腐腦真的很噁</h5>
                            <input type="checkbox" name="chooseFavorite" id="cate5" value="">
                        </div>
                    </label>

                    <label for="cate6">
                        <div class="favoriteCategory">
                            <h5 class="categoryName">毛血旺</h5>
                            <input type="checkbox" name="chooseFavorite" id="cate6" value="">
                        </div>
                    </label>


                    <input type="submit" class="btnAdd" value="完成">
                </form>
            </section>

        </div>
    </div>

</body>
</html>