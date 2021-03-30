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


        /* 네비 css */
        #back {
            width: 100%;
            height: auto;
            margin: auto;
            top: 0;
        }

        header {
            position: fixed;
            width: 240px;
            top: 0;
            left: 1200px;
            height: 100%;
            -webkit-transition-duration: 0.2s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.2s;
            transition-timing-function: ease;
            color: black;
            border-left: 3px solid black;
            z-index: 1;
        }

        .down {
            -webkit-transition-duration: 0.2s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.2s;
            transition-timing-function: ease;
        }

        .down #navi {
            -webkit-transition-duration: 0.4s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.4s;
            transition-timing-function: ease;
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
            width: 100%;
        }

        .img {
            position: relative;
            left: 70%;
        }

        /* 반응형 */
        @media (max-width:1920px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 87%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }
        }

        @media (max-width:1650px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 85%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }
        }

        @media (max-width:1440px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 83%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }

        }

        body {
            margin: 0;
            padding: 0;
            height: auto;
            box-sizing: border-box;
            background: white;
            color: black;
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

        /* 가격 및 상세정보div들 */

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

        .detailView label {
            line-height: 50px;
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

        /* 가격 및 상세정보div들 끝*/

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
            background-color: rgb(70, 115, 85);
            border: 1px solid rgb(70, 115, 85);
            font-family: 'GmarketSansBold' !important;
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

        #table {
            display: table;
            width: 98%;
            border-radius: 0.8rem;
            border: 1px solid gray;
        }

        .rows {
            display: table-row;
            height: 70px;

        }

        .cell {
            display: table-cell;
            padding: 3px;
            border-bottom: 1px solid #DDD;
            text-align: center;
            margin: auto;
        }

        .cell input {
            width: 50px;
        }

        .cols1 {
            width: 20%;
        }

        .cols2 {
            width: 20%;
        }

        .cols3 {
            width: 15%;
        }

        #table2 {
            display: table;
            width: 98%;
            border-radius: 0.8rem;

        }

        .rows2 {
            display: table-row;
            height: 70px;
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
    <!-- 혜윤 : 네비 -->
    <header>
        <div class="navi">
            <br><br>
            <p class="center" id="navi-title">삼다도</p>
            <p class="center" id="navi-menu">나만의 길 만들기</p>
            <p class="center" id="navi-menu">전체 제주 관광지 보기</p>
            <p class="center" id="navi-menu">제주도 필수 예약</p>
        </div>
        <div>
            <img class="img" width="50px" height="50px" src="../resources/images/image_main/logo_g.png">
            <p class="right" id="navi-menu">들어가기</p>
            <p class="right" id="navi-menu">회원가입</p>
        </div>
    </header>
    <section id="main-container">
        <!-- 상세페이지 헤더 -->
        <div id="ho_header">
            <div class="title_area">
                <div class="title_area">
                    <img src="../resources/images/image_listpage/premium.png"><br>
                    <label id="ho_title" class="title_tag">서광 승마장</label>
                    <br>
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
                <img class="mainimage" src="../resources/images/image_listpage/tour3.png">
                <div class="other">
                    <img class="otherimage" src="../resources/images/image_listpage/tour3_1.png">
                    <img class="otherimage" src="../resources/images/image_listpage/tour3_2.png">
                    <img class="otherimage" src="../resources/images/image_listpage/tour3_3.png">
                    <img class="otherimage" src="../resources/images/image_listpage/tour3_4.png">

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
            <label><img src="../resources/images/image_listpage/check.png">테라스</label>
            <label><img src="../resources/images/image_listpage/check.png">편의점</label>
            <label><img src="../resources/images/image_listpage/check.png">주차</label><br>

        </div>

        <hr class="boundary">

        <div class="introduce">
            <h2>소개</h2><br>
            <p>
                한라산 초원에서 즐기는 이색승마체험!


                한라산 대초원과 오름을 배경으로 달리는 조랑말 승마!


                단거리부터 긴코스까지 다양한 승마 코스!


                영어 및 일본어 가능.(English possible / 日本語可能
            </p>


        </div>

        <hr class="boundary">

        <div class="detail">
            <div class="imgArea">
                <img src="../resources/images/image_listpage/tour3_5.png" class="detailImg">
            </div>
            <div class="detailView">
                <b>서광 승마장</b><br><br>
                <label>어린이 8000원</label><br>
                <label>청소년 9000원</label><br>
                <label>성인 10000원</label>


            </div>
            <div class="btnArea">
                <br>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    예약하기
                </button>
            </div>

        </div>


        <div class="btnArea">
            <button class="moreBtn">더보기</button>
        </div>

        <!-- 후기 -->
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
                        <label for="startDate">예약날짜</label>
                        <input type="date" id="startDate" name="startDate">
                    </div>
                </div>
                <div class="modal-body2">
                    <h4>2021년 3월 2일</h4>
                    <div id="table">
                        <div class="rows">
                            <span class="cell cols1">성인입장권</span>
                            <span class="cell cols2">10000원</span>
                            <span class="cell cols3"><input type="number">명</span>
                        </div>
                        <div class="rows">
                            <span class="cell cols1">청소년입장권</span>
                            <span class="cell cols2">9000원</span>
                            <span class="cell cols3"><input type="number">명</span>
                        </div>
                        <div class="rows">
                            <span class="cell cols1">어린이입장권</span>
                            <span class="cell cols2">8000원</span>
                            <span class="cell cols3"><input type="number">명</span>
                        </div>
                    </div>
                    <div id="table2">
                        <div class="rows2">
                            <span class="cell cols1">성인입장권</span>
                            <span class="cell cols2">10000원 * 2명</span>
                            <span class="cell cols3">20000원</span>
                        </div>
                        <div class="rows2">
                            <span class="cell cols1">청소년입장권</span>
                            <span class="cell cols2">9000원 * 1명</span>
                            <span class="cell cols3">9000원</span>
                        </div>
                        <div class="rows2">
                            <span class="cell cols1">어린이입장권</span>
                            <span class="cell cols2">8000원 * 1명</span>
                            <span class="cell cols3">8000원</span>
                        </div>
                    </div>
                    <label>총 금액 : 37000원</label>
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