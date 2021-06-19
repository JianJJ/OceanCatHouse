var recTitle = '${recMainBean.recTitle}';
var recipeContext = "";
		
var img = '${recMainBean.recPic}';	
	

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
			
			
			$('#mail').on('click', function(){
				var path =  window.location.href;
	
				recipeContext = '<html><head> <meta charset="UTF-8"></head><body><h3> ' + recTitle +' </h3>' + 
				'<img src="' + img + '" style="width: 309px; height: 220px;">' +
				'<br/>材料：<br/>' + ingrearray + '<br/><a href="'+ path +'">快到✿海貓食屋✿看看'+ recTitle +'的做法吧 ε=ε=ε=ε=ε=┌(°▽°)┘</a></body></html>';
				
				$('#blackMask').fadeIn();
				$('#recipeContext').val(recipeContext);
				$("html").addClass("noscroll");
				
				
			});

})

