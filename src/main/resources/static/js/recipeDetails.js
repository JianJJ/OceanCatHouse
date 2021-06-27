$(function () {
    $('.toUP').click(function () {
        $('html, body').stop().animate({
            scrollTop: 0
        }, 100)
    });

    $('#mail').on('click', function () {
        var path = window.location.href;

        recipeContext = '<html><head> <meta charset="UTF-8"></head><body><h3 style="font-size:30px;"> ' + recTitle + ' </h3>' +
            '<img src="' + img + '" style="width: 376px; height: 270px;"><br/>' + content +
            '<br/>材料：<br/>' + ingrearray + '<br/><a href="' + path + '">快到✿海貓食屋✿看看' + recTitle + '的做法吧 ε=ε=ε=ε=ε=┌(°▽°)┘</a></body></html>';

        $('#blackMask').fadeIn();
        $('#recipeContext').val(recipeContext);
        $("html").addClass("noscroll");

    });

    $('#shareLinks').click(function () {
        $('#blackMaskTwo').fadeIn();
    });


    $(window).scroll(function () {
        if ($(document).scrollTop() >= 450) {
            $('.toUP').fadeIn(300);
        }

        if ($(document).scrollTop() < 450) {
            $('.toUP').fadeOut(300);
        }
    });

    $('.mask').on('click', function (event) {
        $(this).fadeOut();
        $("html").removeClass("noscroll");

    });

    $(".modalSection").click(function (e) {
        e.stopPropagation();
    });

    $('.closeMask').on('click', function () {
        $('.mask').fadeOut();
        $("html").removeClass("noscroll");

    });

    $('.barNav ul>li').eq(2).on("mouseenter mouseleave", function () {
        $('.barNav ul  ol').stop().fadeToggle("fast");
    });


    // + location.pathname +location.search;
    var url = window.location.href;
    var fbUrl = "javascript: void(window.open('http://www.facebook.com/share.php?u=" + url + "'));";
    $('#fbShare').attr("href", fbUrl);

    var lineUrl = "http://line.naver.jp/R/msg/text=" + encodeURI("海貓食屋") + "/?" + url;
    $('#lineShare').attr("href", lineUrl);

    var twtUrl = "https://twitter.com/share?text=" + encodeURI("海貓食屋") + "&url=" + url;
    $('#twitterShare').attr("href", twtUrl);

    $('.modalSection textarea').text(url);


    $('.copy_url_a').click(function () {
        var textarea_url = $(this).siblings('.copy_url_input').get(0);

        console.log(textarea_url);

        var currentFocus = document.activeElement;

        textarea_url.select();

        document.execCommand("copy")

        currentFocus.focus();

        alert("連結已經複製好了。");

    });


    $('#addFavorite').click(function () {
        $('#blackMaskThree').show();
    });


});


//加入收藏頁面ajax部分:
function addFavorite(id) {

    var favId = $("input[name='favId']:checked").serialize();

    $.ajax({
        type: "post",
        url: `/OceanCatHouse/recipeDetails?id=${id}`,
        data: favId,
        dataType: 'json',
        transitional: true,
        success: function (status) {
            console.log("成功");
            console.log(favId);
            console.log(status);
        }

    })

    $('.maskForFavorite').fadeOut();
    $('.mask').fadeOut();

}

