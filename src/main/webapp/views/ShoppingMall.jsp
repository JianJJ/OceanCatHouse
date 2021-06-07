<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<script src="../js/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/demo.css">
<link rel="stylesheet" href="../css/ShoppingMall.css">
<title>✿海貓食屋✿</title>
</head>

<body>
	<canvas id="canvas"></canvas>
	<!-- header部分 -->
	<header class="mainColor">
		<div class="title">✿海貓食屋✿</div>
		<div class="littleNav">
			<ul>
				<li><a href="#" class="top">RECIPES</a></li>
				<li><a href="#">SHOP</a></li>
			</ul>
		</div>
		<div class="simpleSearch">
			<input type="text" id="searchLine" placeholder="Search..."> <label
				for="searchLine"> <span class="fontIcon searchIcon"></span></label>
		</div>

		<div class="Login">
			<span class="text">SIGN UP</span><em>/</em> <span class="text">LOG
				IN</span>
		</div>

		<button class="userIcon"></button>
	</header>
	<!-- 分類條 -->
	<div class="menu">
		<div id="home">
			<a href="../views/ShoppingMall.jsp"><img src="../images/home.png" alt=""></a>
		</div>
		<a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=1">米麵五穀</a> 
		<a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=5">油</a>
		<a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=4">醬料</a> 
		<a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=2">蔬果</a>
		<a class="menuDetail" href="../views/ShoppingMall.jsp?categoryid=3">生鮮</a>
	</div>

	<!-- 中間部分 -->
	<div class="center">

		<!-- 左邊浮動區塊 -->
		<div class="barNav">
			<ul>
				<li class="fontIcon"></li>
				<li class="fontIcon"></li>
				<li class="fontIcon"></li>
				<li class="fontIcon"></li>
			</ul>
		</div>


		<!-- 網頁中間內文 -->
		<div class="main clearfix">
			<div class="grid-row clearfix">
				
				<div class="Product">
					<a href="./Details.html">
						<figure>
							<img
								src="https://uploads-market.icook.network/uploads/product/square_cover/633/medium_5d234091f5.jpg"
								alt="">
							<h2>360°陀螺循環立扇</h2>
						</figure>
					</a>
				</div>
				<script>
					var categoryid =0;
					categoryid= '${param.categoryid}';
					if(categoryid == null){console("categoryid")};
					$.ajax({
						url : "/recipe/shopping/"+categoryid,
						type : "get",
						
						success : doSuccess,
						error : doError
					})
					function doSuccess(json) {
						console.log(json);


                        for(var A of json){
                            console.log(A)
                            $(".grid-row").prepend('<div class="Product"><a href="/recipe/views/Details.jsp?id='+A.productid+'"><figure><img src="../images/'+A.productmodel+'-1.jpg" alt=""><h2>'+A.productname+'</h2></figure></a></div>');
                                
                        }
					}
					function doError(json) {
						console.log("error");

					}
				</script>

			</div>


		</div>

		<!-- 右邊至頂 -->

		<div class="toUP">
			<span class="fontIcon" id="toUp"></span>
		</div>
	</div>

	<footer class="mainColor">
		<dl>
			<dt>關於我們</dt>
			<dd>
				<a href="#">公司資訊</a>
			</dd>
			<dd>
				<a href="#">徵才訊息</a>
			</dd>
			<dd>
				<a href="#">廣告合作</a>
			</dd>
			<dd>
				<a href="#">市集上架</a>
			</dd>
			<dd>
				<a href="#">品牌資產</a>
			</dd>
			<dd>
				<a href="#">隱私權與條款</a>
			</dd>
		</dl>
		<dl>
			<dt>會員服務</dt>
			<dd>
				<a href="#">個人頁面</a>
			</dd>
			<dd>
				<a href="#">食譜收藏</a>
			</dd>
			<dd>
				<a href="#">商品訂單</a>
			</dd>
			<dd>
				<a href="#">帳號設定</a>
			</dd>
			<dd>
				<a href="#">忘記密碼</a>
			</dd>
			<dd>
				<a href="#">VIP會員</a>
			</dd>
		</dl>
		<dl>
			<dt>逛食譜</dt>
			<dd>
				<a href="#">人氣食譜</a>
			</dd>
			<dd>
				<a href="#">新廚上菜</a>
			</dd>
			<dd>
				<a href="#">今日話題</a>
			</dd>
			<dd>
				<a href="#">醉心食譜</a>
			</dd>
			<dd>
				<a href="#">全部分類</a>
			</dd>
		</dl>
	</footer>
	<script src="../js/umbrella.js"></script>
</body>

</html>