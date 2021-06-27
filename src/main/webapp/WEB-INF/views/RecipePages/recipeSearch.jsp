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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">
    
    <%-- jQuery放這裡 --%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

    <%-- Header的CSS、JS樣式放這裡    --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top_nav.css">


    <%-- footer的CSS、JS樣式放這裡    --%>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottom_nav.css">


    <%-- 主要的CSS、JS放在這裡--%>
    <script src="${pageContext.request.contextPath}/js/recipeDetails.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipeSearch.css">

    <title>食譜搜尋頁面</title>

</head>

<body>
<%--拼接header--%>
<jsp:include page="top_nav.jsp"></jsp:include>
    <div class="container">
        <div class="row justify-content-between">
            <form class="col-lg-3 d-none d-md-none d-lg-block recFilter" action="${pageContext.request.contextPath}/recipeSearch">
                <h3 class="littleTitle"><span>詳細搜尋</span><input type="reset" value="清除"></input></h3>
                <hr class='underline'>
                <h5>關鍵字搜尋</h5>
                <input class="form-control me-2 textSize" type="search" placeholder="食譜搜尋" aria-label="Search" id='searchName' name='searchString'>
                <hr class='underline'>
                <h5>材料搜尋</h5>
                <input class="form-control me-2 textSize" type="search" placeholder="搜尋材料，以空格分開 ex.排骨 玉米" aria-label="Search" id='searchIngre' name='searchMatString'>
                <input type="submit" value="搜尋" class="btn-search" id='btnRecResult'></input>
            </form>
  
            <section class="col-xs-12 col-lg-8 recResult offset-lg-4">
                <ul class="row row justify-content-around">
                    <c:if test="${recResultBean.size() eq 0}">
                        <h3>沒有找到任何結果喔!</h3>
                        <img src= '${pageContext.request.contextPath}/images/homePic/wall02.jpg'>
                    </c:if>
                    <c:if test="${recResultBean.size() ne 0}">
                        <%--顯示搜尋結果文字--%>
                        <h3>${searchResultText}</h3>
                        <%--預設搜尋畫面，在沒有輸入搜尋關鍵字前提下，預設使用推薦系統--%>
                        <c:forEach varStatus="loop" begin="0" end="${recResultBean.size()-1}">
                            <li class="col-lg-3 col-xs-6"><a href="${pageContext.request.contextPath}/recipeDetails?id=${recResultBean.get(loop.index).recId}">
                                <img src="${recResultBean.get(loop.index).recPic}" alt="${recResultBean.get(loop.index).recTitle}">
                                <h4 class='showLines'>${recResultBean.get(loop.index).recTitle}</h4>
                                <p class='showLines'>${recResultBean.get(loop.index).recText}</p>
                            </a></li>
                        </c:forEach>
                    </c:if>

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