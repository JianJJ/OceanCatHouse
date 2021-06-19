<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
            /* 購物車 */
            .hazy {
                visibility: hidden;
                position:fixed;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 50;

            }

            .cat {
                border: blue 1px solid;
                background-color: white;
                width: 830px;
                /*height: 600px;*/
                z-index: 60;
                position: absolute;
                left: 0%;
                right: 0%;
                margin: auto;
                top: 100px;
                border-radius: 15px;
                visibility: hidden;
            }

            /* 購物車返回 */
            .catReturn {
                top: -10px;
                right: -10px;
                position: absolute;
                background-color: red;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                z-index: 20;
            }

            .cat .foot {
                bottom: 0px;
                position: relative;
                width: 800px;
                height: 50px;

            }

            .cat .foot .PPP {
                position: absolute;
                right: 100px;
                bottom: 10px;
            }

            .cat .foot .catSubmit {
                position: absolute;
                right: 10px;
                bottom: 10px;

            }

            .cat .catProduct {
                position: relative;
                border: #69AE1E 3px solid;
                width: 780px;
                height: 140px;
                margin: 15px;
                border-radius: 15px;
                /*visibility: hidden;*/
            }

            .cat .catProduct img {
                position: absolute;
                width: 140px;
                height: 133px;
                border-radius: 15px;
            }

            .cat .catProduct .del {
                top: 100px;
                position: absolute;
                height: 30px;
                right: 10px;
            }

            /* 文字部分 */
            .cat .catProduct .context {
                position: absolute;
                right: 100px;
                bottom: 10px;
                left: 150px;
                width: 400px;
            }

            .cat .catProduct .cash {
                position: absolute;
                top: 60px;
                right: 210px;
            }

            /* +-按鈕 */
            .cat .catProduct .catProductLeftButton {
                position: absolute;
                width: 20px;
                height: 20px;
                right: 155px;
                z-index: 61;
                top: 60px;
            }

            .cat .catProduct .pnum {
                position: absolute;
                width: 50px;
                text-align: center;
                right: 110px;
                top: 60px;
                height: 20px;
            }

            .cat .catProduct .catProductRightButton {
                position: absolute;
                width: 20px;
                height: 20px;
                right: 110px;
                top: 60px;
            }

            .cat .catProduct .total {
                position: absolute;
                top: 60px;
                right: 10px;
            }



            /* 購物車數量 */
            .catNum {
                cursor: pointer;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                position: absolute;
                z-index: 61;
                color: #000;
                /*top: 6px;*/
                right: -25px;
            }
        </style>

    </head>

    <body>

        <!-- 購物車 -->
        <div class="hazy">

        </div>
        <div class="cat">
            <button class="catReturn">X</button>
            <!-- 這裡有圖 -->

            <div class="foot">
                <span class="PPP">總價:</span>
                <button class="catSubmit">確定</button>
            </div>

        </div>
    </body>

    </html>