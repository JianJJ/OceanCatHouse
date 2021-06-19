$(document).ready(function (){
    // 變換分類css
    $('#recCategoryList ul > li').click(function() {
        $(this).addClass('current').siblings().removeClass('current');
        var cateTitle = $(this).text();
        $('#recFavoriteList > h4').text(cateTitle);
    })

    // 增加分類
    addCategory = function (){
        var result = prompt("例如：法式料理...");
        if(result){
            $('#FCategory').append(`<li id="${result}"><a href="#">${result}</a></li>`);
            $.ajax({
                url : '/recipe/userBack/addFavoriteCategory/'+result,
                type : "GET",
                async : false,
                cache: false,  //不做快取
                success : function () {

                },
                error : function (returndata){
                    alert("發生錯誤請聯繫我們")
                }
            })
        }

    }
})