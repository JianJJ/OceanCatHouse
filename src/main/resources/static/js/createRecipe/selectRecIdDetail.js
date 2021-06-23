$(document).ready(function () {
    // 取消編輯
    goBack = function (){
        if(confirm("是否放棄編輯？")){
            $.ajax({
                url : "/OceanCatHouse/createRecipe/goBack",
                type : "GET",
                async : false,
                cache: false,  //不做快取
                success : function (url) {
                    $(location).attr("href", url)
                },
                error : function (returndata){
                    alert("發生錯誤請聯繫我們")
                }
            })
        }
    }

    // 刪除食譜
    deleteRec = function (){
        if(confirm("是否確定下架呢？")){
            var recid = $('#recid').val();
            $.ajax({
                url : '/OceanCatHouse/createRecipe/delete/'+recid,
                type : 'DELETE',
                processData: false,
                contentType : false,
                async : false,
                cache: false,  //不做快取
                success : function (url) {
                    alert("已下架食譜, 即將跳轉頁面。");
                    $(location).attr("href", url)
                },
                error : function (returndata){
                    alert("操作失敗請聯繫我們")
                }
            });
        }
    }
    // 儲存食譜
    doUpload = function (){
        var formData = new FormData();
        // 食譜主圖片
        formData.append('fileMain', $('#file-main')[0].files[0]);
        // 步驟圖片
        // 步驟說明
        var stepText = [];
        for(var i=0;i<$('.fileStep').length;i++){
            if ($(`#file-step${i+1}`)[0].files[0]==null &&  $(`#stepText${i+1}`).val()==""){
                continue;
            }
            formData.append(`file${i}`, $(`#file-step${i+1}`)[0].files[0]);
            stepText[i] = $(`#stepText${i+1}`).val();
        }
        // 食材＋份數
        var foods = [];
        for(var i=0;i<$('.MName').length;i++) {
            var food = {};
            if($(`#MaterialName${i+1}`).val()=="" && $(`#UnitNum${i+1}`).val()==null){
                continue;
            }
            food['MaterialName'] = $(`#MaterialName${i+1}`).val();
            food['UnitNum'] = $(`#UnitNum${i+1}`).val();
            foods[foods.length] = food;
        }
        // 紀錄瀏覽食譜載入圖片的名稱
        var SPicNameArray = [];
        var SPicName = {};
        for(var i=0;i<$('.checkPic').length;i++){
            console.log($(`#SPicName${i+1}`).val());
            if($(`#SPicName${i+1}`)){
                SPicName[`SPicName${i+1}`] = $(`#SPicName${i+1}`).val();
                SPicNameArray[SPicNameArray.length] = SPicName;
            }

        }
        var recipeDetail = {
            "RecTitle" : $('#RecTitle').val(),
            "RecText"  : $('#RecText').val(),
            "RecNum"   : $('#RecNum').val(),
            "RecTime"  : $('#RecTime').val(),
            "CategoryId" : $('#CategoryId').val(),
            "RecTag" : $('#RecTag').val(),
            "RecCal" : $('#RecCal').val(),
            "StepTextArray" : stepText,
            "foodsArrayList" : foods,
            "SPicNameArray" : SPicNameArray
        }
        formData.append('recipeDetail', JSON.stringify(recipeDetail));

        $.ajax({
            url : '/OceanCatHouse/createRecipe/save',
            type : 'POST',
            data : formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType : false,
            async : false,
            cache: false,  //不做快取
            success : function (url){
                alert("發布成功");
                $(location).attr("href", url)
            },
            error : function (returndata){
                alert("發布失敗請聯繫我們")
            }
        });
    }

    // 設定 點擊照片上傳+換圖片
    upload = function (c, d) {
        var $c = document.querySelector(c);
        var $d = document.querySelector(d);
        var file = $c.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (e) {
            $d.setAttribute("src", e.target.result);
        };
    };
    // 執行增加一個食譜步驟
    var stepNum = 0;
    createStep = function () {
        var i = stepNum + 1;
        var stepGO =
            `<div class="row" id="divId${i}">
                <div class="col-md-5">
                    <div class="picstep">
                        <div style="width: 280px;height: 210px; margin:0 auto;">
                            <img src="/OceanCatHouse/images/homePic/uploadstep.png"
                                 class="img-thumbnail img-step"
                                 id="img-step${i}"/>
                            <input type="file" accept="image/*" id="file-step${i}" name="file"
                                   onchange="upload('#file-step${i}', '#img-step${i}');" class="fileInput fileStep"
                                   value=""/>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="row justify-content-between" style="margin: 0px">
                        <div class="col-md-1"><span style="font-size: 32px" id="step${i}">${i}</span></div>
                        <div class="col-md-8"></div>
                        <div class="col-md-1">
                            <button type="button" class="iBtn" onclick="createStep()">
                                <i class="bi bi-plus-lg"></i>
                            </button>
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="iBtn" onclick="delStep('divId${i}')" id="delbtn${i}">
                                <i class="bi bi-trash"></i>
                            </button>
                        </div>
                    </div>
                    <div class="row" style="margin: 0px">
                        <div class="form-group col-md-12">
                            <textarea class="form-control" id="stepText${i}" rows="6"
                                      placeholder="請輸入步驟說明(最多 150 字)"></textarea>
                        </div>
                    </div>
                </div>
            </div>`;
        stepNum == 0?$('#stepStart').after(stepGO):$(`#divId${stepNum}`).after(stepGO);
        stepNum++;
    }

    for (var i = 0; i < $('.stepCol').length; i++) {
        stepNum++
    }
    // 刪除步驟欄位
    delStep = function (divId) {
        if (stepNum == 1) {
            return;
        }
        $(`#${divId}`).remove();
        // 取刪除之後的元素每一個欄位-1
        var n = parseInt(divId.slice(5));
        for (var i = (n + 1); i <= stepNum; i++) {
            $(`#divId${i}`).prop('id', `divId${i - 1}`);
            $(`#img-step${i}`).prop('id', `img-step${i - 1}`);
            $(`#file-step${i}`).attr('onchange', `upload('#file-step${i - 1}', '#img-step${i - 1}')`);
            $(`#file-step${i}`).prop('id', `file-step${i - 1}`);
            $(`#step${i}`).text(i - 1);
            $(`#step${i}`).prop('id', `step${i - 1}`);
            $(`#delbtn${i}`).attr('onclick', `delStep('divId${i - 1}')`);
            $(`#delbtn${i}`).prop('id', `delbtn${i - 1}`);
            $(`#stepText${i}`).prop('id', `stepText${i - 1}`);
        }
        stepNum--;
    }

    // 新增食材欄位
    var foodNum = 0;
    createFood = function () {
        foodNum++;
        var foodRow =
            `<div class="row justify-content-between MName" style="margin-top: 2px" id="food${foodNum}">
                <div class="col-md-7">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="食材" 
                                name="MaterialName" id="MaterialName${foodNum}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="份量"
                                name="UnitNum" id="UnitNum${foodNum}">
                    </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="iBtn" onclick="delFood('food${foodNum}')" id="DFBtn${foodNum}">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
            </div>`;
        // 第一次 增加欄位的位置不同
        foodNum == 1?$('#foodStart').after(foodRow):$(`#food${foodNum-1}`).after(foodRow);

    }


    // 刪除食材欄位
    delFood = function (delfood){
        if(foodNum == 1){
            return;
        }
        $(`#${delfood}`).remove();
        // 取刪除之後的元素每一個欄位-1
        var n = parseInt(delfood.slice(4));
            console.log(n);
            console.log(foodNum);
        for (var i = (n + 1); i <= foodNum; i++) {
            $(`#food${i}`).prop('id', `food${i - 1}`);
            $(`#MaterialName${i}`).prop('id', `MaterialName${i -1}`);
            $(`#UnitNum${i}`).prop('id', `UnitNum${i - 1}`);
            $(`#DFBtn${i}`).attr('onclick', `delFood('food${i - 1}')`);
            $(`#DFBtn${i}`).prop('id', `DFBtn${i - 1}`);
            if($(`SPicName${i}`) != null){
                $(`SPicName${i}`).prop('id', `SPicName${i-1}`);
            }
        }
        foodNum--;
    }
    // 會先依照載入的食譜欄位數量, 設定目前欄位數量
    for (var i = 0; i < $('.MName').length; i++) {
        foodNum++;
    }
})
