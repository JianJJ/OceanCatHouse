$(document).ready(function (){
    $('#agree').change(function (){
        if($('#agree').prop('checked') == true){
            $('#StartWriter').prop('disabled', false);
        }else {
            $('#StartWriter').prop('disabled', true);
        }
    })

})