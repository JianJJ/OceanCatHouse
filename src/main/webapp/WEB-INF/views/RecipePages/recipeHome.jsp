<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

 <!-- 拼接header -->
<jsp:include page="top_nav.jsp"></jsp:include>
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
    <script src="/recipe/js/recipeHome.js"></script>
    <link rel="stylesheet" href="/recipe/css/recipeHome.css">


    <title>食譜主頁</title>
</head>


<body>
 <div class="center">

            <div class="focusBlock">
                <button href="#" class='arrow-lef'>&lt;</button>
                <button href="#" class='arrow-r'>&gt;</button>
                <ul class='carou'>
                    <li>
                        <a href="#">
                            <h2>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h2>
                            <img src="./images/testPic1.jpg" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>味噌湯</h2>
                            <img src="./images/testPic2.jpg" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h2>
                            <img src="./images/testPic1.jpg" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h2>味噌湯</h2>
                            <img src="./images/testPic2.jpg" alt="">
                        </a>
                    </li>
                </ul>
                <ol class="blank">
                </ol>

        </div>

        <div class="container">
            <div class="row  justify-content-center">
                <section class='recommendRec col-xs-11 col-md-11'>
                    <h3 class="littleTitle">推薦食譜</h3>
                    <hr class='underline'>
                    <ul class='row'>
                        <li class='col-xs-9 col-md-9'>
                            <a href="#">
                                <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                <div class="row">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <span>南瓜、南瓜濃湯、蟹肉棒、南瓜盅、鮮蝦、奶油蘑菇、起司絲</span>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li class='col-xs-9 col-md-9'>
                            <a href="#">
                                <img src="./images/testPic2.jpg" alt="味噌湯">
                                <div class="row">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <span>海帶嫩芽、味噌醬</span>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </div>
                            </a>
                        </li>
                        <li class='col-xs-9 col-md-9'>
                            <a href="#">
                                <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                <div class="row">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <span>南瓜、南瓜濃湯、蟹肉棒、南瓜盅、鮮蝦、奶油蘑菇、起司絲</span>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li class='col-xs-9 col-md-9'>
                            <a href="#">
                                <img src="./images/testPic2.jpg" alt="味噌湯">
                                <div class="row">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <span>海帶嫩芽、味噌醬</span>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </div>
                            </a>
                        </li>
                        <li class='col-xs-9 col-md-9'>
                            <a href="#">
                                <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                <div class="row">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <span>南瓜、南瓜濃湯、蟹肉棒、南瓜盅、鮮蝦、奶油蘑菇、起司絲</span>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li class='col-xs-9 col-md-9'>
                            <a href="#">
                                <img src="./images/testPic2.jpg" alt="味噌湯">
                                <div class="row">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <span>海帶嫩芽、味噌醬</span>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </section>
            </div>
        </div>




</body>
</html>

  <!-- 拼接footer -->
<jsp:include page="bottom_nav.jsp"></jsp:include>