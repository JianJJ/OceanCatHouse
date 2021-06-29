<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

 <head>
     <meta charset="UTF-8">
 	 <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
 </head>

 <body>

    <!-- header部分 -->

    <nav class="navbar navbar-expand-lg navbar-light  mainColor ">
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

                <form class="d-flex" action="${pageContext.request.contextPath}/recipeSearch" method="get">
                    <input class="form-control me-2" type="search" placeholder="搜尋食譜..." aria-label="Search" name="searchString">
                    <button class="btn btn-search" type="submit">Search</button>
                  </form>
                  <em>|</em>
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