
$(function(){
    $('.toUP').click(function(){
        $('html, body').stop().animate( {
            scrollTop: 0
            }, 100)
    });
    
    $(window).scroll(function(){
        if($(document).scrollTop() >= 450){
            $('.toUP').fadeIn(300);
        }
    
        if($(document).scrollTop() < 450){
            $('.toUP').fadeOut(300);
        }
    });

    var index = 0;
    var flag = true;
    var timer = setInterval(function () {
        $('.arrow-r').click();
    }, 3000);



    $('.focusBlock').mouseenter(function () {
        $('.arrow-lef').css({
            'display': 'block'
        });
        $('.arrow-r').css({
            'display': 'block'
        });
        clearInterval(timer);
        timer = null;

    }).mouseleave(function () {
        $('.arrow-lef').css({
            'display': 'none'
        });
        $('.arrow-r').css({
            'display': 'none'
        });
        timer = setInterval(function () {
            $('.arrow-r').click();
        }, 3000);
    })

    for (var i = 0; i < $('.carou').children().length; i++) {
        var li = document.createElement('li');
        li.addEventListener('click', function () {
            $('.blank').children().siblings().removeClass('current');
            $(this).addClass('current');

            index = $(this).index();


            $('.carou').stop().animate({
                left: -$('.focusBlock').outerWidth() * index
            })
        })
        $('.blank').append(li);
    }

    $('.blank').children().eq(0).addClass('current');
    var first = $('.carou').children().eq(0).clone(true);
    $('.carou').append(first);


    $('.arrow-r').click(function () {
        if (flag) {
            flag = false;
            if (index == $('.carou').children().length - 1) {
                $('.carou').css({ left: 0 });
                index = 0;
            }
            index++;
            $('.carou').stop().animate({
                left: -$('.focusBlock').outerWidth() * index
            }, function(){
                flag = true;
            })

            $('.blank').children().siblings().removeClass('current');
            $('.blank').children().eq(index % ($('.blank').children().length)).addClass('current');
            
        }
    });

    $('.arrow-lef').click(function () {
        if (flag) {
            flag = false;

            if (index === 0) {
                index = $('.carou').children().length - 1;
                $('.carou').css({ left: -$('.focusBlock').outerWidth() * index });

            }
            index--;
            $('.carou').stop().animate({
                left: -$('.focusBlock').outerWidth() * index
            }, function(){
                flag = true;
            })

            $('.blank').children().siblings().removeClass('current');
            $('.blank').children().eq(index % ($('.blank').children().length)).addClass('current');
            
        }
    });


})


