<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--拼接header--%>
<jsp:include page="top_nav.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">



    <%--Header的CSS、JS樣式放這裡    --%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/recipe/css/bootstrap.min.css">
    <link rel="stylesheet" href="/recipe/css/bootstrap.rtl.min.css">
    <link rel="stylesheet" href="/recipe/css/top_nav.css">


    <%--footer的CSS、JS樣式放這裡    --%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="/recipe/css/bottom_nav.css">


    <%--主要的CSS放在這裡--%>
    <script src="/recipe/js/jquery-3.6.0.min.js"></script>
    <script src="/recipe/js/recipeDetails.js"></script>
    <link rel="stylesheet" href="/recipe/css/recipeDetails.css">


    <title>食譜詳細頁面</title>
</head>

<body>


    <!-- 中間部分 -->
    <div class="container">
        <div class='row'>
            <!-- 左邊浮動區塊 -->
            <div class="barNav col-xs-1 col-lg-1 d-md-none d-lg-block">
                <ul>
                    <li class="fontIcon hyLink"></li>
                    <li class="fontIcon hyLink"></li>
                    <li class="fontIcon hyLink"></li>
                    <li class="fontIcon hyLink"></li>
                </ul>
            </div>


            <!-- 網頁中間內文 -->
            <div class="main col-xs-10 col-md-11">
                <!-- RecTitle -->
                <div class='row'>
                    <h1 class='recTitle col-md-12'>南瓜盅</h1>
                    <hr class='titleLine col-md-10'>
                </div>

                <!-- RecContext Block -->
                <section class='RecContextBlock row'>
                    <img src="./images/testPic1.jpg" alt="" class="recPic  col-lg-7 col-xs-12">

                    <div class='recDetail col-lg-4 col-xs-10'>
                        <div class="recTime">
                            <span class='fontIcon'></span>
                            <span class='time'>20 </span> 分鐘
                        </div>
                        <div class="recPerson">
                            <span class='fontIcon'></span>
                            <span>2 </span>人份
                        </div>
                        <div class='tags'>
                            <span class='fontIcon'></span>
                            <span>標籤 </span>
                        </div>
                    </div>
                </section>

                <!-- RecTextContext -->
                <div class='row'>
                    <p class="RecTextContext col-xs-12">
                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！
                    </p>
                </div>


                <section class='IngreAndStep row'>
                    <!-- ingredent Block -->
                    <div class="recIngre blockColor col-md-3 col-xs-12">
                        <div class='blockOne'>
                            <h3 class="littleTitle">食材</h3>
                            <hr class='underline'>
                            <div class="ingredent">
                                <span class='ingreContext'>低筋麵粉</span>
                                <span class='ingreUnit'>180克</span>
                            </div>
                            <div class="ingredent">
                                <span class='ingreContext'>低筋麵粉</span>
                                <span class='ingreUnit'>180克</span>
                            </div>
                            <div class="ingredent">
                                <span class='ingreContext'>低筋麵粉</span>
                                <span class='ingreUnit'>180克</span>
                            </div>
                        </div>
                    </div>

                    <!-- Step Block -->
                    <div class="recStep blockColor col-md-8 col-xs-12">
                        <h3 class="littleTitle">作法</h3>
                        <hr class='underline'>
                        <div class="step">
                            <img src="./images/testPic1.jpg" alt="">
                            <h1>1</h1>
                            <p>將全部食材放入盆中。</p>

                        </div>
                        <hr class='divLine'>
                        <div class="step">
                            <img src="./images/testPic1.jpg" alt="">
                            <h1>2</h1>
                            <p>洋蔥有點微透後，加入豬肉片拌炒
                                ✴若是用豬五花，先炒豬五花後再放洋蔥和蒜末。</p>
                        </div>
                    </div>
                </section>

                <!-- recommendRecipe -->
                <div class="row">
                    <section class='recommendRec blockColor col-xs-11 col-md-11'>
                        <h3 class="littleTitle">推薦食譜</h3>
                        <hr class='underline'>
                        <ul class='row'>
                            <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic2.jpg" alt="味噌湯">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic2.jpg" alt="味噌湯">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </a></li>
                        </ul>
                    </section>
                </div>

                <div class="row">
                    <section class='seenRec blockColor col-xs-11 col-md-11'>
                        <h3 class="littleTitle">最近看過的食譜</h3>
                        <hr class='underline'>
                        <ul class='row'>
                            <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic2.jpg" alt="味噌湯">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic2.jpg" alt="味噌湯">
                                    <h4 class='showLines'>味噌湯</h4>
                                    <p class='showLines'>味噌醬先泡開，加入味噌醬汁後，不要煮到沸騰，還有，海帶嫩芽也不可以煮沸，湯才不會糊掉。</p>
                                </a></li>
                                <li class='col-xs-6 col-md-2'><a href="#">
                                    <img src="./images/testPic1.jpg" alt="鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜">
                                    <h4 class='showLines'>鮮蝦南瓜濃湯(南瓜盅)x氣炸烤箱食譜</h4>
                                    <p class='showLines'>
                                        防疫期間推薦大家選購高營養且耐放的根莖類蔬果，像是馬鈴薯/地瓜/南瓜/洋蔥等蔬菜可放置1~2週以上保存，像是米粒跟大胃先生非常愛喝餐廳的南瓜濃湯，其實在家自己煮超級簡單喔！只要加上一包市售濃湯粉~味道立刻升級~就跟餐廳賣得一模一樣好喝！詳細食譜
                                    </p>
                                </a></li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>


        <!-- 右邊至頂 -->

        <div class="toUP">
            <span class="fontIcon hyLink" id="toUp"></span>
        </div>



    </div>



</body>

<script>



</script>

</html>

<%--拼接footer--%>
<jsp:include page="bottom_nav.jsp"></jsp:include>