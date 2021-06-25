$(function(){
    $('#addFavorite').click(function(){
        $('.maskForFavorite').show();
    });

    $('#cancel').click(function () {
        $('.maskForFavorite').hide();
    });

    $('#editConsole input[type="checkbox"]').click(function () {
        $(this).parent().parent().toggleClass("chosen");
    });

    $('#cancel').click(function () {
        $('.maskForFavorite').hide();
    });

    $('.maskForFavorite').click(function () {
        $(this).hide();
    })

    $('#editConsole').click(function (e) {
        e.stopPropagation();
    });

    $('#addFavorite').click(function(){
        $('.maskForFavorite').show();
    });
});
