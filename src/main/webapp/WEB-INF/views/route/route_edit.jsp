<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<style>

        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

        /* 혜윤 : 네비 css */
        #back {
            width: 100%;
            height: auto;
            margin: auto;
            top: 0;
        }

        header {
            position:fixed;
            width: 240px;
            top: 0;
            left:1200px;
            height:100%;
            -webkit-transition-duration:0.2s;
            -webkit-transition-timing-function:ease;
            transition-duration:0.2s;
            transition-timing-function:ease;
            color: white;
            border-left: 3px solid white;
            z-index: 1;
        }

        .down {
            color: black;
            -webkit-transition-duration:0.2s;
            -webkit-transition-timing-function:ease;
            transition-duration:0.2s;
            transition-timing-function:ease;
            border-left: 3px solid black;
        }

        .down #navi {
            color:black;
            -webkit-transition-duration:0.4s;
            -webkit-transition-timing-function:ease;
            transition-duration:0.4s;
            transition-timing-function:ease;
        }

        #top {
            width: 100%;
            height: auto;
            background-color: black;
        }
        #bottom {
            width: 1440px;
            height: auto;
            display: flex;
        }

        #content {
            width: 90%;
            height: auto;
            /* background-color: rgb(255, 181, 181); */
        }
        .center {
            text-align: center;
        }

        .right {
            text-align: right;
            position: relative;
            right: 10%;
            margin: auto;
        }

        #navi-title {
            font-size: 40px;
            font-weight: bold;
        }

        #navi-menu {
            font-size: 15px;
            font-weight: 500;
        }
        
        .navi {
            height: 600px;
            /* border : 1px solid pink; */
            margin-left: 2%;
            width : 100%;
        }

        .img {
            position: relative;
            left: 70%;
        }

        /* 동영상 css */        
        .wrap{ width:100%; } 

        .content{ position:relative; padding-top:56%; width:100%; } 

        #backgroundGif{ position:absolute; top:0; left:0; width:100%; height:100%; }

        /* 푸터 css */
        footer{
            background-color: rgb(70, 115, 85);
            height : 190px;
        }

        .leftImg{
            margin-left:6%;
            margin-top:20px;
        }

        #footer_center {
            margin-left:30%;
            margin-top:-130px;
            color:white;
        }

        #footer_right{
            margin-left:60%;
            margin-top:-120px;
            color:white;
        }

        .rightImg{
            padding-right: 15px;
        }

        #copyRight{
            color:white;
            margin-left: 40%;
            margin-right : 40%;
            margin-top:10px;
            margin-bottom: 0px;
            opacity: 0.5;
        }

        hr{
            color:white;
        }

        /* 반응형 */
        @media (max-width:1920px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:87%;
                height:100%;
                -webkit-transition-duration:0.2s;
                -webkit-transition-timing-function:ease;
                transition-duration:0.2s;
                transition-timing-function:ease;
                color: white;
                border-left: 3px solid white;
                z-index: 1;
            }

            #bannerBoxLeft{
                width : 43%;
                height : auto;
                display : inline-block;
                margin-left : 5%;
                margin-right : 6%;
            }

            #bannerBoxRight{
                width : 43%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 100%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */               
            }

            #bottom {
                width: 1640px;
                height: auto;
                display: flex;
            }

        }

        @media (max-width:1650px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:85%;
                height:100%;
                -webkit-transition-duration:0.2s;
                -webkit-transition-timing-function:ease;
                transition-duration:0.2s;
                transition-timing-function:ease;
                color: white;
                border-left: 3px solid white;
                z-index: 1;
            }

            #left_side_text {
                max-width: 49%;
                max-height: 800px;
                /* border : 1px solid red; */
                margin-left : 2%;
            }

            #bannerBoxLeft{
                width : 40%;
                height : auto;
                display : inline-block;
                margin-left : 10%;
                margin-right : 4%;
            }

            #bannerBoxRight{
                width : 40%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 90%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
            }
            #bottom {
                width: 1440px;
                height: auto;
                display: flex;
            }

        }

        @media (max-width:1440px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:83%;
                height:100%;
                -webkit-transition-duration:0.2s;
                -webkit-transition-timing-function:ease;
                transition-duration:0.2s;
                transition-timing-function:ease;
                color: white;
                border-left: 3px solid white;
                z-index: 1;
            }

            #left_side_text {
                max-width: 48%;
                max-height: 800px;
                /* border : 1px solid red; */
                margin-left : 3%;
            }

            /* 오른쪽 이미지 영역 전체 */
            #right_side_img {
                max-width: 48%;
                max-height: 800px;
                /* border : 1px solid blue; */
            }

            #bannerBoxLeft{
                width : 46%;
                height : auto;
                display : inline-block;
                margin-left : 3%;
                margin-right : 2%;
            }

            #bannerBoxRight{
                width : 46%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 80%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
            }

            #bottom {
                width: 1440px;
                height: auto;
            }

        }

        .route_title {
            max-width: 48%;
            max-height: 800px;
            margin-left : 10%;
        }

        #content-logo {
            /* display: inline-block; */
            position: relative;
            margin-left: 100px;
        }

        .content-title {
            font-size: 30px;
            color: black;
            display: inline-block;
            position: relative;
        }

        #route_select {
            border: 2px solid black;
            width: 80%;
            position: relative;
            margin: auto;
        }

        #select td {
            padding-left: 10px;
            padding-right: 10px;
            text-align: center;
            width: 80px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .bold {
            font-weight: bold;
            font-size: 18px;
        }

        .tabletr {
            padding-top: 10px;
            padding-bottom: 5px;
        }

        .btn {
            background-color: rgb(70, 115, 85);
            border: rgb(70, 115, 85);
            color: white;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            font-weight: 700;
        }

        #searchbtn {
            margin-bottom: 10px;
            margin-left: 90%;
        }

        #map {
            width: 100%;
            position: relative;
            margin-left: 12%;
        }

        .c_border {
            border: 1px solid black;
            width: 75%;
            margin-left: 10%;
            
        }

        .c1_border {
            border: 1px solid black;
            width: 60%;
            margin-left: 20%;
        }

        #title1, #title2,  #title3,  #title4 {
            margin-left: 20%;
            margin-bottom: -10px;
        }
        
        #morebtn {
            width: 25%;
            margin-left: 37.5%;
            margin-left: 37.5%;
        }

        #left-border {
            /* height: 1650px; */
            height: auto;
            width: 90%;
        }

        .spot_border {
            height: 225px;
            width: 150px;
            border: rgb(70, 115, 85) 3px solid;
        }

        .spot_title {
            margin-top: 10%;
            text-align: center;
            font-weight: bolder;
            font-size: 25px;
        }

        .spot_btn {
            background-color: rgb(255,255,255);
            border: 0px;
            width: 100%;
            margin-top:80%;
        }

        #ch_btn {
            width: 40%;
            margin-left: 8%;
            margin-right: 1%;
        }

        #add_btn {
            width: 40%;
            margin-right: 8%;
            margin-left: 1%;
        }

        #arrow {
            margin-left: 40%;
            margin-top: 2%;
            margin-bottom: 2%;
        }

        .detail {
            font-size: 10px;
            font-weight: 100;
        }

        .spot_chnge {
            height: auto;
            width: 30px;
            margin: auto;
        }

        .up_down {
            background-color: rgb(255,255,255);
            border: 0px;
            padding: 0px;
            margin-left: 20%;
        }

        .parent {
            display: flex;
        }
    </style>
</head>
<body>
    <!-- 혜윤 : 네비 -->
    <div id="back">
        <header>
            <div class="navi">
                <br><br>
                <p class="center" id="navi-title">삼다도</p>
                <p class="center" id="navi-menu">나만의 길 만들기</p>
                <p class="center" id="navi-menu">전체 제주 관광지 보기</p>
                <p class="center" id="navi-menu">제주도 필수 예약</p>
            </div>
            <div>
                <image class="img" width="50px" height="50px" src="image/logo_w.png"></image>
                <p class="right" id="navi-menu">들어가기</p>
                <p class="right" id="navi-menu">회원가입</p>
            </div>
        </header>
        <!-- 한빈 : 동영상 올리기 -->
        <div id="top">
            <div class="wrap">
                <div class="content">
                    <img src="image/samdado.gif" id="backgroundGif">
                </div>
            </div>
        </div>
        <section class="page-start">

        <!-- 내용 -->
        <div id="bottom">
            <div id="content">
                <br><br><br>
                <div class="route_title">
                    <image id="content_logo" width="70px" height="70px" src="image/logo_g.png"></image>
                    &nbsp;
                    <p class="content-title">길 만들기</p>
                </div>

                <div id="route_select">
                    <table id="select">
                        <tr class="tabletr">
                            <br>
                            <td class="bold">지역</td>
                            <td><input type="radio">  동부</td>
                            <td><input type="radio">  서부</td>
                            <td><input type="radio">  남부</td>
                            <td><input type="radio">  북부</td>
                        </tr>
                        <tr class="tabletr">
                            <td class="bold">주제</td>
                            <td><input type="radio">  관광</td>
                            <td><input type="radio">  휴식</td>
                            <td><input type="radio">  바다</td>
                        </tr>
                        <tr class="tabletr">
                            <td class="bold">날짜</td>
                            <td colspan="2"><input type="date"></td>
                        </tr>
                    </table>
                    <button class="btn" id="searchbtn">검색하기</button>
                </div>
                <br>
                <div id="map">
                    <img src="image/map.png">
                </div>
                <br><br><br>
                <div id="content_bottom">
                    <table style="width: 100%;">
                        <th style="width: 50%;">
                            <p class="content-title" id="title1" >추천 길</p>
                            <div class="c_border" id="left-border">
                               <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                   <tr>
                                       <td>
                                           <img src="image/만장굴 1.png">
                                        </td>
                                        <td>
                                            <div class="parent">
                                                <div class="spot_border">
                                                    <p class="spot_title">만장굴</p>
                                                    <button class="spot_btn"><img src="image/trashcan.png">삭제하기</button>
                                                </div>
                                                <div class="spot_chnge">
                                                    <button class="up_down"><img src="image/btn_up.png"></button>
                                                    <br>
                                                    <button class="up_down"><img src="image/btn_down.png"></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                       <td colspan="2">
                                           <img id="arrow" src="image/arrow.png">
                                           <span class="detail">26.8km</span>
                                           <span class="detail">59분</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        
                                        <td>
                                            <img src="image/우도 1.png">
                                        </td>
                                        <td>
                                            <div class="parent">
                                                <div class="spot_border">
                                                    <p class="spot_title">우도</p>
                                                    <button class="spot_btn"><img src="image/trashcan.png">삭제하기</button>
                                                </div>
                                                <div class="spot_chnge">
                                                    <button class="up_down"><img src="image/btn_up.png"></button>
                                                    <br>
                                                    <button class="up_down"><img src="image/btn_down.png"></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                       <td colspan="2">
                                           <img id="arrow" src="image/arrow.png">
                                           <span class="detail">26.8km</span>
                                           <span class="detail">59분</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <img src="image/성산일출봉 1.png">
                                        </td>
                                        <td>
                                            <div class="parent">
                                                <div class="spot_border">
                                                    <p class="spot_title">성산일출봉</p>
                                                    <button class="spot_btn"><img src="image/trashcan.png">삭제하기</button>
                                                </div>
                                                <div class="spot_chnge">
                                                    <button class="up_down"><img src="image/btn_up.png"></button>
                                                    <br>
                                                    <button class="up_down"><img src="image/btn_down.png"></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <img id="arrow" src="image/arrow.png">
                                            <span class="detail">26.8km</span>
                                            <span class="detail">59분</span>
                                         </td>
                                     </tr>

                                    <tr>
                                        <td>
                                            <img src="image/광치기해변 1.png">
                                        </td>
                                        <td>
                                            <div class="parent">
                                                <div class="spot_border">
                                                    <p class="spot_title">광치기해변</p>
                                                    <button class="spot_btn"><img src="image/trashcan.png">삭제하기</button>
                                                </div>
                                                <div class="spot_chnge">
                                                    <button class="up_down"><img src="image/btn_up.png"></button>
                                                    <br>
                                                    <button class="up_down"><img src="image/btn_down.png"></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <img id="arrow" src="image/arrow.png">
                                            <span class="detail">26.8km</span>
                                            <span class="detail">59분</span>
                                         </td>
                                     </tr>

                                    <tr>
                                        <td>
                                            <img src="image/섭지코지 1.png">
                                        </td>
                                        <td>
                                            <div class="parent">
                                                <div class="spot_border">
                                                    <p class="spot_title">섭지코지</p>
                                                    <button class="spot_btn"><img src="image/trashcan.png">삭제하기</button>
                                                </div>
                                                <div class="spot_chnge">
                                                    <button class="up_down"><img src="image/btn_up.png"></button>
                                                    <br>
                                                    <button class="up_down"><img src="image/btn_down.png"></button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                   <tr><td colspan="2"><p id="navi-menu" style="text-align: center; margin-top: 10%; font-size: 16px;">총 이동 거리 40.1km </p></td></tr>
                                   <tr><td colspan="2"><p id="navi-menu" style="text-align: center; margin-top: -5%; font-size: 16px; margin-bottom: 10%;">예상 이동 시간 83분</p></td></tr>
                                   
                                   <tr>
                                        <td colspan="2"> 
                                            <button class="btn" id="ch_btn">순서 바꾸기</button>
                                            <button class="btn" id="add_btn">추가하기</button>
                                        </td>
                                   </tr>
                               </table>
                            </div>     
                        </th>
                        
                        <th style="width: 50%;"> 
                            <div id="content_right" style="width: 100%;">
                                <p class="content-title" id="title2">예상 예산</p>
                                <div class="c1_border" id="right-top-border">
                                    <table width="100%">
                                        <tr>
                                            <td id="navi-menu" style="padding: 10px;">&nbsp;만장굴 입장료 (성인) 4,000원</td>
                                        </tr>
                                        <tr> 
                                            <td id="navi-menu" style="text-align: right; padding: 10px;" >총 4,000원&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                                <br>
                                <p class="content-title" id="title3">삼다수 님을 위한 <br> 삼다도의 추천 숙박</p>
                                <div class="c1_border" id="right-middle-border">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="image/image 50.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu">제주도 좋은 호텔1</td>
                                        </tr>
                                    </table>
                                    <table style="margin: auto; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="image/image 65.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu">제주도 좋은 호텔2</td>
                                        </tr>
                                    </table>
                                </div>
                                <br>

                                <button class="btn" id="morebtn">숙박 더 보러 가기</button>
                                
                                <br><br>
                                <p class="content-title" id="title4">삼다수 님이 찜하신 숙박</p>
                                <div class="c1_border" id="right-bottom-border">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="image/image 50.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu">제주도 좋은 호텔1</td>
                                        </tr>
                                    </table>
                                    <table style="margin: auto; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="image/image 65.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-menu">제주도 좋은 호텔2</td>
                                        </tr>
                                    </table>
                                </div>
                                <br>
                            </div>
                        </th>
                    </table>
                    <br><br><br><br><br><br>
                </div>
            </div>
        </div>
        </section>

        <!--은화 : footer-->
        <footer>
            <div id="footer_left">
                <img src="footerimages/footerlogo.png" class="leftImg">
            </div>
            <div id="footer_center">
                <img src="footerimages/Vector.png" class="centerImg"> &nbsp 서울 특별시 강남구 테헤란로14길 6<br><br>
                <img src="footerimages/phone.png" class="centerImg"> &nbsp (064)740-6000 <br><br>
                <img src="footerimages/message.png" class="centerImg"> &nbsp samdado@ijto.co.kr
            </div>
            <div id="footer_right">
                <p id="samdado_news">삼다도 소식</p>
                <img src="footerimages/facebook.png" class="rightImg">
                <img src="footerimages/twitter.png" class="rightImg">
                <img src="footerimages/LinkedIn.png" class="rightImg">
                <img src="footerimages/pininterest.png" class="rightImg">
            </div>
            <br>
            <br>
            <hr>
            <p id="copyRight" style="font-size: small;">© 2021 Digital Project. Team SAMDASOO</p>
        </footer>
    </div>
    <script>
        $(function(){
            var $header = $('header'); //헤더를 변수에 넣기
            var $page = $('.page-start'); //색상이 변할 부분
            var $window = $(window);
            var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

        $window.resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
            pageOffsetTop = $page.offset().top;
            });

        $window.on('scroll', function(){ //스크롤시
            var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
            $header.toggleClass('down', scrolled); //클래스 토글
            if($window.scrollTop() >= pageOffsetTop) {
                $(".img").attr("src", $("img").attr("src").replace("_w","_g"));
            } else if($window.scrollTop() < pageOffsetTop) {
                $(".img").attr("src", $("img").attr("src").replace("_g","_w"));
            }
            });
        });
    </script>
</body>
</html>