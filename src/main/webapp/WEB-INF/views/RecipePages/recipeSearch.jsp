<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

	<%-- bootstrap的CSS、JS樣式放這裡 --%>
	<link rel="stylesheet" href="/recipe/css/bootstrap.min.css">
    <link rel="stylesheet" href="/recipe/css/bootstrap.rtl.min.css">
    
    <%-- jQuery放這裡 --%>
    <script src="/recipe/js/jquery-3.6.0.min.js"></script>

    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="/recipe/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
 	<link rel="stylesheet" href="/recipe/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <script src="/recipe/js/recipeDetails.js"></script>
    <link rel="stylesheet" href="/recipe/css/recipeSearch.css">

    <title>食譜搜尋頁面</title>

</head>

<body>
<%--拼接header--%>
<jsp:include page="top_nav.jsp"></jsp:include>
    <div class="container">
        <div class="row justify-content-between">
            <form class="col-lg-3 d-none d-md-none d-lg-block recFilter">
                <h3 class="littleTitle"><span>詳細搜尋</span><input type="reset" value="清除"></input></h3>
                <hr class='underline'>
                <h5>食譜名搜尋</h5>
                <input class="form-control me-2 textSize" type="search" placeholder="關鍵字" aria-label="Search" id='searchName' name='recTitle'>
                <hr class='underline'>
                <h5>材料搜尋</h5>
                <label for="searchIngre">包含材料</label>
                <input class="form-control me-2 textSize" type="search" placeholder="搜尋材料，以空格分開 ex.排骨 玉米" aria-label="Search" id='searchIngre' name='includeIngre'>
                <label for="notSearchIngre">不包含材料</label>
                <input class="form-control me-2 textSize" type="search" placeholder="以空格分開不包含的材料 ex.秋葵 茄子" aria-label="Search" id='notSearchIngre' name='notIncludeIngre'>
                <input type="submit" value="搜尋" class="btn-search" id='btnRecResult'></input>
            </form>
  
            <section class="col-xs-12 col-lg-8 recResult offset-lg-4">
                <ul class="row row justify-content-around">
                    <c:forEach varStatus="loop" begin="0" end="${recReccBean.size()-1}">
                        <li class="col-lg-3 col-xs-6"><a href="http://localhost:8080/recipe/recipeDetails?id=${recReccBean.get(loop.index).recId}">
                            <img src="${recReccBean.get(loop.index).recPic}" alt="${recReccBean.get(loop.index).recTitle}">
                            <h4 class='showLines'>"${recReccBean.get(loop.index).recTitle}"</h4>
                            <p class='showLines'>${recReccBean.get(loop.index).recText}</p>
                        </a></li>
                    </c:forEach>

                </ul>
                <button class="btn-search" id='btnRecMore'>載入更多</button>
                
            </section>
        </div>

           

        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon hyLink" id="toUp"></span>
        </div>



    </div>


</body>

</html>

<%--拼接footer--%>
<jsp:include page="bottom_nav.jsp"></jsp:include>