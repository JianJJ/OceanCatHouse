
var CatProduct;//購物車 {id:數量}
var c = [];//合計
var sell = [];//售價

//購物車資料
$.ajax({
	url: "/OceanCatHouse/catData",
	type: "get",
	async: false,
	// dataType: "json",
	success: function(json) {
		CatProduct = json;
		var key = Object.keys(json);
		if(key.length == 0){
			$("#f1").text("");
			$("#f1").hide();
		}else{
			$("#f1").show();
			$("#f1").text(key.length);
		}
		// $('.barNav').prepend('<spean class="catNum">' + key.length + '</spean>');
		for (var A in json) {

			//用id找資料
			$.ajax({
				url: "/OceanCatHouse/product/" + A,
				type: "get",
				async: false,
				success: function(product) {
					sell[product.productid] = product.sellingprice;
					c[product.productid] = product.sellingprice * json[product.productid];//合計
					$('.cat').prepend('<div class="catProduct" id="catProduct' + product.productid + '">' +
						'<img src="../images/shop/' + product.productmodel + '-1.jpg" alt="">' +
						'<div class="context"><h3>' + product.productname + '</h3><br>' +
						'<span>商品規格:' + product.productspecifications + '</span></div>' +
						'<div><span class="cash">' + product.sellingprice + '</span>' +
						'<button class="catProductLeftButton" type="button" onclick="cutCat(' + product.productid + ')">-</button>' +
						'<input type="number" name="catProductNum' + product.productid + '" value="' + json[product.productid] + '" class="pnum" id="pnum' + product.productid + '">' +
						'<button class="catProductRightButton" type="button" onclick="addCat(' + product.productid + ')">+</button>' +
						'<span class="total" id="total' + product.productid + '">合計:' + c[product.productid] + '</span></div>' +
						'<button class="del" onclick="delCat(' + product.productid + ')">刪除</button></div>');

				}
				, error: function(json) {
					console.log("err " + json);
					function suc(product, A) {

					}



				}
			})


		}
	}, error: function(json) {
		console.log("err " + json);
	}
})
// 數量按鈕
// $(document).ready(function() {

function rightButton() {
	var i = $(".num").val();
	i++;
	$(".num").val(i);
}
function leftButton() {
	var i = $(".num").val();
	if (i == 1) {
		i = 1;
	} else {
		i--;
	}
	$(".num").val(i);
}
//購物車數量
// 增加數量
function addCat(A) {
	var AAA = JSON.stringify(CatProduct);

	$.ajax({
		url: "/OceanCatHouse/addCat/" + A,
		type: "post",
		contentType: "application/json",
		dataType: "json",
		data: AAA,
		success: function(json) {
			//總價
			var key = Object.keys(json);

			var m = 0;
			for (var k in json) {

				m += json[k] * sell[k];
			}

			$(".PPP").text("總價: $" + m);

		},
		error: function(json) {
			console.log("addCat*****err " + json);
		}
	})
	var i = $("#pnum" + A).val();
	i++;
	$("#pnum" + A).val(i);
	CatProduct[A]++;
	$("#total" + A).text("合計:$ " + CatProduct[A] * sell[A]);//計算合計
}
// 減少數量
function cutCat(A) {
	var i = $("#pnum" + A).val();
	if (i == 1) {
		i = 1;
		CatProduct[A] = 1;
	} else {
		var AAA = JSON.stringify(CatProduct);
		$.ajax({
			url: "/OceanCatHouse/cutCat/" + A,
			type: "post",
			contentType: "application/json",
			dataType: "json",
			data: AAA,
			success: function(json) {
				//總價
				var key = Object.keys(json);
				var m = 0;
				for (var k in json) {

					m += json[k] * sell[k];
				}
				$(".PPP").text("總價: $" + m);



			},
			error: function(json) {
				console.log("cutCat*****err " + json);
			}
		});
		i--;
		CatProduct[A]--;

	}
	$("#pnum" + A).val(i);
	$("#total" + A).text("合計:$ " + CatProduct[A] * sell[A]);//計算合計

}
//購物車刪除

function delCat(id) {
	var AAA = JSON.stringify(CatProduct);
	$.ajax({
		url: "/OceanCatHouse/delCat/"+id ,
		type: "post",
		contentType: "application/json",
		dataType: "json",
		async: false,
		data: AAA,
		success: function(json) {
			var key = Object.keys(json);
			$(".catNum").text(key.length);
			$("#catProduct" + id).remove();
			CatProduct = json;
			//總價
			var m = 0;
			for (var k in json) {
				m += json[k] * sell[k];
			}
			$(".PPP").text("購物車刪除   總價: $" + m);

			if (key.length == 0)
				window.location.assign("${pageContext.request.contextPath}/Details/"+id);
			var key = Object.keys(json);
			if(key.length == 0){
				$("#f1").text("");
				$("#f1").hide();
			}else{
				$("#f1").text(key.length);
				$("#f1").show();
			}
		},
		error: function(json) {
			console.log("delCat*****err " + json);
		}
	})

}
var tt = 0;
//開關購物車  
$('#f1').click(function() {
	$(".hazy").css("visibility", "visible");
	$(".cat").css("visibility", "visible");
});
$('.barNav').click(function() {
	$(".hazy").css("visibility", "visible");
	$(".cat").css("visibility", "visible");
});
$('.catReturn').click(function() {
	$(".hazy").css("visibility", "hidden");
	$(".cat").css("visibility", "hidden");
});


//總價
var key = Object.keys(CatProduct);
var m = 0;
for (var k of key) {
	m += CatProduct[k] * sell[k];
}
$(".PPP").text("總價: $" + m);


$(".catSubmit").click(function() {
	console.log("總價 " + m);
	window.location.href = "/OceanCatHouse/toAddress";
	// window.location.assign("${pageContext.request.contextPath}/Details/${id}");
})

