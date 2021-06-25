$(function(){
    $('#addFavorite').click(function(){
        $('.maskForFavorite').fadeIn();
    });

    $('#cancel').click(function () {
        $('.maskForFavorite').fadeOut();
        $('.mask').fadeOut();
    });

    $('#editConsole input[type="checkbox"]').click(function () {
        $(this).parent().parent().toggleClass("chosen");
    });

    $('#cancel').click(function () {
        $('.maskForFavorite').fadeOut();
        $('.mask').fadeOut();
    });

    $('.maskForFavorite').click(function () {
        $(this).fadeOut();
        $('.mask').fadeOut();
    })

    $('#editConsole').click(function (e) {
        e.stopPropagation();
    });

    $('#addFavorite').click(function(){
        $('.maskForFavorite').fadeIn();
    });
});
