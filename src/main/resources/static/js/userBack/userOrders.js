$(document).ready(function (){
    $('.mask').click(function(){
        $(this).hide();
    })

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
        expireMonthStr = expireMonthStr +" <option value='" + i +"'>" + strI + "</option>";
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

    // 點擊顯示訂單頁
    $('#showOrdersBtn').click(function (){
        $(this).addClass('current').siblings().removeClass('current');
        $('.showOrders').prop('hidden', false);
        $('.showCard').prop('hidden', true);
    }).click();

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
                        if(uccbList[i].useCard == 1){
                            use = "最近一次使用這張卡片";
                        }
                        $('.showCard').append(
                            `<div class="created used" id="${uccbList[i].cardId}" onclick="findCard('${uccbList[i].cardId}')">`+
                                `<img src="/OceanCatHouse/images/homePic/VISA.jpg">`+
                                `<button class='btnDel' onclick="delCard('${uccbList[i].cardId}')">刪除</button>`+
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
    findCard = function (){
        $('.mask').show();
    }

    // 刪除卡片
    delCard = function (CId){
        console.log("delCardId"+CId);
    }
})