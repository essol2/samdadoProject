<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title>samdado</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        function display() {
            var control = document.getElementById("bussiness_no_div");
            if (control.style.display != 'block') {
                control.style.display = 'block';
            } else {
                control.style.display = 'none'
            }
        }
    </script>
    <style>
        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

        footer {
            background-color: rgb(70, 115, 85);
            height: 190px;
        }

        .leftImg {
            margin-left: 6%;
            margin-top: 20px;
        }

        #footer_center {
            margin-left: 30%;
            margin-top: -130px;
            color: white;
        }

        #footer_right {
            margin-left: 60%;
            margin-top: -120px;
            color: white;
        }

        .rightImg {
            padding-right: 15px;
        }

        #copyRight {
            color: white;
            margin-left: 40%;
            margin-right: 40%;
            margin-top: 10px;
            margin-bottom: 0px;
            opacity: 0.5;
        }

        hr {
            color: white;
        }


        

        /* 컨테이너 */
        #main-container {
            height: 100%;
            width: 85%;
            display: flex;
            flex-direction: column;
            padding-top: 5%;
            padding-left: 6.3%;

        }

        /* 메인사진 위 정보div들 */

        #ho_header div {
            margin-bottom: 1%;
        }

        #ho_title {
            font-size: 28px;
        }

        #ho_grade {
            font-size: 19px;
            color: rgb(212, 71, 46);
        }

        .title_tag {
            margin-bottom: 1%;
        }

        .jjim_img {
            width: 20px;
            height: 20px;
        }

        .report_img {
            width: 30px;
            height: 30px;
        }

        /* 메인사진 위 정보div들 끝 */


        .col {
            float: left;
            display: inline;
            width: 55%;
            height: 100%;
        }

        .col2 {
            width: 555px;
            height: 330px;
            margin-left: 10%;
            margin-bottom: 5%;

        }

        #small_view_area {
            border: 1px solid black;
            border-radius: 13px;
        }

        .small_view {
            margin: 3%;
            margin-top: 0;
        }

		.small_view label{
			line-height: 20px;
		}

        .small_view_btn {
            border: 0;
            outline: 0;
            background: none;
            margin: 3%;
            padding: 0;
            font-size: 25px;
        }

        .small_view_con {
            font-weight: normal;
            margin-left: 3%;
            margin-top: 2px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 90%;
        }

        .small_view_morebtn {
            float: right;
            margin-right: 3%;
            border: 0;
            outline: 0;
            background: none;
        }

        .col3 {
            height: 100%;
            float: left;
            display: inline;
        }

        .mainimage {
            width: 100%;
            /* height: 100%; */
            height: 550px;
        }

        .other {
            margin-top: 2%;
            display: flex;
        }

        .otherimage {
            width: 20%;
            border: 1.2px solid black;
        }

        /* 지도보기 */

        .map {
            width: 100%;
            height: 100%;
        }

        .mapBtn {
            position: absolute;
            background-color: white;
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: skyblue;
            font-family: Arial;
            font-size: 10px;
            font-weight: bold;
            padding: 6px 25px;
            text-decoration: none;
        }

        /* 편의시설 체크div 및 소개 div */

        .checktable {
            margin-top: 5%;
        }

        .introduce {
            width: 80%;
            font-size: 18px;
        }

        .boundary {
            color: black;
        }

        /* 방 세부사진 및 정보div들 */

        .detail {
            border: 1px solid black;
            height: 300px;
            margin-bottom: 2%;
            margin-top: 5%;
            display: flex;
            /* align-items: center; */
            /* justify-content: center; */
        }

        .detailView {
            width: 56%;
        }

        .btnArea {
            text-align: center;
            width: 19%;
            margin: auto;
        }

        .imgArea {
            width: 44%;
        }

        .imgArea img {
            width: 100%;
            height: 100%;
        }

        /* 방 세부사진 및 정보div들 끝*/

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .moreBtn {
            background-color: rgb(70, 115, 85);
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 75px;
            text-decoration: none;
            margin-bottom: 50px;
            font-family: 'GmarketSansBold' !important;

        }

        .btn {
            background-color: rgb(70, 115, 85) !important;
            border: 1px solid rgb(70, 115, 85) !important;
            font-family: 'GmarketSansBold' !important;
        }
        
         #report_btn, #jjim_btn{
        	cursor: pointer;
        }

        /* 후기 */

        .review_writer {
            display: flex;
            margin: 1%;
        }

        .review_writer label {
            margin-right: 1%;
        }

        .reivew {
            border: 1px solid black;
            width: 70%;
            border-radius: 6px;
        }

        .review_img {
            width: 300px;
            height: 200px;
        }

        .review_img_area {
            width: max-content;
            margin-left: 20%;
            margin-top: 2%;
        }

        .review_date_label {
            float: right;
            margin: 1%;
            margin-bottom: 0;
        }



        /* 부트스트랩 모달*/

        .cal_top {
            text-align: center;
            font-size: 30px;
        }

        .cal {
            text-align: center;
        }

        table.calendar {
            border: 1px solid black;
            display: inline-table;
            text-align: left;
        }

        table.calendar td {
            vertical-align: top;
            border: 1px solid skyblue;
            width: 100px;
        }

        #closeBtn {
            border-style: none;
            background-color: white;
        }

        .modal-header {
            padding: 5%;
            margin: auto;
        }

        .modal-header img {
            width: 100px;
            height: 100px;
        }

        .modal-body {
            padding: 10%;
        }

        .modal-body2 {
            padding: 2%;
            text-align: center;
        }

        .modal-book {
            display: flex;
            border: 1px solid gray;
            border-radius: 0.8rem;
            width: 98%;
        }

        .modal-book2 {
            display: flex;
            border-bottom: 1px solid gray;
            border-left: 1px solid gray;
            border-right: 1px solid gray;
            border-radius: 0.8rem;
            width: 98%;
        }

        .people,
        .people2 {
            width: 50%;
            text-align: center;
            margin: auto;
        }



        .checkin,
        .checkout {
            width: 50%;
            text-align: center;
        }

        .checkin {
            border-right: 1px solid black;
        }

        .payBtn {
            background-color: rgb(70, 115, 85);
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: #ffffff;
            font-size: 18px;
            font-weight: bold;
            padding: 6px 55px;
            text-decoration: none;
            margin-top: 30px;
            margin-bottom: 30px;
            font-family: 'GmarketSansBold' !important;
            width: 98%;
        }

        .modal-content {
            margin: 0;
            width: 100%;
            display: flex;
        }

        .modal-body input {
            width: 100%;
        }

        #startDate,
        #endDate {
            border: none;
            border-bottom: 1px solid;
            line-height: 30px;
            display: block;
        }

        .modal-content div label {
            line-height: 50px;
        }

        #startDate:focus,
        #endDate:focus {
            outline: none;
        }

        .modal-body div {
            margin-bottom: 10%;
        }

        .error {
            color: red;
        }

        /* #agreement_label {
            margin-right: 35%;
        }

        #agreement_checkbox {
            margin-left: -118%;
        } */
    </style>

</head>

<body>
   <!-- navi.jsp include -->
    <jsp:include page="../../common/navi.jsp"/>
    
    <section id="main-container">
        <!-- 상세페이지 헤더 -->
        <div id="ho_header">
            <div class="title_area">
                <div class="title_area">
                    <img src="../resources/images/image_listpage/premium.png"><br>
                    <label id="ho_title" class="title_tag">코트야드 바이 메리어드 서귀포시</label>
                    <label id="ho_grade" class="title_tag">4성급</label><br>
                </div>
                <label id="ho_address">제주특별차치도 서귀포시 </label>
            </div>

            <div id="ho_info">
                <label id="jjim_btn"><img id="jjim" class="jjim_img" src="../resources/images/image_listpage/heart.png">찜하기</label>
                <label id="report_btn"><img id="report" class="report_img" src="../resources/images/image_listpage/siren.png">신고하기</label>
                <label id="report_btn"><img id="report" class="report_img"
                        src="../resources/images/image_listpage/phone.png">064-738-7060</label>
            </div>
        </div>

        <div class="colsmom">
            <div class="col">
                <img class="mainimage" src="../resources/images/image_listpage/hotel1.png">
                <div class="other">
                    <img class="otherimage" src="../resources/images/image_listpage/hotel1_1.png">
                    <img class="otherimage" src="../resources/images/image_listpage/hotel1_2.png">
                    <img class="otherimage" src="../resources/images/image_listpage/hotel1_3.png">
                    <img class="otherimage" src="../resources/images/image_listpage/hotel1_4.png">
                    <img class="otherimage" src="../resources/images/image_listpage/hotel1_5.png">

                </div>
            </div>

            <div class="col3">
                <div class="col2">
                    <button class="mapBtn">지도에서 보기</button>
                    <img src="../resources/images/image_listpage/map.png" class="map">
                </div>
                <!-- 작은 리뷰 -->
                <div class="col2" id="small_view_area">
                    <button type="button" class="small_view_btn">후기</button><br>
                    <div class="small_view">
                        <label class="small_view_con">Eunsol</label>
                        <p class="small_view_con">
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지..

                        </p>
                    </div>
                    <div class="small_view">
                        <label class="small_view_con">Eunsol</label><br>
                        <p class="small_view_con">최고의 숙소 상태와 너무너무 친절하신 호스트분까지..</p>
                    </div>
                    <div class="small_view">
                        <label class="small_view_con">Eunsol</label>
                        <p class="small_view_con">
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지
                            최고의 숙소 상태와 너무너무 친절하신 호스트분까지

                        </p>
                        <button class="small_view_morebtn">more...</button>
                    </div>
                </div>

            </div>
        </div>
        <div class="checktable">
            <h2>주요 편의 시설</h2><br>
            <label><img src="../resources/images/image_listpage/check.png">무료 인터넷</label>
            <label><img src="../resources/images/image_listpage/check.png">테라스</label>
            <label><img src="../resources/images/image_listpage/check.png">편의점</label>
            <label><img src="../resources/images/image_listpage/check.png">주차</label><br>
            <label><img src="../resources/images/image_listpage/check.png">TV</label>
            <label><img src="../resources/images/image_listpage/check.png">컴퓨터</label>
            <label><img src="../resources/images/image_listpage/check.png">조식</label>
        </div>

        <hr class="boundary">

        <div class="introduce">
            <h2>소개</h2><br>
            <p>
                안녕하세요^^

                25층에서 속초바다 야경과 함께 즐거운 추억 만드세요.

                문의 사항 있으면 편하게 연락주시기 바랍니다.


                속초 해수욕장 도보5분,외옹치둘레길 도보 5~10분,고속터미널

                도보 7분이마트 도보10분 거리에 위치하고 있습니다.대포항,

                아바이마을, 엑스포먹거리단지, 청초호까지 차로 5분이면


                구경가능합니다.
                산,호수,바다를 한번에 만날 수 있는 속초로

                초대합니다^^


                *인피니티풀은 8월31일까지 운영합니다.

                이용에 참고 바랍니다.

                (이용료 성인 3만원 부가세별도)


                *부대시설 이용 시 별도 비용이 추가 될 수 있습니다.
            </p>


        </div>

        <hr class="boundary">

        <div class="detail">
            <div class="imgArea">
                <img src="../resources/images/image_listpage/room1.png" class="detailImg">
            </div>
            <div class="detailView">
                <b>디럭스 마운틴 패밀리 트윈</b><br><br>
                <label><img src="../resources/images/image_listpage/tiles.png">26.64M</label>
                <label><img src="../resources/images/image_listpage/shower.png">개별 샤워룸</label>
                <label><img src="../resources/images/image_listpage/aircon.png">에어컨</label>
                <label><img src="../resources/images/image_listpage/balcony.png">발코니</label>
                <label><img src="../resources/images/image_listpage/refrigerator.png">냉장고</label>
                <label><img src="../resources/images/image_listpage/breakfast.png">조식</label><br><br>
                <img src="../resources/images/image_listpage/usericon.png">
                <img src="../resources/images/image_listpage/usericon.png">
                <img src="../resources/images/image_listpage/usericon.png">
                <img src="../resources/images/image_listpage/usericon.png"><br><br>
                <label><img src="../resources/images/image_listpage/doublebed.png">더블침대</label>
                <label><img src="../resources/images/image_listpage/singlebed.png">싱글침대</label>


            </div>
            <div class="btnArea">
                <br>
                <b>130,000원</b><br>
                <b>1박당 객실 요금</b><br><br>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    예약하기
                </button>
            </div>

        </div>

        <div class="detail">
            <div class="imgArea">

                <img src="../resources/images/image_listpage/room2.png" class="detailImg">

            </div>


            <div class="detailView">
                <b>디럭스 마운틴 트윈</b><br><br>
                <label><img src="../resources/images/image_listpage/tiles.png">26.64M</label>
                <label><img src="../resources/images/image_listpage/shower.png">개별 샤워룸</label>
                <label><img src="../resources/images/image_listpage/aircon.png">에어컨</label>
                <label><img src="../resources/images/image_listpage/balcony.png">발코니</label>
                <label><img src="../resources/images/image_listpage/refrigerator.png">냉장고</label>
                <label><img src="../resources/images/image_listpage/breakfast.png">조식</label><br><br>
                <img src="../resources/images/image_listpage/usericon.png">
                <img src="../resources/images/image_listpage/usericon.png">
                <img src="../resources/images/image_listpage/usericon.png"><br><br>
                <label><img src="../resources/images/image_listpage/doublebed.png">더블침대</label>



            </div>
            <div class="btnArea">
                <br>
                <b>110,000원</b><br>
                <b>1박당 객실 요금</b><br><br>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                    예약하기
                </button>
            </div>
        </div>

        <div class="detail">
            <div class="imgArea">

                <img src="../resources/images/image_listpage/room3.png" class="detailImg">

            </div>


            <div class="detailView">
                <b>디럭스 마운틴 패밀리 싱글</b><br><br>
                <label><img src="../resources/images/image_listpage/tiles.png">26.64M</label>
                <label><img src="../resources/images/image_listpage/shower.png">개별 샤워룸</label>
                <label><img src="../resources/images/image_listpage/aircon.png">에어컨</label>
                <label><img src="../resources/images/image_listpage/balcony.png">발코니</label>
                <label><img src="../resources/images/image_listpage/refrigerator.png">냉장고</label>
                <label><img src="../resources/images/image_listpage/breakfast.png">조식</label><br><br>
                <img src="../resources/images/image_listpage/usericon.png">
                <img src="../resources/images/image_listpage/usericon.png"><br><br>
                <label><img src="../resources/images/image_listpage/singlebed.png">싱글침대</label>


            </div>
            <div class="btnArea">
                <br>
                <b>90,000원</b><br>
                <b>1박당 객실 요금</b><br><br>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    예약하기
                </button>
            </div>
        </div>
        <div class="btnArea">
            <button class="moreBtn">더보기</button>
        </div>

        <!-- 후기 -->
        <div id="review_area">
            <label>후기</label>&nbsp;&nbsp;<label>★ 4.5(후기 99개)</label><br>
            <div class="review_img_area">
                <img src="../resources/images/image_listpage/tour3.png" class="review_img">
                <img src="../resources/images/image_listpage/tour3.png" class="review_img">
            </div>
            <div class="review_writer">
                <label>Eunsol</label>
                <div class="reivew">
                    <a>최고의 숙소 상태와 너무너무 친절하신 호스트분까지..

                        덕분에 속초 여행 만족도가 10배 상승했습니다!! 침대가

                        푹신하고 방이 조용해서 매일 푹 잠잘 수 있었구요,
                    </a>
                    <label class="review_date_label">2020.04.05</label>
                </div>
            </div>
            <div class="review_img_area">
                <img src="../resources/images/image_listpage/tour3.png" class="review_img">
                <img src="../resources/images/image_listpage/tour3.png" class="review_img">
            </div>
            <div class="review_writer">
                <label>Eunsol</label>
                <div class="reivew">
                    <a>최고의 숙소 상태와 너무너무 친절하신 호스트분까지..

                        덕분에 속초 여행 만족도가 10배 상승했습니다!! 침대가

                        푹신하고 방이 조용해서 매일 푹 잠잘 수 있었구요,
                    </a>
                    <label class="review_date_label">2020.04.05</label>
                </div>
            </div>
            <div class="review_img_area">
                <img src="../resources/images/image_listpage/tour3.png" class="review_img">
                <img src="../resources/images/image_listpage/tour3.png" class="review_img">
            </div>
            <div class="review_writer">
                <label>Eunsol</label>
                <div class="reivew">
                    <a>최고의 숙소 상태와 너무너무 친절하신 호스트분까지..

                        덕분에 속초 여행 만족도가 10배 상승했습니다!! 침대가

                        푹신하고 방이 조용해서 매일 푹 잠잘 수 있었구요,
                        최고의 숙소 상태와 너무너무 친절하신 호스트분까지..

                        덕분에 속초 여행 만족도가 10배 상승했습니다!! 침대가

                        푹신하고 방이 조용해서
                        매일 푹 잠잘 수 있었구요,
                    </a>
                    <label class="review_date_label">2020.04.05</label>
                </div>
            </div>
        </div>
        </div>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="../resources/images/image_main/logo_g.png"> <!-- 이미지 경로 이동하기 -->
                    <h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body">
                    <!--체크인날짜-->
                    <div class="start-div">
                        <label for="startDate">체크인</label>
                        <input type="date" id="startDate" name="startDate" onchange="startDate(this)">
                    </div>

                    <!--체크아웃날짜-->
                    <div class="end-div">
                        <label for="endDate">체크아웃</label>
                        <label id="error" class="error">체크아웃날짜는 체크인날짜 이전 일 수 없습니다.</label>
                        <input type="date" id="endDate" name="endDate" onchange="endDate(this)">
                    </div>
                </div>

                <div class="modal-body2">
                    <label>80,000원 / 박</label><br>
                    <div class="modal-book">
                        <div class="checkin">
                            <label>체크인</label><br>
                            <b id="startDateResult"></b>
                        </div>
                        <div class="checkout">
                            <label>체크아웃</label><br>
                            <b id="endDateResult"></b>
                        </div>
                    </div>
                    <div class="modal-book2">
                        <div class="people">
                            <label>인원 : </label>
                            <label id ="result"></label>                            
                        </div>
                        <div class="people2">
                            <select id="selectBox" onchange="handleOnChange(this)">
                                <option value="0명">인원</option>
                                <option value="1명">1명</option>
                                <option value="2명">2명</option>
                                <option value="3명">3명</option>
                                <option value="4명">4명</option>
                                <option value="5명">5명</option>
                                <option value="6명">6명 이상</option>
                            </select>
                        </div>
                    </div>
                    <label>80,000원 * </label>
                    <label id="travleResult"></label>
                    <br>
                    <b>총 합계 : </b>
                    <b id="payResult"></b>
                    <button class="payBtn">결제하기</button>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	    function startDate(e) {	  	  
	  	  const value = e.value;	  	  
	  	  document.getElementById('startDateResult').innerText
	  	    = value;
	  	}
	    
	    function endDate(e) {
		  	  const value = e.value;		  	  
		  	  document.getElementById('endDateResult').innerText
		  	    = value;
		  	  
		  	}

	    function handleOnChange(e) {
	    	  const value = e.value;	    	  
	    	  document.getElementById('result').innerText
	    	    = value;
	    	}
    </script>
    
    <!-- Modal2 -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="../resources/images/image_main/logo_g.png"> <!-- 이미지 경로 이동하기 -->
                    <h2 class="modal-title" id="exampleModalLabel">안녕.</h2>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body">
                    <!--체크인날짜-->
                    <div class="start-div">
                        <label for="startDate">체크인</label>
                        <input type="date" id="startDate" name="startDate">
                    </div>

                    <!--체크아웃날짜-->
                    <div class="end-div">
                        <label for="endDate">체크아웃</label>
                        <label id="error" class="error">체크아웃날짜는 체크인날짜 이전 일 수 없습니다.</label>
                        <input type="date" id="endDate" name="endDate">
                    </div>
                </div>

                <div class="modal-body2">
                    <label>80,000원 / 박</label><br>
                    <div class="modal-book">
                        <div class="checkin">
                            <label>체크인</label><br>
                            <b>2021.03.02</b>
                        </div>
                        <div class="checkout">
                            <label>체크아웃</label><br>
                            <b>2021.03.09</b>
                        </div>
                    </div>
                    <div class="modal-book2">
                        <div class="people">
                            <label>인원 : </label>
                            <label>2명</label>
                        </div>
                        <div class="people2">
                            <select>
                                <option>인원</option>
                                <option>1명</option>
                                <option>2명</option>
                                <option>3명</option>
                                <option>4명</option>
                                <option>5명</option>
                                <option>6명 이상</option>
                            </select>
                        </div>
                    </div>
                    <label>80,000원 * 8박</label><br>
                    <b>총 합계 : 640,000원</b>
                    <button class="payBtn">결제하기</button>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

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
        
        <script>

  	$("#payBtn").click(function() {
  		
  		var name = $('input[name="cAmount"]:checked').val();
  		
  		var amount = 0;
  		if(name == '3만원 충전'){
  			amount = 300;
  		} else if(name == '6만원 충전'){
  			amount = 200;
  		} else{
  			amount = 100;
  		}
  		
  		console.log(name);
  		
	    var IMP = window.IMP;
	    IMP.init('imp34313892');
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : name,
	        amount : amount,
	        buyer_email : "${loginUser.usemail}",
	        buyer_name : "${loginUser.usname}",
	        buyer_tel : "${loginUser.usphone}",
	        buyer_addr : '',
	        buyer_postcode : ''
	    }, function(rsp) {
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다!';
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            location.href = '${contextPath}/mypage/payment?amount='+amount+'&item='+name+'&usno='+${loginUser.usno};
	        } else {
	            var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
	        }
	    
	        alert(msg);
	    });
  	});
    </script>



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
    -->

</body>

</html>