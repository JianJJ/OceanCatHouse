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
    <script src="${pageContext.request.contextPath}/js/recipeHome.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipeHome.css">


    <title>食譜主頁</title>
</head>


<body>
<!-- 拼接header -->
<jsp:include page="top_nav.jsp"></jsp:include>
<div class="center">

   
    <div class="container">
     <div class="focusBlock">
        <button  class='arrow-lef'>&lt;</button>
        <button  class='arrow-r'>&gt;</button>
        <ul class='carou'>
            <%--推薦食譜輪播圖迴圈--%>
<c:forEach varStatus="loop" begin="0" end="${recReccBean.size()-1}">
    <li>
        <a href="${pageContext.request.contextPath}/recipeDetails?id=${recReccBean.get(loop.index).recId}">
            <h2>${recReccBean.get(loop.index).recTitle}</h2>
            <img src="${recReccBean.get(loop.index).recPic}" alt="">
        </a>
    </li>
</c:forEach>

        </ul>
        <ol class="blank">
        </ol>

    </div>
    
    
        <div class="row  justify-content-center">
            <section class='recommendRec col-xs-11 col-md-11'>
                <h3 class="littleTitle">推薦食譜</h3>
                <hr class='underline'>
                <ul class='row'>
                    <%--推薦食譜迴圈--%>
                    <c:forEach varStatus="loop" begin="0" end="${recReccBean.size()-1}">
                    <li class='col-xs-12 col-md-12'>
                        <a href="${pageContext.request.contextPath}/recipeDetails?id=${recReccBean.get(loop.index).recId}">
                            <img  src="${recReccBean.get(loop.index).recPic}" alt="${recReccBean.get(loop.index).recTitle}">
                            <div class="row col-xs-8 col-md-8">
                                <h4 class='showLines'>${recReccBean.get(loop.index).recTitle}</h4>
                                <span>
                        <c:forEach varStatus="loop2" begin="0" end="${recReccBean.get(loop.index).recTag.length()-1}">
                                ${recReccBean.get(loop.index).recTag.split("、")[loop2.index]}
                        </c:forEach>
                                </span>
                                <p class='showLines'>
                                    ${recReccBean.get(loop.index).recText}
                                </p>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </section>
        </div>
    </div>


</div>

</body>
</html>

<!-- 拼接footer -->
<jsp:include page="bottom_nav.jsp"></jsp:include>
