$(function(){
	
	$('#pay1').click(function(){
		$('#cardPaySection').slideDown();
	});
	
	$('#pay2').click(function(){
		$('#cardPaySection').slideUp();
	});
	
	$('input').keyup(function(e){   
    if($(this).val().length==$(this).attr('maxlength')){   
    $(this).next(':input').focus();   
}
});  
	
	var expireMonthStr = "";
	for(i = 1;i <=12; i++) {
		expireMonthStr = expireMonthStr +" <option value='" + i +"'>" + i + "</option>";
	}
	$('#expireMonth').html(expireMonthStr);
	
	var expireYearStr = "";
	for(i = 21;i <=30; i++) {
		expireYearStr = expireYearStr +" <option value='" + i +"'>" + i + "</option>";
	}
	$('#expireYear').html(expireYearStr);
	
	
var CatProduct = [];
        var sell = [];
        var c = [];//合計
        //讀去cat資料
        $.ajax({
            url: "/recipe/catData",
            type: "get",
            async: false,
            // dataType: "json",
            success: function (json) {
                CatProduct = json;
                var key = Object.keys(json);

                for (var A in json) {

                    //用id找資料
                    $.ajax({
                        url: "/recipe/product/" + A,
                        type: "get",
                        async: false,
                        success: function (product) {
                            sell[product.productid] = product.sellingprice;
                            c[product.productid] = product.sellingprice * json[product.productid];//合計
                            $('.cat').append('<div class="catProduct col-lg-11" id="catProduct' + product.productid + '">' +
                                '<img  src="/recipe/images/shop/' + product.productmodel + '-1.jpg" alt="">' +
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
            window.location.href = "/recipe/views/ShoppingMall";
        }
        var user = '${id}';
        // if (user == 0) {
        //     alert("請先登入");
        //     window.location.href = "/recipe/views/login";
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

  
});

