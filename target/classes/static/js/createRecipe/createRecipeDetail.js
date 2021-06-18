$(document).ready(function () {
    // 儲存食譜
    doUpload = function (){
        if($('#file-main')[0].files[0]){
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
                if($(`#MaterialName${i+1}`).val()=="" && $(`#UnitNum${i+1}`).val()==""){
                    continue;
                }
                food['MaterialName'] = $(`#MaterialName${i+1}`).val();
                food['UnitNum'] = $(`#UnitNum${i+1}`).val();
                foods[foods.length] = food;
            }
            var recipeDetail = {
                "RecTitle" : $('#RecTitle').val(),
                "RecText"  : $('#RecText').val(),
                "RecNum"   : $('#RecNum').val(),
                "RecTime"  : $('#RecTime').val(),
                "CategoryId" : $('#CategoryId').val(),
                "StepTextArray" : stepText,
                "foodsArrayList" : foods
            }
            formData.append('recipeDetail', JSON.stringify(recipeDetail));

            $.ajax({
                url : '/recipe/createRecipe/save',
                type : 'POST',
                data : formData,
                enctype: 'multipart/form-data',
                processData: false,
                contentType : false,
                async : false,
                cache: false,  //不做快取
                success : function (str){
                    alert(str);
                },
                error : function (returndata){
                    alert(returndata);
                }
            });
        }else {
            alert("請上傳食譜封面");
        }

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
                            <img src="/recipe/images/homePic/uploadstep.png"
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
                            <button type="button" onclick="createStep()">
                                <i class="bi bi-plus-lg" style="font-size: 1.5rem; color: #6c6c71"></i>
                            </button>
                        </div>
                        <div class="col-md-1">
                            <button type="button" onclick="delStep('divId${i}')" id="delbtn${i}">
                                <i class="bi bi-trash" style="font-size: 1.5rem; color: #6c6c71"></i>
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

    for (var i = 0; i < 3; i++) {
        createStep();
    }

    delStep = function (divId) {
        if (stepNum == 1) {
            return;
        }
        $(`#${divId}`).remove();
        // 取刪除之後的元素每一個欄位-1
        var n = parseInt(divId.charAt(divId.length - 1));
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

    // 新增食材欄位, 刪除食材欄位
    var foodNum = 0;
    createFood = function () {
        var i = foodNum + 1;
        var food =
            `<div class="row justify-content-between" style="margin-top: 2px" id="food${i}">
            <div class="col-md-7">
                <div class="input-group">
                    <input type="text" class="form-control MName" placeholder="食材" 
                            name="MaterialName" id="MaterialName${i}">
                </div>
            </div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control MNum" placeholder="份量"
                            name="UnitNum" id="UnitNum${i}">
                </div>
            </div>
            <div class="col-md-1">
                <button type="button" onclick="delFood('food${i}')">
                    <i class="bi bi-trash" style="font-size: 1.5rem; color: #6c6c71"></i>
                </button>
            </div>
        </div>`;
        foodNum == 0?$('#foodStart').after(food):$(`#food${foodNum}`).after(food);
        foodNum++;
    }
    for (var i = 0; i < 2; i++) {
        createFood();
    }
    delFood = function (delfood){
        $(`#${delfood}`).remove();
        foodNum--;
    }
})
