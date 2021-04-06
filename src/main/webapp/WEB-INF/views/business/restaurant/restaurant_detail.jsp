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
                    <label id="ho_title" class="title_tag">${ res.bus_name }</label>
                    <br>
                </div>
                <label id="ho_address">${ res.bus_address }</label><br>
                <label>영업시간 : ${ res.bus_opening }</label>&nbsp;
            </div>

            <div id="ho_info">
                <label id="jjim_btn"><img id="jjim" class="jjim_img" src="../resources/images/image_listpage/heart.png">찜하기</label>
                <label id="report_btn"><img id="report" class="report_img" src="../resources/images/image_listpage/siren.png">신고하기</label>
                <label id="report_btn"><img id="report" class="report_img"
                        src="../resources/images/image_listpage/phone.png">${ res.bus_phone }</label>
            </div>
        </div>

		<!-- 매장사진 -->
        <div class="colsmom">
            <div class="col">
                <img id="bigPic" class="mainimage" src="../resources/busUploadFiles/${ res.file_rename }">
                <div class="other">
                	<img id="smallPic" class="otherimage" src="../resources/busUploadFiles/${ res.file_rename }">
                    <img id="smallPic" class="otherimage" src="../resources/images/image_listpage/tour1.png">
                    <img id="smallPic" class="otherimage" src="../resources/images/image_listpage/tour3.png">
                    <img id="smallPic" class="otherimage" src="../resources/images/image_listpage/list9.png">
                    <img id="smallPic" class="otherimage" src="../resources/images/image_listpage/restaurant2_4.png">                   
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
            
            <!-- Optional JavaScript; choose one of the two! -->

            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

            <!-- Option 2: Separate Popper and Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
            
            <div class="col3">
	            <!-- 구글지도 -->
                <div class="col2">
                    <div id="map" style="width: 555px; height:330px;">
                    <button type="button" id="mapBtn" 
                    onclick="window.open('https://map.kakao.com/link/search/${res.bus_name}','window_name','width=1600,height=1000,location=no,status=no,scrollbars=yes');">카카오 지도</button>
					
					<%-- <!-- Modal -->
					class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">${ res.bus_name } 찾아가기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        ...
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
					        <button type="button" class="btn btn-primary">길찾기</button>
					      </div>
					    </div>
					  </div>
					</div> --%>
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
                        <button class="small_view_morebtn">more...</button>
                    </div>
                </div>
            </div>
        </div>
            <hr class="boundary">

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
        </div>
    </section>

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