<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
	var $j1124 = jQuery.noConflict();
	</script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6"></script>
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
            /* padding-top: 5%; */
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

        #mapBtn {
            position: absolute;
            background-color: white;
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: skyblue;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            padding: 10px 35px;
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

        #bookingBtn {
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
        
        #map {
            margin: auto;
            border-radius: 6px;
        }
		
		#exampleModalLabel{
			font-size: 30px;
			font-weight: bold;
			
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
        
        /* 작은 리뷰박스 클릭 */
    .review-main{
        width: 100%;
        
    }

    .modal-dialog {
        max-width: 60%;
    }

    .review-title{
        justify-content:space-between;
        display: flex;
    }

    .reivew-name{
        margin-top: 25px;
    }

    .review-avg{
        width: 25%;
    }

    .avg-con{
        display: flex;
        float: right;
        width: 100%;
        
    }

    .avg-img{
        position: relative;
    }

    .avg-text{
        position: relative;
        width: 70%;
    }

    .avg-con p{
        margin-top: 10px;
        margin-bottom: 0;
    }

    .review-box{
        display: flex;
        border: 1px solid gray;
        border-radius: 8px;
        padding: 10px 0px;
        margin: 10px 0 10px 0;
    }

    .review-user{
        width: 10%;
        text-align: center;
        margin: auto;
        margin-left: 3%;
    }

    .review-con{
        width: 90%;
        padding-left: 10px;
        margin-left: 5%;
        margin-bottom: 5px;
    }

    p {
        margin: 1rem 0 0 0;
    }
    
    .facLabel{
    	margin-right: 15px
    }
    
    .logo-wrap{
        width: 100%;
        height:100px;
        display:flex;   
        flex-direction: column;
        /* align-items: center; */
        background-color: #467355;
    }
    
    .logo-wrap label {
        font-size: 45px;
        height: 100%;
        color: white;
    }
    
    #small_view_morebtn {
            float: right;
            color:black;
            margin-right: 3%;
            border: 0;
            outline: 0;
            background: none;
        }
    
    </style>

</head>

<body>
    <!-- navi.jsp include -->
    <jsp:include page="../../common/navi.jsp"/>
    
    <section id="main-container">
        <!-- 상세페이지 헤더 -->
        <div id="ho_header">
        	<div class="logo-wrap" id="logo-div">
                <label class="title_img" onclick="location.href='${ contextPath }/main'">
                <img src="../resources/images/image_main/logo_w.png" style="width:100px; height:100px;">삼다도
                </label>
            </div>
            <div class="title_area">
                <div class="title_area">
                	<c:if test="${ tour.bus_classify eq 'P' }">
                    <img src="../resources/images/image_listpage/premium.png"><br>
                    </c:if>
                    <label id="ho_title" class="title_tag">${ tour.bus_name }</label>
                    <br>
                </div>
                <label id="ho_address">
                <c:set var="add" value="${fn:split(tour.bus_address, ',') }"/>
                <c:forEach var="add" items="${add}" varStatus="a">
                <c:if test="${a.count == 2}">주소 : ${add}</c:if>
                </c:forEach>
                </label><br>
                <label>영업시간 : 오픈 ${ tour.bus_opening.substring(0, 5) } ~ 마감 ${ tour.bus_opening.substring(6) }</label>&nbsp;
            </div>
			
            <div id="ho_info">
                <label id="jjim_btn"><img id="jjim" class="jjim_img" src="../resources/images/image_listpage/heart.png">찜하기</label>
                <label id="report_btn" data-bs-toggle="modal" data-bs-target="#reportModal"><img id="report" class="report_img" src="../resources/images/image_listpage/siren.png">신고하기</label>
                <label id="report_btn"><img id="report" class="report_img"
                        src="../resources/images/image_listpage/phone.png">${ tour.bus_phone }</label>
            </div>
        </div>
		
		<!-- 매장사진 -->
        <div class="colsmom">
            <div class="col">
            	<c:forEach var="a" items="${ att }" varStatus="status">
            	<c:if test="${ a.file_lv eq '0' }">
                <img id="bigPic" class="mainimage" src="${ contextPath }/resources/busUploadFiles/${ a.file_rename }">
				</c:if>
				</c:forEach>
                <div class="other">
					<c:forEach var="a" items="${ att }">
                    <img id="smallPic" class="otherimage" src="${ contextPath }/resources/busUploadFiles/${ a.file_rename }">
	                </c:forEach>
                </div>
            </div>
            
            <!-- 매장 사진 클릭 시 변경 스크립트 -->
			<script>
                var bigPic = document.querySelector("#bigPic");
                var smallPic = document.querySelectorAll("#smallPic")

                for(var i = 0; i < smallPic.length; i++){
                    smallPic[i].addEventListener("click", changepic);
                    
                }
                function changepic(){
                    var smallPicAttribute = this.getAttribute("src");
                    bigPic.setAttribute("src", smallPicAttribute);

                }
            </script>

            <div class="col3">
	            <!-- 구글지도 -->
                <div class="col2">
                    <div id="map" style="width: 555px; height:330px;">
                    <button type="button" id="mapBtn" 
                    onclick="window.open('https://map.kakao.com/link/search/${tour.bus_address.substring(6)}','window_name','width=1600,height=1000,location=no,status=no,scrollbars=yes');">길찾기</button>
                    </div>
                </div>
                
                <!-- 구글지도 api -->
                <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  

	            // 지도를 생성합니다    
	            var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	            // 주소-좌표 변환 객체를 생성합니다
	            var geocoder = new kakao.maps.services.Geocoder();
	            
	            var add = "<c:out value='${ tour.bus_address}'/>";
	            var splitadd = add.split(',');
	            

	            
	            // 주소로 좌표를 검색합니다
	            geocoder.addressSearch(splitadd[1], function(result, status) {
	
	                // 정상적으로 검색이 완료됐으면 
	                 if (status === kakao.maps.services.Status.OK) {
	
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	                    // 결과값으로 받은 위치를 마커로 표시합니다
	                    var marker = new kakao.maps.Marker({
	                        map: map,
	                        position: coords
	                    });
	
	                    // 인포윈도우로 장소에 대한 설명을 표시합니다
	                    var infowindow = new kakao.maps.InfoWindow({
	                        content: '<div style="width:150px;text-align:center;padding:6px 0;">${ tour.bus_name }</div>'
	                    });
	                    infowindow.open(map, marker);
	
	                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                    map.setCenter(coords);
	                } 
	            });    
				</script>
				
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
                		<button type="button" id="small_view_morebtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">more...</button>
                    </div>
                    <!-- Modal -->
				    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					    <div class="modal-dialog modal-dialog-centered" style="max-width:60%;">
					        <div class="modal-content" style="width:100%;">
						        <div class="modal-header">
						            <h5 class="modal-title" id="staticBackdropLabel">다녀온 고객 후기</h5>
						            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						        </div>
						        <div class="modal-body">
						            <div class="review-main">
						
						            <!-- 리뷰 상단 -->
						            <div class="review-title">
						                <div class="reivew-name">
						                    <h3>제주호텔 ★★★★</h3>
						                </div>
						                <div class="review-avg">
						                    <div class="avg-con">
						                        <div class="avg-img"></div>
						                        <img src="">
						                        <div class="avg-text">
						                            <p style="font-size: 25px; color: blue;">최고</p>
						                            <p>n개의 후기</p>
						                        </div>
						                    </div>
						                </div>
						            </div>
						
						            <!-- 리뷰 바디 -->
						            <div class="review-body">
						                <div class="review-box">
						                    <div class="review-user"> 
						                        <p>은솔이</p>
						                        <p>2020년 2월</p>
						                    </div>
						                    <div class="review-con">
						                        <img src="" style="width: 300px; height: 300px;">
						                        <p>후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다<br>
						                            후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다</p>
						                    </div>
						                </div>
						                <div class="review-box">
						                    <div class="review-user">
						                        <p>은솔이</p>
						                        <p>2020년 2월</p>
						                    </div>
						                    <div class="review-con">
						                        <img src="" style="width: 300px; height: 300px;">
						                        <p>후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다<br>
						                            후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다</p>
						                    </div>
						                </div>
						                <div class="review-box">
						                    <div class="review-user">
						                        <p>은솔이</p>
						                        <p>2020년 2월</p>
						                    </div>
						                    <div class="review-con">
						                        <img src="" style="width: 300px; height: 300px;">
						                        <p>후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다<br>
						                            후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다후기다</p>
						                    </div>
						                </div>
						            </div>
						            </div>
						        </div>
						        <div class="modal-footer">
						            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						            <button type="button" class="btn btn-primary">전체리뷰보기</button>
						        </div>
					        </div>
					    </div>
				    </div>
                </div>
            </div>
        </div>
        <div class="checktable">
            <h2>주변 편의 시설</h2><br>
			<c:set var="fac" value="${fn:split(tour.pro_fac, ',') }"/>
			<c:forEach var="fac" items="${fac}">
			<c:if test="${ fac eq 'park' }">
            	<label class="facLabel"><img src="../resources/images/image_listpage/check.png">주차장</label>
            </c:if>
            <c:if test="${ fac eq 'com' }">
            	<label class="facLabel"><img src="../resources/images/image_listpage/check.png">편의점</label>
            </c:if>
            <c:if test="${ fac eq 'rest' }">
            	<label class="facLabel"><img src="../resources/images/image_listpage/check.png">휴게시설</label>
            </c:if>
            <c:if test="${ fac eq 'res' }">
            	<label class="facLabel"><img src="../resources/images/image_listpage/check.png">음식점</label>
            </c:if>
			</c:forEach>
        </div>
        

        <hr class="boundary">

		<!-- 매장소개 -->
        <div class="introduce">
            <h2>소개</h2><br>
            <p>${ tour.bus_intro }</p>
        </div>

        <hr class="boundary">

        <div class="detail">
            <div class="imgArea">
            	<c:forEach var="a" items="${ att }">
            	<c:if test="${ a.file_lv eq '0' }">
                <img src="${ contextPath }/resources/busUploadFiles/${ a.file_rename }" class="detailImg">
          		</c:if>
          		</c:forEach>
            </div>
            <div class="detailView" id="detailView">
                <b>상품명 : ${ tour.pro_name }</b><br><br>
                <label id="adult">어른 : ${ tour.pro_adult }원</label><br>
                <label id="youth">청소년 : ${ tour.pro_youth }원</label><br>
                <label id="child">어린이 : ${ tour.pro_child }원</label>
            </div>

            <div class="btnArea">
                <br>
                <button type="button" id="bookingBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    예약하기
                </button>
            </div>
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
        
    </section>
    
    <script>  
    	$j1124.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
    
    	$j1124( function() {
    		$j1124( ".datepicker" ).datepicker();
        } );
        
    </script>

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
                    <!-- 예약날짜-->
                    <div class="start-div">
                        <label for="startDate">예약날짜</label>
                        <input type="text" id="startDate" name="startDate" class="datepicker" onchange="startDate(this)">
                    </div>
                </div>
                <div class="modal-body2">
                	<label><input type="text" id="tourName" style="border:none;width:80px;" readonly value="${ tour.pro_name }"></label><br>
                    <h4 id="startDateResult"></h4>
                    <div id="table">
                        <div class="rows">
                            <span class="cell cols1">성인입장권</span>
                            <span class="cell cols2"> ${ tour.pro_adult }원</span>
                            <span class="cell cols3"><input type="number" id="adultNumber" onchange="adult(this)" value="0" min="0">명</span>
                        </div>
                        <div class="rows">
                            <span class="cell cols1">청소년입장권</span>
                            <span class="cell cols2">${ tour.pro_youth }원</span>
                            <span class="cell cols3"><input type="number" id="youthNumber" onchange="youth(this)" value="0" min="0">명</span>
                        </div>
                        <div class="rows">
                            <span class="cell cols1">어린이입장권</span>
                            <span class="cell cols2">${ tour.pro_child }원</span>
                            <span class="cell cols3"><input type="number" id="childNumber" onchange="child(this)" value="0" min="0">명</span>
                        </div>
                    </div>
                    <div id="table2">
                        <div class="rows2">
                            <span class="cell cols1">성인입장권</span>
                            <span class="cell cols2">${ tour.pro_adult }원 *<span id="adultResult"></span>명</span>
                            <span class="cell cols3"><input type="text" id="adultPay" style="border:none;width:70px" readonly>원</span>
                        </div>
                        <div class="rows2">
                            <span class="cell cols1">청소년입장권</span>
                            <span class="cell cols2">${ tour.pro_youth }원 *<span id="youthResult"></span>명</span>
                            <span class="cell cols3"><input type="text" id="youthPay" style="border:none;width:70px" readonly>원</span>
                        </div>
                        <div class="rows2">
                            <span class="cell cols1">어린이입장권</span>
                            <span class="cell cols2">${ tour.pro_child }원 *<span id="childResult"></span>명</span>
                            <span class="cell cols3"><input type="text" id="childPay" style="border:none;width:70px" readonly>원</span>
                        </div>
                    </div>
                    <label>총 합계 : <input type="text" id="payResult" style="border:none;width:70px" readonly>원</label>
                    <button class="payBtn">결제하기</button>
                </div>

                <div class="modal-footer">
                    <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>

  	$(".payBtn").click(function() {
  		
  		var name = ${ tour.pro_name };
  		var payResult = document.getElementById('payResult').value;
  		var startDate = document.getElementById("startDate").value;
  	    var bookingLv = 2;
  		// var amount = payResult;
  		var amount = 100;
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
	            location.href = '${contextPath}/business/pay?amount='+amount+'&item='+name+'&usno='+${loginUser.usno}
	            				+'&pro_no='+${ tour.pro_no }+'&t_bus_code='+${ tour.bus_code }
	            				+'&t_booking_trv='+startDate+'&bookingLv='+bookingLv+'&t_booking_pay='+amount;
	            				
	        } else {
	            var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
	            console.log(rsp);
	        }
	    
	        alert(msg);
	    });
  	});
    </script>
    
    <script>
	    function startDate(e) {	  	  
	  	  const value = e.value;	  	  
	  	  document.getElementById('startDateResult').innerText
	  	    = value;	
	  	}

	</script>
    
    <script>
	    function adult(e) {	  	  
	  	  const value = e.value;	  	  
	  	  document.getElementById('adultResult').innerText
	  	    = value;
	  	  
		  	var adultPay = ${ tour.pro_adult } * document.getElementById('adultNumber').value;
		  	var youthPay = ${ tour.pro_youth } * document.getElementById('youthNumber').value;
		  	var childPay = ${ tour.pro_child } * document.getElementById('childNumber').value;
	  		document.getElementById('adultPay').value = adultPay;
	  		document.getElementById('youthPay').value = youthPay;
	  		document.getElementById('childPay').value = childPay;
        	document.getElementById('payResult').value = adultPay + youthPay + childPay;
	  	}
	    
	    function youth(e) {
		  	  const value = e.value;		  	  
		  	  document.getElementById('youthResult').innerText
		  	    = value;
		  	  
			  	var adultPay = ${ tour.pro_adult } * document.getElementById('adultNumber').value;
			  	var youthPay = ${ tour.pro_youth } * document.getElementById('youthNumber').value;
			  	var childPay = ${ tour.pro_child } * document.getElementById('childNumber').value;
			  	document.getElementById('adultPay').value = adultPay;
			  	document.getElementById('youthPay').value = youthPay;
			  	document.getElementById('childPay').value = childPay;
			  	document.getElementById('payResult').value = adultPay + youthPay + childPay;
		  	}
	
	    function child(e) {
	    	const value = e.value;	    	  
	    	  document.getElementById('childResult').innerText
	    	    = value;
	    	  
	    	  var adultPay = ${ tour.pro_adult } * document.getElementById('adultNumber').value;
			  var youthPay = ${ tour.pro_youth } * document.getElementById('youthNumber').value;
	    	  var childPay = ${ tour.pro_child } * document.getElementById('childNumber').value;
	    	  document.getElementById('adultPay').value = adultPay;
			  document.getElementById('youthPay').value = youthPay;
	    	  document.getElementById('childPay').value = childPay;
	    	  document.getElementById('payResult').value = adultPay + youthPay + childPay;
	    	}
	
    </script>
    
    <!-- 신고Modal -->
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <img src="../resources/images/image_main/logo_g.png"> <!-- 이미지 경로 이동하기 -->
            <h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2>
            <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
            </div>
            <form action="${ contextPath }/business/report" id="writeForm" method="post" enctype="multipart/form-data">
            <div class="modal-body">
            
            <input type="hidden" name="rep_res" value="허위매물">
            <input type="hidden" name="usno" value="${ loginUser.usno }">
             <input type="hidden" name="bus_code" value="${ t.bus_code }">
                      
                <!--신고대상-->
                <div class="name_div">
                    <label for="id">신고대상</label>                   
                    <input type="text" id="name" name="bus_name" value="${ t.bus_name }" readonly>
                </div>
                <!--신고사유-->
                <div class="reason_div">
                    <label for="reason">신고사유</label>                    
                    <input type="text" id="reason" name="rep_cont" placeholder="50자 이내로 작성해주세요" required>
                </div>
                <!--파일첨부-->
                <div class="reportimg_div">
                    <label for="reportimg">파일첨부</label>                    
                    <input type="file" id="reportimg" name="uploadFile">
                </div>
                
            </div>
            <div class="modal-footer">                
                <button type="submit" id="reportBtn">신고하기</button>
                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
            </div>
            </form>
        </div>
        </div>
    </div>
	
	<script>
		$(document).ready(function(){
			var adult = '<c:out value="${tour.pro_adult}"/>';
			var youth = '<c:out value="${tour.pro_youth}"/>';
			var child = '<c:out value="${tour.pro_child}"/>';
			
			//console.log(adult);
			
			if(adult == ""){
				var element = document.getElementById("adult");
				// 요소의 콘텐츠를 변경
				$(element).attr('style', 'display:none;');
			}
			if(youth == ""){
				var element = document.getElementById("youth");
				$(element).attr('style', 'display:none;');
			}
			if(child == ""){
				var element = document.getElementById("child");
				$(element).attr('style', 'display:none;');
			}
		});
		
	</script>
	 













    <footer>
          <jsp:include page="../../common/footer.jsp"/>
    </footer>




</body>

</html>