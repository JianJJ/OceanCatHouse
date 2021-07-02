$(function(){

    $('#pay1').click(function(){
        $('#addNewCard').slideUp();
        $('#usedCardDiv').slideUp();
        $('#insertOrder').prop('hidden', false);
        $('#insertEcpayOrder').prop('hidden', true);
    }).click();
	$('#pay2').click(function(){
        $('#usedCardDiv').slideDown();
		$('#addNewCard').slideUp();
        $('#insertOrder').prop('hidden', false);
        $('#insertEcpayOrder').prop('hidden', true);
	});
	$('#pay3').click(function(){
		$('#addNewCard').slideDown();
        $('#usedCardDiv').slideUp();
        $('#insertOrder').prop('hidden', false);
        $('#insertEcpayOrder').prop('hidden', true);
	});
	$('#pay4').click(function (){
        $('#addNewCard').slideUp();
        $('#usedCardDiv').slideUp();
        $('#insertOrder').prop('hidden', true);
        $('#insertEcpayOrder').prop('hidden', false);
    });


	$('input').keyup(function(e){   
    if($(this).val().length==$(this).attr('maxlength')){   
    $(this).next(':input').focus();   
}
});  
	
	var expireMonthStr = "";
	for(i = 1;i <=12; i++) {
        var strI = i < 10  ? "0"+ i:i;
		expireMonthStr = expireMonthStr +" <option value='" + strI +"'>" + strI + "</option>";
	}
	$('#expireMonth').html(expireMonthStr);
	
	var expireYearStr = "";
	for(i = 21;i <=30; i++) {
		expireYearStr = expireYearStr +" <option value='" + i +"'>" + i + "</option>";
	}
	$('#expireYear').html(expireYearStr);
	

	var productList = [];
    var CatProduct = [];
    var sell = [];
    var c = [];//合計
    //讀去cat資料
    $.ajax({
        url: "/OceanCatHouse/catData",
        type: "get",
        async: false,
        // dataType: "json",
        success: function (json) {
            CatProduct = json;
            var key = Object.keys(json);
            for (var A in json) {
                //用id找資料
                $.ajax({
                    url: "/OceanCatHouse/product/" + A,
                    type: "get",
                    async: false,
                    success: function (product) {
                        productList.push(product);
                        sell[product.productid] = product.sellingprice;
                        c[product.productid] = product.sellingprice * json[product.productid];//合計
                        $('.cat').append('<div class="catProduct col-lg-11" id="catProduct' + product.productid + '">' +
                            '<img  src="/OceanCatHouse/images/shop/' + product.productmodel + '-1.jpg" alt="">' +
                            '<div class="context col-lg-11 row"><h3 class="col-lg-4  col-sm-12 col-md-12">' + product.productname + '</h3>' +
                            '<span class="standard col-lg-3 d-none d-lg-inline-block">' + product.productspecifications + '</span>' +
                            ' <span class="pnum col-lg-3 d-none d-lg-inline-block">' + json[product.productid] + '</span>' +
                            '<span class="total col-lg-1  col-sm-12 col-md-12" id="total' + product.productid + '">$' + c[product.productid] + '</span>' +
                            '</div>' +
                            '</div>');

                    }
                    , error: function (json) {
                        console.log("err " + json);

                        function suc(product, A) {

                        }

                    }
                })


            }
        }, error: function (json) {
            console.log("err " + json);
        }
    })
    var cat = '${cat}';
    if (cat == 0) {
        alert("未購買商品");
        window.location.href = "/OceanCatHouse/views/ShoppingMall";
    }
    var user = '${id}';
    // if (user == 0) {
    //     alert("請先登入");
    //     window.location.href = "/OceanCatHouse/views/login";
    // }
    //總價
    var key = Object.keys(CatProduct);
    var m = 0;
    for (var k of key) {
        m += CatProduct[k] * sell[k];
    }
    $(".PPP").text("商品金額 :$ " + m);
    var a = m + 60
    $(".SSS").text("訂單金額 :$ " + a);

  // ---------------- Jian ----------------------------
    // 送出訂單
    // 紀錄機器人驗證key
    var Orderkey = "";
    var isCheck = false;
    verifyCallback = function (key){
        Orderkey = key;
    }
    $('#insertOrder').click(function (){
        // 判斷付款方式
        var PaymentId = 1;
        var cardId = 0;
        var addCard = {};
        if($('#pay1').prop('checked')){
            // 貨到付款
            PaymentId = 2;
        }else if($('#pay2').prop('checked')){
            // 使用原有的卡片
            cardId = parseInt($('#pay2').val());
        }else if($('#pay3').prop('checked')){
            // 使用新增的卡片
            addCard = {
                "userCardName" : $('#userCardName').val(),
                "cardNumberP1" : $('#cardNumberP1').val(),
                "cardNumberP2" : $('#cardNumberP2').val(),
                "cardNumberP3" : $('#cardNumberP3').val(),
                "cardNumberP4" : $('#cardNumberP4').val(),
                "expireMonth"  : $('#expireMonth').val(),
                "expireYear"   : $('#expireYear').val(),
                "checkNumber"  : $('#checkNumber').val()
            };
        }else {
            PaymentId = 3;
        }
        // 紀錄結帳資訊
        var pay = {
            "PaymentId" : PaymentId,    // 1=信用卡, 2=貨到付款
            "cardId"    : cardId,       // 0=新增卡片, !=0使用舊卡片
            "addCard"   : addCard,      // cardId=0, 新增卡片的資料
            "Orderkey"  : Orderkey      // 機器人驗證金鑰
        };
        $.ajax({
            url : "/OceanCatHouse/addPay",
            type : "POST",
            data : JSON.stringify(pay),// 付款方式
            contentType : "application/json;charset=utf-8",
            async : false,
            cache : false,
            success : function (isOK) {
                if(isOK == "true"){
                    isCheck = true;
                }
            },
            error : function (){
                alert("系統忙碌中，請聯繫我們！");
            }
        })
        if(isCheck){
            $.ajax({
                url : "/OceanCatHouse/insertOrder",
                type : "POST",
                data : JSON.stringify(productList),// productList購買的商品
                contentType : "application/json;charset=utf-8",
                async : false,
                cache : false,
                success : function (payNumber) {
                    if(payNumber == 3){
                        console.log('前往綠界付款頁面');
                    }else {
                        if(confirm("訂單已送出，是否要繼續購物呢？")){
                            $(location).attr("href", "/OceanCatHouse/views/ShoppingMall");
                        }else {
                            $(location).attr("href", "/OceanCatHouse");
                        }
                    }
                },
                error : function (){
                    alert("系統忙碌中，請聯繫我們！");
                }
            })
        }else {
            $('#robotCheck').prop('hidden', false);
        }

    })

    // 選擇其他信用卡
    $('#changeCardBtn').click(function (){
        $('.mask').fadeIn("normal");
    })
    $('.mask').click(function(){
        $(this).fadeOut("normal");
    })
    $('.thisCard').on('click', function (){
        $('#myCard').empty();
        $('#myCard').append($(this).html());
        $('#pay2').val($(this).prop('id'));
        console.log($(this).prop('id'));
    })

    // 綠界ecpay-送出訂單去結帳
    $('#insertEcpayOrder').click(function (){
        // 先送出新增的訂單
        $('#insertOrder').trigger('click');
        // 確認是否通過機器人驗證
        if(isCheck){
            console.log('進來了');
            // 跳轉到綠界支付
            var productNameStr = ""
            for (var i=0;i<productList.length;i++) {
                productNameStr = productNameStr + `${productList[i].productname}` + "#";
            }
            productNameStr = productNameStr.substring(0, productNameStr.length-1);
            var map = {
                "productNameStr" : productNameStr, // 商品名稱
                "total" : a, // 訂單總金額
                // "Orderkey" : Orderkey // 是否驗證機器人金鑰
            }
            $.ajax({
                url : "/OceanCatHouse/ecpayOrder",
                type : "POST",
                data : JSON.stringify(map),
                contentType : "application/json;charset=utf-8",
                async : false,
                cache : false,
                success : function (ecpayPage){
                    $('#orderForEcpay').append(`${ecpayPage}`);
                },
                error : function (){
                    alert("系統忙碌中，請聯繫我們！")
                }
            })
        }else {
            $('#robotCheck').prop('hidden', false);
        }

    })
});

