<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta property="og:image" content="http://www.web.com.tw/activity/images/fbbanner.gif"/>

    <meta property="og:image" content="${recMainBean.recPic}"/>
	<meta property="og:title" content="${recMainBean.recTitle}"/>
	<meta property="og:type" content="website" />
	<meta name="description" content="海貓食屋"/>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recipeDetails.css">
 	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>

    <title>${recMainBean.recTitle}</title>
</head>

<body>
	
 <!-- 拼接header -->
<jsp:include page="top_nav.jsp"></jsp:include>

    <div id='blackMask' class='mask'>
        <div class='modalSection' id='sectionOne'>
        <script>
			var recTitle = '${recMainBean.recTitle}';
			var recipeContext = "";
			var img = '${recMainBean.recPic}';	
			
		</script>
            <button class='closeMask'>X</button>
            <jsp:include page="sendMail.jsp"></jsp:include>
        </div>
    </div>
    
    <div id='blackMaskTwo' class='mask'>
     
        <div class='modalSection' id='sectionTwo'>
        <button class='closeMask'>X</button>
        <h4>分享</h4>
        <ul>
        <li class="fontIcon hyLink">
                 			<a href="#" id='lineShare' target="_blank">
                 				<img src="${pageContext.request.contextPath}/images/homePic/round_default.png">
                 				<p>Line</p>
                 			</a>
                 		</li>
                 		<li class="fontIcon hyLink font">
								 <a class="fontIcon hyLink" id="fbShare" href="#">
								 <p>FB</p></a>	 
                 		</li>
                 		
                 		<li class="fontIcon hyLink font" >
                 		<a  class="fontIcon hyLink" id='twitterShare' href="#" target="_blank">
                 		<p>Twitter</p></a></li>
                 	</ul>
                 	<div id='copyConsole'>
                 	<textarea readonly class="copy_url_input">${pageContext.request.requestURL}</textarea>
                 	<a class="copy_url_a">複製連結</a>
</div>
        </div>
    </div>
  
  <div id='blackMaskThree' class='mask'>
  <div class='modalSection' id='sectionThree'>
   <button class='closeMask'>X</button>
  </div>
  </div>

    <!-- 中間部分 -->
     <div class="container">
        <div class='row'>
            <!-- 左邊浮動區塊 -->
            <div class="barNav col-xs-1 col-lg-1 d-md-none d-lg-block">
                <ul>
                    <li class="fontIcon hyLink" id='addFavorite'></li>
                    <li class="fontIcon hyLink" id='mail'></li>
                    <li id='shareLinks' class="fontIcon hyLink">  </li>
                </ul>
            </div>

            <!-- 網頁中間內文 -->
  <div class="main col-xs-10 col-md-11">
                <!-- RecTitle -->
                <div class='row'>
                    <h1 class='recTitle col-md-12'>${recMainBean.recTitle}</h1>
                    <hr class='titleLine col-md-10'>
                </div>

                <!-- RecContext Block -->
                <section class='RecContextBlock row'>
                    <img src="${recMainBean.recPic}" alt="${recMainBean.recTitle}" class="recPic  col-lg-7 col-xs-12">

                    <div class='recDetail col-lg-4 col-xs-10'>
                    	
                        <div class="recTime">
                            <span class='fontIcon'></span>
                            <span class='time'>${recMainBean.recTime eq 0? "": String.valueOf(recMainBean.recTime).concat(" 分鐘") }</span> 
                        </div>
                        <div class="recPerson">
                            <span class='fontIcon'></span>
                            <span>${recMainBean.recNum eq 0? "": String.valueOf(recMainBean.recNum).concat(" 人份") }</span>
                        </div>
                        <div class="cal">
                            <span class='fontIcon'></span>
                            <span>${recMainBean.recCal}  卡路里</span>
                        </div>
                        <!--  <div class="goodPerson">
                            <span class='fontIcon'></span>
                            <span>${recMainBean.recLiked}  人按讚</span>
                        </div> -->
                       
     
                        <div class='tags'>
                            <span class='fontIcon'></span>
                            <div>
                            <%--取出JSON元素迴圈--%>
                            <script>
                            var index = 0;
                            </script>
                
                            <c:forEach varStatus="loop" begin="0" end="${recTagLen-1}">
                                <span class="tagItem"><a href="#">${recTag[loop.index]}</a></span>
                                <script>
                            		var uri = encodeURI('${recTag[loop.index]}');
                            		$('.tagItem > a').eq(index).attr("href", "${pageContext.request.contextPath}/recipeSearch?searchString=" +uri);
                            		index++;
                            	</script>
                            </c:forEach>
               
                            </div>
                        </div>
                    </div>
                </section>

                <!-- RecTextContext -->
                <div class='row' style='position:relative;'>
                    <p class="RecTextContext col-xs-12">
                        ${recMainBean.recText}      
                          
                    </p>
                  <span id='viewTimes'>瀏覽人次:  ${recMainBean.recViews}  人</span><br>
                 <span id='createdDate'>創建時間:  ${recMainBean.recCreated}</span>     
                </div>
                 


                <section class='IngreAndStep row'>
                    <!-- ingredent Block -->
                    <div class="recIngre blockColor col-md-3 col-xs-12">
                        <div class='blockOne'>
                            <h3 class="littleTitle">食材</h3>
                            <hr class='underline'>
                            <%--載入食材迴圈--%>
                            <c:forEach varStatus="loop" begin="0" end="${recMatBean.size()-1}">
                            <div class="ingredent row">
                                <span class='ingreContext col-md-6 col-xs-6'>${recMatBean.get(loop.index).materialName}</span>
                                <span class='ingreUnit  col-md-5 col-xs-5'>${recMatBean.get(loop.index).unitNum}</span>
                                <script type="text/javascript"> 
                                	
                                	if(ingrearray != null){
                                		var str = '${recMatBean.get(loop.index).materialName}' + "    " + '${recMatBean.get(loop.index).unitNum}'  +"<br/>";
                                		ingrearray = ingrearray.concat(str);
                                	}else {
                                		var ingrearray = "";
                                		var str = '${recMatBean.get(loop.index).materialName}' + "    " + '${recMatBean.get(loop.index).unitNum}' +"<br/>";
                                    	ingrearray = ingrearray.concat(str);
                                	}
                                	
                                </script>
                            </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Step(食譜步驟區) Block -->
                    <div class="recStep blockColor col-md-8 col-xs-12">
                        <h3 class="littleTitle">作法</h3>
                        <hr class='underline'>
                        <%--載入食譜步驟迴圈--%>
                        <c:forEach varStatus="loop" begin="0" end="${recStepBean.size()-1}">
                            <c:if test="${recStepBean.get(loop.index).stepPic ne 'null'}">
                                <div class="step">
                                    <img src= "${recStepBean.get(loop.index).stepPic}" alt="空">
                                    <h1>${loop.index+1}</h1>
                                    <p>${recStepBean.get(loop.index).stepText}</p>
                                </div>
                                <hr class='divLine'>
                            </c:if>
                            <c:if test="${recStepBean.get(loop.index).stepPic eq 'null'}">
                                <div class="step">
<%--                                    <img src= "${recStepBean.get(loop.index).stepPic}" alt="空">--%>
                                    <h1>${loop.index+1}</h1>
                                    <p>${recStepBean.get(loop.index).stepText}</p>
                                </div>
                                <hr class='divLine'>
                            </c:if>
                        </c:forEach>
                    </div>
                </section>

                <!-- recommendRecipe -->
                <div class="row">
                    <section class='recommendRec blockColor col-xs-11 col-md-11'>
                        <h3 class="littleTitle">推薦食譜</h3>
                        <hr class='underline'>
                        <ul class='row'>
                            <%--推薦食譜迴圈--%>
                        <c:forEach varStatus="loop" begin="0" end="${recReccBean.size()-1}">
                            <li class='col-xs-6 col-md-2'><a href="${pageContext.request.contextPath}/recipeDetails?id=${recReccBean.get(loop.index).recId}">
                                    <img src="${recReccBean.get(loop.index).recPic}" alt="${recReccBean.get(loop.index).recTitle}">
                                    <h4 class='showLines'>${recReccBean.get(loop.index).recTitle}</h4>
                                    <p class='showLines'>
                                            ${recReccBean.get(loop.index).recText}
                                    </p>
                                </a></li>
                        </c:forEach>
                        </ul>
                    </section>
                </div>

<%--                <div class="row">--%>
<%--                    <section class='seenRec blockColor col-xs-11 col-md-11'>--%>
<%--                        <h3 class="littleTitle">最近看過的食譜</h3>--%>
<%--                        <hr class='underline'>--%>
<%--                        <ul class='row'>--%>
<%--                            <li class='col-xs-6 col-md-2'><a href="#">--%>
<%--                                    <img src="../../../../resources/static/images/homePic/testPic1.jpg/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">--%>
<%--                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>--%>
<%--                                    <p class='showLines'>--%>
<%--                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜--%>
<%--                                    </p>--%>
<%--                                </a></li>--%>
<%--                                <li class='col-xs-6 col-md-2'><a href="#">--%>
<%--                                    <img src="../../../../resources/static/images/homePic/testPic2.jpg/testPic2.jpg" alt="味噌湯">--%>
<%--                                    <h4 class='showLines'>味噌湯</h4>--%>
<%--                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>--%>
<%--                                </a></li>--%>
<%--                                <li class='col-xs-6 col-md-2'><a href="#">--%>
<%--                                    <img src="../../../../resources/static/images/homePic/testPic1.jpg/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">--%>
<%--                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>--%>
<%--                                    <p class='showLines'>--%>
<%--                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜--%>
<%--                                    </p>--%>
<%--                                </a></li>--%>
<%--                                <li class='col-xs-6 col-md-2'><a href="#">--%>
<%--                                    <img src="../../../../resources/static/images/homePic/testPic2.jpg/testPic2.jpg" alt="味噌湯">--%>
<%--                                    <h4 class='showLines'>味噌湯</h4>--%>
<%--                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>--%>
<%--                                </a></li>--%>
<%--                                <li class='col-xs-6 col-md-2'><a href="#">--%>
<%--                                    <img src="../../../../resources/static/images/homePic/testPic1.jpg/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">--%>
<%--                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>--%>
<%--                                    <p class='showLines'>--%>
<%--                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜--%>
<%--                                    </p>--%>
<%--                                </a></li>--%>
<%--                        </ul>--%>
<%--                    </section>--%>
<%--                </div>--%>
            </div>
        </div>


        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon hyLink" id="toUp"></span>
        </div>

    </div>



   <!-- 拼接footer -->
<jsp:include page="bottom_nav.jsp"></jsp:include>

</body>


</html>
