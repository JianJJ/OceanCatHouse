$(document).ready(function (){
    // 紀錄舊的UFCid, update時如果消失, 則需要刪除
    var oldCid =[];
    var oldCname = {};
    // 變換分類css
    $('#recCategoryList ul > li').click(function() {
        $(this).addClass('current').siblings().removeClass('current');
        var cateTitle = $(this).text();
        $('#recFavoriteList > h4').text(cateTitle);
    })

    // 重新載入分類
    loadC = function(result) {
        var u = "";
        if(result){
            u = '/OceanCatHouse/userBack/addFavoriteCategory/'+ result ;
        }else{
            u = '/OceanCatHouse/userBack/addFavoriteCategory/findAllCategory';
        }
        $.ajax({
            url :  u,
            type : "GET",
            async : false,
            cache: false,  //不做快取
            success : function (data) {
                if(data.length!=0){
                    $('#FCategory li:not(:first-child)').remove();
                    for(var i=0;i<data.length;i++){
                        // 側邊欄 更新
                        $('#FCategory').append(
                            `<li id="${data[i].favoriteCategoryName}"`+
                                `onclick="selectCategory('${data[i].favoriteCategoryName}')">` +
                            `<a href="#">${data[i].favoriteCategoryName}</a></li>`
                        );
                    }
                }else{
                    $('#FCategory li:not(:first-child)').remove();
                }
            },
            error : function (returndata){
                alert("發生錯誤請聯繫我們")
            }
        })
    }

    // 增加分類
    addCategory = function (){
        var result = prompt("例如：法式料理...");
        if(result){
            loadC(result);
        }
    }

    // 觀看 收藏食譜 頁面
    selectCategory = function (name){
        var cName = "";
        if(name){
            cName = $(`#${name}`).prop('id');
        }
        $.ajax({
            url : '/OceanCatHouse/userBack/findAllMain/'+cName,
            type : "GET",
            async : false,
            cache: false,  //不做快取
            success : function (data) {
                if(data.length != 0){
                    // 隱藏"開始收藏"
                    $('#recFavoriteList').prop('hidden', true);
                    $('#RecMainList').prop('hidden', false);
                    $('#countMain').text(`${data.length}`)
                    $('#showMain').empty();
                    var h = "";
                    var img = "";
                    var title = "";
                    for(var i=0;i<data.length;i++){
                        if(data[i].recStatus != 0){
                            h = `/OceanCatHouse/recipeDetails?id=${data[i].recId}`;
                            img = `${data[i].recPic}`;
                            title = `${data[i].recTitle}`;
                        }else {
                            h = "javascript:void(0);";
                            img = "/OceanCatHouse/images/homePic/noshow.png";
                            title = `食譜已被下架...  ${data[i].recTitle}`;
                        }
                        $('#showMain').append(
                            `<li class="col-lg-3 col-xs-6 recipe"><a` +
                                ` href="${h}">` +
                                `<img src="${img}" style="height:217px;" alt="${data[i].recTitle}">`+
                                    `<h4 class='showLines'>${title}</h4>`+
                                    `<p class='showLines'>${data[i].recText}</p>`+
                            `</a></li>`
                        );
                    };
                }else{
                    $('#countMain').text(`${data.length}`)
                    $('#showMain>li').remove();
                    // 沒有資料, 顯示"開始收藏"
                    $('#recFavoriteList').prop('hidden', false);
                    $('.recResult').prop('hidden', true); 
                }
            },
            error : function (returndata){
                alert("系統忙碌中請稍後再試")
            }
        })
    }

    // 點開彈跳視窗
    updateC = function (){
        $('#cover').css('display','block'); //顯示遮罩層
        $('#cover').css('height',document.body.clientHeight); //設定遮罩層的高度為當前頁面高度
        $.ajax({
            url :  '/OceanCatHouse/userBack/addFavoriteCategory/findAllCategory',
            type : "GET",
            async : false,
            cache: false,  //不做快取
            success : function (data) {
                if(data.length!=0){
                    $('#liDiv').empty();
                    oldCid=[];
                    oldCname = {};
                    for(var i=0;i<data.length;i++){
                        // 舊紀錄id, 舊名稱
                        oldCid.push(data[i].favoritesCategoryId + "");
                        oldCname[(data[i].favoritesCategoryId + "")] = data[i].favoriteCategoryName;
                        // 彈跳視窗更新'
                        $('#liDiv').append(
                            `<div class="input-group mb-3 parent">`+
                                `<input type="text" class="form-control inputCname" aria-label="Recipient's username" aria-describedby="button-addon2"`+
                                        `value="${data[i].favoriteCategoryName}" name="${data[i].favoritesCategoryId}" readonly id="nameC${i+1}">`+
                                `<button class="btn btn-outline-secondary iBtn" type="button" id="saveC${i+1}" onclick="saveC(this)" hidden>`+
                                    `<i class="bi bi-check-lg"></i>`+
                                `</button>`+
                                `<button class="btn btn-outline-secondary iBtn" type="button" id="openC${i+1}" onclick="openC(this)">`+
                                    `<i class="bi bi-brush"></i>`+
                                `</button>`+
                                `<button class="btn btn-outline-secondary iBtn" type="button" id="deleteC${i+1}" onclick="deleteRow(this)">`+
                                    `<i class="bi bi-trash"></i>`+
                                `</button>`+
                            `</div>`
                        );
                    }
                    $('#jumpDiv').prop('hidden',false);
                }else{
                    $('#jumpDiv').prop('hidden',false);
                }
            },
            error : function (returndata){
                alert("發生錯誤請聯繫我們");
            }
        })
    }

    // 彈跳視窗的保存編輯
    updateOk = function (){
        $('#cover').css('display','none');   //顯示遮罩層
        $('#jumpDiv').prop('hidden',true);
        // 尋訪每個input的更新
        var fcArray = [];
        var newId = [];
        $('.inputCname').each(function(index, elm){
            var fcObj = {};
            newId.push($(elm).prop('name'));
            fcObj['FCid'] = $(elm).prop('name');
            fcObj['FCname'] = $(elm).val();
            fcArray.push(fcObj);
        });
        var deleteId = [];
        oldCid.forEach(function (value){
            if($.inArray(value, newId) < 0){
                deleteId.push(value);
            }
        })
        var JsonObj = {
            "update" : fcArray,
            "delete" : deleteId,
            "oldCname" : oldCname
        };
        $.ajax({
            url :  '/OceanCatHouse/userBack/addFavoriteCategory/updateAllCategory',
            type : "POST",
            data : JSON.stringify(JsonObj),
            contentType : "application/json;charset=utf-8",
            async : true,
            cache: false,  //不做快取
            success : function () {
                loadC();
            },
            error : function (returndata){
                alert("發生錯誤請聯繫我們");
            }
        })
    }

    // 單個類別的開啟編輯
    openC = function (oBtn){
        $(oBtn).siblings('input').prop('readOnly', false);
        $(oBtn).prev('button').prop('hidden', false);
        $(oBtn).prop('hidden', true);
    }

    // 單個類別的儲存按鈕
    saveC = function (sBtn){
        $(sBtn).siblings('input').prop('readOnly', true);
        $(sBtn).prop('hidden', true);
        $(sBtn).next('button').prop('hidden', false);
        // var CName =  $(sBtn).siblings('input').val();
    }

    // 新增一行類別input
    addRow = function (addBtn){
        var value = $(addBtn).siblings('input').val();
        $(addBtn).siblings('input').val("");
        $('#liDiv').append(
            `<div class="input-group mb-3 parent">`+
                `<input type="text" class="form-control inputCname" aria-label="Recipient's username" aria-describedby="button-addon2"`+
                        `value="${value}" readonly required>`+
                `<button class="btn btn-outline-secondary iBtn" type="button" onclick="saveC(this)" hidden>`+
                    `<i class="bi bi-check-lg"></i>`+
                `</button>`+
                `<button class="btn btn-outline-secondary iBtn" type="button" onclick="openC(this)">`+
                    `<i class="bi bi-brush"></i>`+
                `</button>`+
                `<button class="btn btn-outline-secondary iBtn" type="button" onclick="deleteRow(this)">`+
                    `<i class="bi bi-trash"></i>`+
                `</button>`+
            `</div>`
        );
    }

    // 刪除整列
    deleteRow = function (DBtn){
        if(confirm("確定要刪除這個分類嗎？")){
            $(DBtn).parent('.parent').remove();
        }
    }

    // 取消編輯
    cancel = function (){
        $('#jumpDiv').prop('hidden',true);
        $('#cover').css('display','none');   //顯示遮罩層
    }

    selectCategory();
})