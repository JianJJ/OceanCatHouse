$(document).ready(function (){
    //------------------------ 下面是訂單js------------------------------
    // 點擊顯示訂單頁
    $('#showOrdersBtn').click(function (){
        $(this).addClass('current').siblings().removeClass('current');
        $('.showOrders').prop('hidden', false);
        $('.showCard').prop('hidden', true);

        $.ajax({
            type: "GET",
            url: "/OceanCatHouse/userBack/selectOrders",
            async: false,
            cache: false,  //不做快取
            success: function (jsonMap) {
                var ordersList = jsonMap.ordersList;
                var orderDetailList = jsonMap.orderDetailList;
                var orderStatusBean = jsonMap.orderStatusBean;
                var productList = jsonMap.productList;
                var userPaymentBean = jsonMap.userPaymentBean;
                if(ordersList!=null){
                    $('#Otable tr:not(:first-child)').remove();
                    for (var i=0;i<ordersList.length;i++){
                        var createDate = `${ordersList[i].ordercreateon}`.slice(0,10);
                        var sum = 0;
                        var price = 0;
                        var quantity = 0;
                        for(var j=0;j<orderDetailList[i].length;j++){
                            price = parseInt(`${orderDetailList[i][j].sellingprice}`);
                            quantity = parseInt(`${orderDetailList[i][j].quantity}`);
                            sum += price * quantity;
                        }
                        $('#Otable').append(
                            `<tr>`+
                            `<td>`+
                            `<img src="/OceanCatHouse/images/shop/${productList[i][0].productmodel}-1.jpg" class='productImg'>`+
                            `<p class='productName'>(${orderDetailList[i].length})${productList[i][0].productname}</p>`+
                            `<a href="/OceanCatHouse/userBack/showDetail/${ordersList[i].orderid}">檢視訂單明細</a>`+
                            `</td>`+
                            `<td class='orderDate'>${createDate}</td>`+
                            `<td>NT$ <span class='OrderPrice'>${sum + 60}</span></td>`+
                            `<td class='payment'>${userPaymentBean[i]["species"]}</td>`+
                            `<td>`+
                            `<span class='orderStatus'>${orderStatusBean[i].statusname}</span>`+
                            `</td></tr>`
                        );
                    }
                }
            },
            error: function (returndata) {
                alert("系統忙碌中, 稍後再試")
            }
        })
    }).click();

    //------------------------ 下面是卡片js------------------------------

    $('#editConsole').click(function(e){
        e.stopPropagation();
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
    $('.contain > section .created').click(function(){
        $(this).siblings().removeClass("used");
        $(this).addClass("used");
    });

    // 點擊顯示全部卡片
    $('#showCardBtn').click(function () {
        $(this).addClass('current').siblings().removeClass('current');
        $('.showOrders').prop('hidden', true);
        $('.showCard').prop('hidden', false);

        $.ajax({
            url  : "/OceanCatHouse/userBack/selectCard",
            type : 'POST',
            async : false,
            cache: false,  //不做快取
            success : function (uccbList){
                if(uccbList != null){
                    $('.showCard div:not(:first-child)').remove();
                    var use = "";
                    for(var i=0;i<uccbList.length;i++){
                        use = "";
                        if(uccbList[i].useCard == 1){
                            use = "最近一次消費使用這張卡片";
                        }
                        $('.showCard').append(
                            `<div class="created used cardDetail" id="${uccbList[i].cardId}">`+
                                `<img src="/OceanCatHouse/images/homePic/VISA.jpg">`+
                                `<button class='btnDel'>刪除</button>`+
                                `<h5>Visa <span>****</span> <span id='cardLastFour'>${uccbList[i].cardNumberP4}</span></h5>`+
                                `<p>過期時間 <span id='expiredDate'>${uccbList[i].expireMonth}/20${uccbList[i].expireYear}</span></p>`+
                                `<p>${use}</p>`+
                            `</div>`
                        );
                    }
                }
            },
            error : function (returndata){
                alert("系統忙碌中, 稍後再試")
            }
        })
    })

    // 點擊顯示單張卡片, 或是新增卡片
    $('.showCard').on('click','div', function (){
        var CardId= $(this).prop('id');
        $('.mask').fadeIn("normal");
        if(CardId != "" && CardId != null){
            $.ajax({
                url  : "/OceanCatHouse/userBack/findCard/"+CardId,
                type : 'POST',
                async : false,
                cache: false,  //不做快取
                success : function (uccb){
                    if(uccb != null){
                        $('#checkCardId').val(`${uccb.cardId}`);
                        $('#userCardName').val(`${uccb.cardName}`);
                        $('#cardNumberP1').val(`${uccb.cardNumberP1}`);
                        $('#cardNumberP2').val(`${uccb.cardNumberP2}`);
                        $('#cardNumberP3').val(`${uccb.cardNumberP3}`);
                        $('#cardNumberP4').val(`${uccb.cardNumberP4}`);
                        $('#expireMonth').val(`${uccb.expireMonth}`);
                        $('#expireYear').val(`${uccb.expireYear}`);
                        $('#checkNumber').val(`${uccb.verificationCode}`);
                    }
                },
                error : function (returndata){
                    alert("系統忙碌中, 稍後再試")
                }
            })
        }
    })

    // 關閉卡片瀏覽
    $('.mask').click(function(){
        $(this).fadeOut("normal");
        $('#checkCardId').val("");
        $('#userCardName').val("");
        $('#cardNumberP1').val("");
        $('#cardNumberP2').val("");
        $('#cardNumberP3').val("");
        $('#cardNumberP4').val("");
        $('#expireMonth').val("");
        $('#expireYear').val("");
        $('#checkNumber').val("");
    })

    // 刪除卡片
    $('.showCard').on('click', 'button', function (e){
        var cardid = $(this).parent('div').prop('id');
        if(confirm("是否要刪除這張卡片呢?")){
            $.ajax({
                url  : "/OceanCatHouse/userBack/delCard/"+cardid,
                type : 'DELETE',
                async : false,
                cache: false,  //不做快取
                success : function (msg){
                    $('#showCardBtn').click();
                },
                error : function (returndata){
                    alert("系統忙碌中, 稍後再試")
                }
            })
        }
        e.stopPropagation();
    })

    // 新增/更新 卡片
    $('#btnSave').on('click', function (){
        var uccb = {
            "cardName" : $('#userCardName').val(),
            "cardNumberP1" : $('#cardNumberP1').val(),
            "cardNumberP2" : $('#cardNumberP2').val(),
            "cardNumberP3" : $('#cardNumberP3').val(),
            "cardNumberP4" : $('#cardNumberP4').val(),
            "expireMonth" : $('#expireMonth').val(),
            "expireYear" : $('#expireYear').val(),
            "verificationCode" : $('#checkNumber').val(),
        };
        if($('#checkCardId').val() != "" && $('#checkCardId').val() != null){
            uccb["cardId"] = $('#checkCardId').val();
        }
        $.ajax({
            type: "POST",
            url: "/OceanCatHouse/userBack/insertCard",
            data: JSON.stringify(uccb),
            contentType : "application/json;charset=utf-8",
            datatype:"json",
            async: false,
            cache: false,  //不做快取
            success : function (msg){
                console.log(msg);
                $('#showCardBtn').click();
                $('.mask').click();
            },
            error : function (returndata){
                alert("系統忙碌中, 稍後再試")
            }
        })
    })

    // 一鍵輸入
    $('#autologin').click(function (){
        $('#userCardName').val("JianJhungJian");
        $('#cardNumberP1').val("5429");
        $('#cardNumberP2').val("0098");
        $('#cardNumberP3').val("4589");
        $('#cardNumberP4').val("9999");
        $('#expireMonth').val("06");
        $('#expireYear').val("29");
        $('#checkNumber').val("168");
    })
})