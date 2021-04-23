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

        #small_view_morebtn {
            float: right;
            color:black;
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

        .mainimage{
            width: 100%;
            /* height: 100%; */
            height: 550px;
            border: 1px solid black;
        }

        .other{
            margin-top: 2%;
            display: flex;
        }

        .otherimage{
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
            font-size: 10px;
            font-weight: bold;
            padding: 6px 25px;
            text-decoration: none;
        }

        /* 편의시설 체크div 및 소개 div */

        .checktable{
            margin-top: 5%;
        }

        .introduce {
            width: 80%;
            font-size: 18px;
        }

        .boundary{
            color: black;
        }

        /* 메뉴 리스트 */         

        #firstlist {            
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;

        }

        #secondlist {            
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;

        }
        #thirdlist {
           
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .profile {

            display: flex;
            flex-direction: column;
            /* align-items: center; */
            justify-content: center;
            /* flex: 1; */
            
            width: 500px;
            height: 500px;
            box-sizing: border-box;
        }

        .image {
            width: 350px;
            height: 300px;
        }

        /* 메뉴 리스트끝 */

        .btnArea{
            text-align: center;
        }

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

        #closeBtn, #reportBtn {
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
        
        .modal-content {
            margin: 0;
            width: 100%;
            display: flex;
        }

        .modal-body input {
            width: 100%;
        }

        .modal-content div label {
            line-height: 50px;
        }       

        .modal-body div {
            margin-bottom: 10%;
        }

        .error {
            color: red;
        }

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
    
    #reportImage_container img{
    	width:455px;
    	height:420px;
    }
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
                    <c:if test="${ res.bus_classify eq 'P' }">
                    <img src="../resources/images/image_listpage/premium.png"><br>
                    </c:if>
                    <label id="ho_title" class="title_tag">${ res.bus_name }</label>
                    <br>
                </div>
                <label id="ho_address">${ res.bus_address.substring(6) }</label><br>
                <label>영업시간 : ${ res.bus_opening.substring(0, 5) } ~ ${ res.bus_opening.substring(6) }</label>&nbsp;
            </div>

            <div id="ho_info">
                <label id="jjim_btn">
			        <c:choose>
					    <c:when test="${jjimcheck eq '0' or empty jjimcheck}"> <!-- jjimcheck가 0이면 빈하트-->
					        <img src="../resources/images/image_listpage/noheart.png" 
					             id="btn_like">
					    </c:when>
					    <c:otherwise> <!-- jjimcheck가 1면 빨간 하트-->
					        <img src="../resources/images/image_listpage/heart.png" 
					              id="btn_like">
					    </c:otherwise>
					</c:choose>찜하기</label>
                <label id="report_btn" data-bs-toggle="modal" data-bs-target="#reportModal"><img id="report" class="report_img" src="../resources/images/image_listpage/siren.png">신고하기</label>
                <label><img id="report" class="report_img"
                        src="../resources/images/image_listpage/phone.png">${ res.bus_phone }</label>
            </div>
        </div>
        
        <!-- 찜하기 -->
        <script>
        var bbsidx = ${res.bus_code};
        var useridx = ${loginUser.usno};
         
        var btn_like = document.getElementById("btn_like");
         btn_like.onclick = function(){ changeHeart(); }
         
        /* 찜하기 버튼 눌렀을때 */
         function changeHeart(){ 
             $.ajax({
                    type : "POST",  
                    url : "${ contextPath }/business/jjim",
                    dataType : "json",
                    data : "bbsidx="+bbsidx+"&useridx="+useridx,
                    error : function(){
                        Rnd.alert("통신 에러","error","확인",function(){});
                    },
                    success : function(jdata) {
                        if(jdata.resultCode == -1){
                            Rnd.alert("찜하기 오류","error","확인",function(){});
                        }
                        else{
                            if(jdata.jjimcheck == 1){
                                $("#btn_like").attr("src","../resources/images/image_listpage/heart.png");
                                
                               
                            }
                            else if (jdata.jjimcheck == 0){
                                $("#btn_like").attr("src","../resources/images/image_listpage/noheart.png");
                                
                                
                            }
                        }
                    }
                });
         }
        </script>        

		<!-- 매장사진 -->
        <div class="colsmom">
            <div class="col">
            	<c:forEach var="a" items="${ att }">
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
                    onclick="window.open('https://map.kakao.com/link/search/${res.bus_address.substring(6)}','window_name','width=1600,height=1000,location=no,status=no,scrollbars=yes');">카카오 지도</button>
                    </div>
                </div>
                
                <!-- 구글지도 api -->
                <script>
	             // 이미지 지도에 표시할 마커입니다
	             // 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
	             var markers = [
	                 {
	                     position: new kakao.maps.LatLng(33.450001, 126.570467), 
	                     text: '${res.bus_name}' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	                 }
	             ];
	
	             var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
	                 staticMapOption = { 
	                     center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
	                     level: 3, // 이미지 지도의 확대 레벨
	                     marker: markers // 이미지 지도에 표시할 마커 
	                 };    
	
	             // 이미지 지도를 생성합니다
	             var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
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
						                        <img src="image/평점.png">
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
						            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						            <button type="button" class="btn btn-primary">Understood</button>
						        </div>
					        </div>
					    </div>
				    </div>
            	</div>
            </div>
        </div>
            <hr class="boundary">

			<!-- 매장소개 -->
            <div class="introduce">
                <h2>소개</h2><br>
                <p>${ res.bus_intro }</p>
            </div>

            <hr class="boundary">

            <div class="list">
                <div id="firstlist">
                    <div class='profile'>
                        <img class="image" src="../resources/images/image_listpage/menu1.png">
                    </div>
                    <div class='profile'>
                        <img class="image" src="../resources/images/image_listpage/menu2.png">
                    </div>
                    <div class='profile'>
                        <img class="image" src="../resources/images/image_listpage/menu3.png">                        
                    </div>
                </div>
            </div>
            
            <hr>
            
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
             <input type="hidden" name="bus_code" value="${ res.bus_code }">
                      
                <!--신고대상-->
                <div class="name_div">
                    <label for="id">신고대상</label>                   
                    <input type="text" id="name" name="bus_name" value="${ res.bus_name }" readonly>
                </div>
                <!--신고사유-->
                <div class="reason_div">
                    <label for="reason">신고사유</label>                    
                    <input type="text" id="reason" name="rep_cont" placeholder="50자 이내로 작성해주세요" required>
                </div>
                <!--파일첨부-->
                <div class="reportimg_div">
                    <label for="reportimg">파일첨부</label>                    
                    <input type="file" id="reportimg" name="uploadFile" onchange="setThumbnail(event);">
                    <div id="reportImage_container" style="width:500px; hegiht:500px;"></div>
                </div>
                
            </div>
            <div class="modal-footer">                
                <button type="submit" id="reportBtn" onclick="reportAlert()">신고하기</button>
                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
            </div>
            </form>
        </div>
        </div>
    </div>
    
    <script> 
    	function reportAlert(){ 
    		alert('신고가 완료되었습니다.'); 
    	}
    	
    	function setThumbnail(event) { 
    		var reader = new FileReader(); 
    		reader.onload = function(event) { 
    			var img = document.createElement("img"); 
    			img.setAttribute("src", event.target.result); 
    			document.querySelector("div#reportImage_container").appendChild(img); 
    		}; 
    		reader.readAsDataURL(event.target.files[0]); 
    	}
    	
    </script>



     <footer>
           <jsp:include page="../../common/footer.jsp"/>
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