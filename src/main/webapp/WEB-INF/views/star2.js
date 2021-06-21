
    var star = document.getElementById('canvas');
    var x = new Array();
    var y = new Array();
    star.width = window.innerWidth;
    star.height = window.innerHeight;
    var ctx = star.getContext('2d');
    ctx.fillStyle = "white";
    for (var s = 0; s < 500; s++) {
        x[s] = window.innerWidth * Math.random();
        y[s] = window.innerHeight * Math.random();
    }

    function SSS() {
        ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);
        for (var s = 0; s < 500; s++) {
            if (Math.random() < 0.5) {
                ctx.fillStyle = "white";
            } else {
                ctx.fillStyle = "black";
            }
            ctx.fillText("*", x[s], y[s]);

        }
    }

    setInterval(SSS, 500);
    var rainX = new Array();
    var rainY = new Array();
    for (var i = 0; i < 10; i++) {
        rainX[i] = Math.random() * 1000 + 1000;
        rainY[i] = Math.random() * 100;
    }


    function rain() {
        for (var i = 0; i < 9; i++) {
            ctx.save();
            ctx.beginPath();
            var line = ctx.createLinearGradient(rainX[i], rainY[i], rainX[i] - 50, rainY[i] + 50);
            line.addColorStop(0, "black");
            line.addColorStop(0.3, "red");
            line.addColorStop(0.9, "white");
            ctx.strokeStyle = line;
            ctx.moveTo(rainX[i], rainY[i]);
            ctx.lineTo(rainX[i] - 50, rainY[i] + 50);
            ctx.closePath();
            ctx.stroke();
            ctx.restore();
        }
    }


    function move() {
        for (var i = 0; i < 10; i++) {
            ctx.clearRect(rainX[i] - 3, rainY[i] - 3, 50, 50);
            rainX[i] = rainX[i] - 5;
            rainY[i] = rainY[i] + 5;
            rain();
            if (rainY[i] > window.innerHeight) {
                rainY[i] = Math.random() * 300;
                rainX[i] = Math.random() * 2000;
            }
        }
    }

    setInterval(move, 20);
