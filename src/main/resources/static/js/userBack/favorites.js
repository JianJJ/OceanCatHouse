$(document).ready(function (){
    // 變換分類css
    $('#recCategoryList ul > li').click(function() {
        $(this).addClass('current').siblings().removeClass('current');
        var cateTitle = $(this).text();
        $('#recFavoriteList > h4').text(cateTitle);
    })

})