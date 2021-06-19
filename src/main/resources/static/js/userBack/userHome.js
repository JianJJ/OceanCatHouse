$(document).ready(function () {
    // 設定 點擊照片上傳+換圖片
    upload = function (c) {
        var $c = document.querySelector(c);
        var file = $c.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (e) {
            $('#member-icon').css("background-image", `url(${e.target.result})`);
        };

        var formData = new FormData();
        formData.append('file', $('#file-userPic')[0].files[0]);
        console.log(formData);
        $.ajax({
            url  : "/recipe/userBack/userPicUpload",
            type : 'POST',
            data : formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType : false,
            async : false,
            cache: false,  //不做快取
            success : function (){
                console.log("上傳成功");
            },
            error : function (returndata){
                console.log("上傳失敗");
            }
        })
    };
    
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
})
