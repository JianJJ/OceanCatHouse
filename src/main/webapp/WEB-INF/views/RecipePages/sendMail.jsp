<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>

<script type="text/javascript">
    emailjs.init('user_bIfDwaLRbFfQmf0h2jZsH')
</script>
<style>
	a {
		
	}
</style>

<body>
	<h3 id='mailPageTitle'>將食譜寄送到信箱</h3>
	<!-- 
		<a id='mailPageLink' href='${pageContext.request.contextPath}/views/ShoppingMall'>或者到我們的商城逛逛</a><br> -->
	 <form id="form">
        <div class="field form-floating mb-3">
            <label for="recTitle">食譜名稱</label>
            <input type="text" class="form-control" readonly  name="recTitle" id="recTitle" value='${recMainBean.recTitle}'>
        </div>
        <div class="field form-floating mb-3">
            <label for="userName">稱呼</label>
            <input type="text" class="form-control" name="userName" id="userName" value='${sessionScope.user.username}'>
        </div>
        <div class="field">
            <label hidden for="recipeContext">recipeContext</label>
            <input type="text" class="form-control" hidden  name="recipeContext" id="recipeContext">
        </div>
        <div class="field form-floating mb-3">
            <label for="userEmail">信箱</label>
            <input type="text" class="form-control" name="userEmail" id="userEmail" value='${sessionScope.user.email}'>
        </div>

        <input type="submit" id="btnSend" value="確認發送信件">
    </form>
    

    <script>
        const btn = document.getElementById('btnSend');

        document.getElementById('form')
            .addEventListener('submit', function (event) {
                event.preventDefault();

                btn.value = '發送中...';

                const serviceID = 'default_service';
                const templateID = 'template_fg7q2s5';

                emailjs.sendForm(serviceID, templateID, this)
                    .then(() => {
                        btn.value = '確認發送信件';
                        alert('已經發送信件了！快去收信吧！');
                        $('#blackMask').fadeOut();
    		            $("html").removeClass("noscroll");
                    }, (err) => {
                        btn.value = '確認發送信件';
                        alert(JSON.stringify(err));
                    });
            });
    </script>
</body>
</html>