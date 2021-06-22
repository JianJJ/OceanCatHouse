
	

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
    
     $('#blackMask').on('click', function (event) {
		            $('#blackMask').fadeOut();
		            $("html").removeClass("noscroll");

		        });

		        $(".modalSection").click(function(e){
					e.stopPropagation();
				});	

		        $('#closeMask').on('click', function () {
		            $('#blackMask').fadeOut();
		            $("html").removeClass("noscroll");
		            
		        });
			

			
			
			$('.barNav ul>li').eq(2).on("mouseenter mouseleave", function(){
				$('.barNav ul  ol').stop().fadeToggle("fast");});
		
			
		 // + location.pathname +location.search;
			var url = "https://www.oceancat.es/";   		
			var fbUrl = "javascript: void(window.open('http://www.facebook.com/share.php?u=" + url +"'));";
			$('#fbShare').attr("href",fbUrl); 
			
			var lineUrl = "http://line.naver.jp/R/msg/text=" + encodeURI("海貓食屋") + "/?" + url ;
			$('#lineShare').attr("href",lineUrl); 
			
			var twtUrl = "https://twitter.com/share?text=" + encodeURI("海貓食屋") + "&url=" + url;
			$('#twitterShare').attr("href",twtUrl); 

})

