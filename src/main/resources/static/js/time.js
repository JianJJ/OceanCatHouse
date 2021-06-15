var date = new Date();
var y = date.getFullYear();
var m = date.getMonth();
var month = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"];

//取得這個月有幾天
var d = new Date(y, m + 1, 0);
var newd = d.getDate();
var day = [];
for (let i = 0; i < newd; i++) day[i] = (i + 1) + "號";
var hours = [];
for (let i = 0; i < 24; i++) {
    hours[i] = (i ) + "時";
}
var min = [];
for (let i = 0; i < 60; i++) {
    min[i] = (i + 1) + "分";
}
var sec = [];
for (let i = 0; i < 60; i++) {
    sec[i] = (i + 1) + "秒";
}

var centerDiv = document.getElementById("timeCenter")
centerDiv.innerHTML = String(y);
centerDiv.style.color = "#05f7fc";
//init(數組,名稱",距離);創造標籤
init(month, "month", 100);
setTimeout(function () {
    init(day, "day", 150);
}, 500);
setTimeout(function () {
    init(hours, "hours", 200);
}, 1000);
setTimeout(function () {
    init(min, "min", 250);
}, 1500);
setTimeout(function () {
    init(sec, "sec", 300);
}, 2000);

function init(num, name, distance) {
    for (let i = 0; i < num.length; i++) {
        var temp = document.createElement("div");
        temp.style.color = "#3d7590";
        centerDiv.appendChild(temp);
        temp.classList.add(name);
        temp.innerText = num[i];
    }

    //設定位置
    var label = document.getElementsByClassName(name);
    for (let i = 0; i < label.length; i++) {
        label[i].style.position = "absolute";
        label[i].style.width = "40px";
        // x = cos@
        // y = sin@

        label[i].style.left = distance + 'px';
        label[i].style.top = 0 + 'px';

        var deg = 360 / label.length;//1次偏轉幾度
        setTimeout(function () {
            let x = Math.cos(deg * i * Math.PI / 180) * distance;
            let y = Math.sin(deg * i * Math.PI / 180) * distance;
            label[i].style.transform = 'rotate(' + (deg * i) + 'deg)';
            label[i].style.left = x + 'px';
            label[i].style.top = y + 'px';
        }, 500 / label.length * i);
    }
}

var date = new Date();
var m = date.getMonth();
var d = date.getDate();
var h = date.getHours();
console.log(h);
var Min = date.getMinutes();




//名子,距離,現在日期
runNow("month", 100, m);
runNow("day", 150, d -1);
runNow("hours", 200, h );
runNow("min", 250, Min);
runNow("sec", 300, date.getSeconds() + 5);

function runNow(name, distance, z) {

    setTimeout(function () {
        var label = document.getElementsByClassName(name);
        // var deg = 360 / label.length;//1次偏轉幾度
        label[z].style.color = "#05f7fc";//改變現在顏色
        label[z].style.fontSize = "1.1rem";
        for (let n = 0; n <= z; n++) {
            setTimeout(function () {
                changePosition(label, distance, n)
            }, 2000 / label.length * n)

        }
    }, 2500)
}

//run

setTimeout(function () {

    setInterval(function () {
        let now = new Date();
        let s = now.getSeconds();
        let label = document.getElementsByClassName("sec");
        for (let i = 0; i < label.length; i++) {
            label[i].style.color = "#3d7590";
            label[i].style.fontSize = "1.1rem";
        }
        label[s].style.color = "#05f7fc";
        changePosition(label, 300, s)
        if (s = 1) {
            let now = new Date();
            let Minutes = now.getMinutes();
            let label = document.getElementsByClassName("min");
            for (let i = 0; i < label.length; i++) {
                label[i].style.color ="#3d7590";
                label[i].style.fontSize = "1.1rem";
            }
            label[Minutes].style.color = "#05f7fc";
            changePosition(label, 250, Minutes)
        }

    }, 100)

}, 4500)


function changePosition(label, distance, s) {
    let deg = 360 / label.length;//1次偏轉幾度
    for (let i = 0; i < label.length; i++) {
        let x = Math.cos(deg * (i - s) * Math.PI / 180) * distance;
        let y = Math.sin(deg * (i - s) * Math.PI / 180) * distance;
        label[i].style.transform = 'rotate(' + (deg * (i - s)) + 'deg)';
        label[i].style.left = x + 'px';
        label[i].style.top = y + 'px';
    }
}
