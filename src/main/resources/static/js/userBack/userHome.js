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
            url  : "/OceanCatHouse/userBack/userPicUpload",
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

    // 查看會員發布食譜
    $('input[type=radio][name=RecStatusRadio]').change(function (){
        var status = 1;
        if($('#RecStatus0').prop('checked')){
            status = 0;
        }
        $.ajax({
            url  : "/OceanCatHouse/userBack/selectRecMain",
            type : 'GET',
            async : true,
            cache: false,  //不做快取
            success : function (mainList){
                if(mainList != null){
                    $('.showRecMain').empty();
                    for(var i=0;i<mainList.length;i++){
                        if (mainList[i].recStatus == status){
                            $('.showRecMain').append(
                                `<a href="/OceanCatHouse/createRecipe/select/${mainList[i].recId}">`+
                                `<div class="row justify-content-center">`+
                                `<div class="col-md-4" style="height: 200px;">`+
                                `<img id="${mainList[i].recId}"`+
                                `src="/OceanCatHouse/images/mainpic/${mainList[i].recPic}"`+
                                `style="width: 100%;height: 100%" class="img-thumbnail"`+
                                `alt="">`+
                                `</div>`+
                                `<div class="col-md-8">`+
                                `<h4 class='showLines'>${mainList[i].recTitle}</h4>`+
                                `<p class='showLines'>`+
                                `${mainList[i].recText}`+
                                `</p></div></div></a>`
                            )
                        }
                    }
                }
            },
            error : function (returndata){
                alert("系統忙碌中, 稍後再試")
            }
        })
    }).change();

})
