<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

 <head>
     <meta charset="UTF-8">
<%-- 	 <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>--%>
 </head>

 <body>

    <!-- header部分 -->

    <nav class="navbar navbar-expand-lg navbar-light  mainColor narSize">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/homePage" id="mainTitle">✿海貓食屋✿</a>
            <!-- top-right bar -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
       
          </button>

            <div class="collapse navbar-collapse" id="navbarScroll">


                <ul class="navbar-nav me-auto my-2 my-lg-0" style="--bs-scroll-height: 100px;">
                    <li class="nav-item">
                        <a class="navLink navColor" href="${pageContext.request.contextPath}/recipeHome">食譜</a>
                    </li>

                    <li class="nav-item">
                        <a class="navLink navColor" href="${pageContext.request.contextPath}/views/ShoppingMall" tabindex="-1" aria-disabled="true">商城</a>
                    </li>
                </ul>

                  
                  <div id='userConsole'>


                      <img src= '${pageContext.request.contextPath}/images/userPic/${sessionScope.user.userpic!=null?sessionScope.user.userpic:"paw-solid.svg"}'   id="userIcon">
                    <button id="userName">${sessionScope.user.username}</button>
                    <ul>
                      <li><a href="${pageContext.request.contextPath}/userBack/home">個人主頁</a></li>
                      <li><a href="${pageContext.request.contextPath}/userBack/userSetting">帳號設定</a></li>
                      <li><a href="${pageContext.request.contextPath}/userBack/userLogout">登出</a></li>
                    </ul>
                  </div>

            </div>
        </div>
    </nav>
    
     <nav class="navbar navbar-expand-lg navbar-light menu">
        <div class="container-fluid">
         <div class="collapse navbar-collapse row" id="navbarScroll">
                <ul class="navbar-nav  my-lg-0 col-lg-8" style="--bs-scroll-height: 100px;">
                    <li class="nav-item">
                        <a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall" id="home" ><span class='fontIcon'></span></a>
                    </li>
                    <li class="nav-item">
                    	 <a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall?categoryid=1&pad=1">米麵五穀</a>
                    </li>
                    <li class="nav-item">
                    	<a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall?categoryid=5&pad=1">植物油</a>
                    </li>
                    <li class="nav-item">
                        <a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall?categoryid=4&pad=1">醬料</a>
                    </li>
                    <li class="nav-item">
                        <a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall?categoryid=2&pad=1">蔬果</a>
                    </li>
                    <li class="nav-item">
                        <a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall?categoryid=3&pad=1">生鮮</a>
                    </li>
                    <li class="nav-item">
                        <a class="ShopNarBar" href="${pageContext.request.contextPath}/views/ShoppingMall?categoryid=6&pad=1">乾貨</a>
                    </li>
                </ul>

                <form class="d-flex col-lg-3" action="${pageContext.request.contextPath}/views/ShoppingMall" method="get">
                    <input class="form-control me-2" type="search" placeholder="尋找食材..." aria-label="Search" name="searchString">
                    <button class="btn btn-search selectProduct" type="submit">Search</button>
                  </form>
          </div>
        </div>
    </nav>

    
   
    <script>
    	$('#userName, #userIcon').click(function(){
    		window.location.href='${pageContext.request.contextPath}/userBack/home';
    		
    	})
        if(${sessionScope.user.username == null || sessionScope.user.username == ""}){
            $('#userConsole ul li a').eq(2).text("登入");
        }else {
            $('#userConsole ul li a').eq(2).text("登出");
        }
    
    </script>

</body>

</html>