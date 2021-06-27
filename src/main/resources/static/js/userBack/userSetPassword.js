$(document).ready(function (){
    // 變更密碼
    changePassword = function (){
        $('#Msg0, #secMsg, #notMsg').prop('hidden', true);
        $('#pwdNow, #pwdNew, #pwdNewAgian').removeClass('is-invalid');

        if($('#pwdNow').val() == ""){
            $('#Msg0').prop("hidden", false);
            $('#pwdNow').addClass('is-invalid');
            return;
        }
        if($('#pwdNew').val() != $('#pwdNewAgian').val() || $('#pwdNew').val()==""){
            $('#secMsg').prop("hidden", false);
            $('#pwdNew').addClass('is-invalid');
            $('#pwdNewAgian').addClass('is-invalid');
            return;
        }
        var list = [
            $('#pwdNow').val(),
            $('#pwdNew').val(),
        ];
        $.ajax({
            url : '/OceanCatHouse/userBack/changePassword/'+list[0]+"/"+list[1],
            type : 'PUT',
            data : "",
            async : false,
            cache: false,  //不做快取
            success : function (ok){
                $('#pwdNow, #pwdNew, #pwdNewAgian').val("");
                alert(ok);
            },
            error : function (returndata){
                console.log("失敗");
            }
        })
    }
})