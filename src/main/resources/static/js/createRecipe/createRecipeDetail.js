$(document).ready(function () {
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
                            <img src="/recipe/images/uploadstep.png"
                                 class="img-thumbnail img-step"
                                 id="img-step${i}"/>
                            <input type="file" accept="image/*" id="file-step${i}" name="file"
                                   onchange="upload('#file-step${i}', '#img-step${i}');" class="fileInput"
                                   value=""/>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="row justify-content-between" style="margin: 0px">
                        <div class="col-md-1"><span style="font-size: 32px" id="step${i}">${i}</span></div>
                        <div class="col-md-8"></div>
                        <div class="col-md-1">
                            <button onclick="createStep()">
                                <i class="bi bi-plus-lg" style="font-size: 1.5rem; color: #6c6c71"></i>
                            </button>
                        </div>
                        <div class="col-md-1">
                            <button onclick="delStep('divId${i}')" id="delbtn${i}">
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
        $('#stepStart').append(stepGO);
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
    var frodNum = 0;
    createFrod = function () {
        var i = frodNum + 1;
        var frod =
            `<div class="row justify-content-between" style="margin-top: 2px" id="frod${i}">
            <div class="col-md-7">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="食材">
                </div>
            </div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="份量">
                </div>
            </div>
            <div class="col-md-1">
                <button onclick="delFrod('frod${i}')">
                    <i class="bi bi-trash" style="font-size: 1.5rem; color: #6c6c71"></i>
                </button>
            </div>
        </div>`;
        $('#frodStart').append(frod);
    }
    for (var i = 0; i < 2; i++) {
        createFrod();
    }
    delFrod = function (delfrod){
        $(`#${delfrod}`).remove();
    }
})
