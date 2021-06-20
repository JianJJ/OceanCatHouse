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

    // 點擊分類頁面
    selectCategory = function (name){
        var cName = $(`#${name}`).prop('id');
        $.ajax({
            url : '/recipe/userBack/findCategory/'+cName,
            type : "GET",
            async : false,
            cache: false,  //不做快取
            success : function (data) {
                if(data){
                    $('#countMain').text(`${data.length}`)
                    $('#showMain>li').remove();
                    for(var i=0;i<data.length;i++){
                        $('#showMain').append(
                            `<li class="col-lg-3 col-xs-6 recipe"><a` +
                                `href="/recipe/recipeDetails?id=${data[i].recId}">` +
                                `<img src="${data[i].recPic}" alt="${data[i].recTitle}">`+
                                    `<h4 class='showLines'>"${data[i].recTitle}"</h4>`+
                                    `<p class='showLines'>${data[i].recText}</p>`+
                            `</a></li>`
                        );
                    }
                }
            },
            error : function (returndata){
                alert("系統忙碌中請稍後再試")
            }
        })
    }
})