<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길 만들기</title>
 <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6"></script>
    <style>

        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

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
                width: 90%;
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

        #content-title {
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

        #searchbtn {
            background-color: rgb(70, 115, 85);
            border: rgb(70, 115, 85);
            color: white;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            font-weight: 300;
            margin-bottom: 10px;
            margin-left: 90%;
        }

        #map {
            width: 100%;
            margin: auto;
        }
      
    </style>
</head>
<body>
   <jsp:include page="../common/navi.jsp"/>
        <!-- 내용 -->
        <div id="bottom">
            <div id="content">
                <br><br><br>
                <div class="route_title">
                    <img id="content_logo" width="70px" height="70px" src="../resources/images/image_main/logo_g.png"/>
                    &nbsp;
                    <p id="content-title">길 만들기</p>
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
                    <button id="searchbtn">검색하기</button>
                </div>
                <br>
                <div id="map" style="width: 1200px; height:800px;">
                </div>
                <br><br><br>
            </div>
        </div>
        </section>

        <!--은화 : footer-->
        <footer>
            <div id="footer_left">
                <img src="../resources/images/image_footer/footerlogo.png" class="leftImg">
            </div>
            <div id="footer_center">
                <img src="../resources/images/image_footer/Vector.png" class="centerImg"> &nbsp 서울 특별시 강남구 테헤란로14길 6<br><br>
                <img src="../resources/images/image_footer/phone.png" class="centerImg"> &nbsp (064)740-6000 <br><br>
                <img src="../resources/images/image_footer/message.png" class="centerImg"> &nbsp samdado@ijto.co.kr
            </div>
            <div id="footer_right">
                <p id="samdado_news">삼다도 소식</p>
                <img src="../resources/images/image_footer/facebook.png" class="rightImg">
                <img src="../resources/images/image_footer/twitter.png" class="rightImg">
                <img src="../resources/images/image_footer/LinkedIn.png" class="rightImg">
                <img src="../resources/images/image_footer/pininterest.png" class="rightImg">
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
   <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.376073744219326, 126.54506534832129),
			level: 9
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>