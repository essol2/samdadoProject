<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾은 길</title>
 	<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<style>
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

        #map {
            width: 100%;
            position: relative;
            margin-left: 12%;
            z-index: -1;
        }

        .c_border {
            border: 1px solid black;
            width: 75%;
            margin-left: 20%;
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
        
        ._btn {
            background-color: rgb(70, 115, 85);
            border: rgb(70, 115, 85);
            color: white;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            font-weight: 700;
            height: 45px;
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
            font-size: 15px;
            font-weight: 100;
        }
        
       #searchbtn {
            font-weight: 300;
            margin-bottom: 10px;
            margin-left: 88%;
            width: 100px;
            height: 35px;
        }
        
        <!-- 모달 --!>
       /*  .MapSearchbtn {
            background-color: rgba(189, 189, 189, 0.4);
            width: 50px;
            height: 50px;
            border: 0px;
            border-top-right-radius: 50px;
            border-bottom-right-radius: 50px;
            border-top-left-radius: 50px;
            border-bottom-left-radius: 50px;
        } */
        
        /* .srcimg {
            width: 30px;
            height: 30px;
        } */

        .modal-header {
            border: 0px;
        }

        #modal-body {
            /* height: auto; */
            max-height: 420px;
            overflow: auto;
            overflow-x: hidden;
        }

        #search_input {
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;

            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }

        #modal-body input {
            background-image: url(../resources/images/image_route/search.png);
            background-repeat: no-repeat;
            background-size: 30px;
            padding-left: 35px;
        }

        #searchtitle {
            font-size: larger;
            margin: 0px;
        }

        #zzim {
            font-size: 20px;
            margin-left: 10%;
            font-weight: 400;
            margin-bottom: 0%;
        }

        .zzim_list {
            margin-left: 10%;
            margin-right: 10%;
            border-bottom: 1px solid #467355 ;
            margin-top: 3%;
        }

        .zzim_content_title {
            margin-bottom: 0px;
            font-size: 18px;
            font-weight: 600;
        }

        .zzim_content {
            margin-bottom: 0px;
            font-size: 13px;
        }

        #addbtn {
            background-color: white;
            border: 0px;
            margin-left: 65%;
        }
        
</style>
</head>
<body>
<jsp:include page="../common/navi.jsp"/>
		<div id="bottom">
            <div id="content">
                <br><br><br>
                <div class="route_title">
                    <image id="content_logo" width="70px" height="70px" src="../resources/images/image_main/logo_g.png"></image>
                    &nbsp;
                    <p class="content-title">길 만들기</p>
                </div>

                <div id="route_select">
                	<br>
                 	<form id="routeSearchForm" action="${ contextPath }/route/search" method="get">
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold">지역</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="radio" name="area" id="east" value="east" checked>
                		<label for="east">  동부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="west" value="west" checked>
                		<label for="west">  서부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="south" value="south" checked>
                		<label for="south">  남부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="north" value="north" checked>
                		<label for="north">  북부</label>
                		
                		<br>
                		
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold" stype="padding: 10%;">주제</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="radio" name="thema" id="sightseeing" value="sightseeing" checked>
                		<label for="sightseeing">  관광</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="thema" id="break" value="break" checked>
                		<label for="break">  휴식</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="thema" id="beach" value="beach" checked>
                		<label for="beach">  바다</label>
                		
                		<br>
                		
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold">날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="date" name="routeDate" id="routeDate" value="routeDate">
                		
                		<button class="_btn" id="searchbtn">검색하기</button>
                	</form>
                </div>
                <br>
                <div id="map" style="width: 1200px; height:800px;">
                	
                </div>
                <!-- Button trigger modal -->
		    	<button class="MapSearchbtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style=" background-color: rgba(189, 189, 189, 0.4); width: 80px; height: 80px; border: 0px; border-top-right-radius: 50px;  border-bottom-right-radius: 50px; border-top-left-radius: 50px;  border-bottom-left-radius: 50px;" >
		        	<img class="srcimg" src="../resources/images/image_route/search.png">
		    	</button>
    	
                <br><br><br>
                <div id="content_bottom">
                    <table style="width: 100%;">
                        <th style="width: 50%;">
                            <p class="content-title" id="title1" >추천 길</p>
                            <div class="c_border" id="left-border">
                               <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                   <tr>
                                       <td>
                                           <img src="../resources/images/image_route/만장굴 1.png">
                                        </td>
                                        <td>
                                            <div class="spot_border">
                                                <p class="spot_title">만장굴</p>
                                                <button class="spot_btn"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                       <td colspan="2">
                                           <img id="arrow" src="../resources/images/image_route/arrow.png">
                                           <span class="detail">26.8km</span>
                                           <span class="detail">59분</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <img src="../resources/images/image_route/우도 1.png">
                                        </td>
                                        <td>
                                            <div class="spot_border">
                                                <p class="spot_title">우도</p>
                                                <button class="spot_btn"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                       <td colspan="2">
                                           <img id="arrow" src="../resources/images/image_route/arrow.png">
                                           <span class="detail">26.8km</span>
                                           <span class="detail">59분</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <img src="../resources/images/image_route/성산일출봉 1.png">
                                        </td>
                                        <td>
                                            <div class="spot_border">
                                                <p class="spot_title">성산일출봉</p>
                                                <button class="spot_btn"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <img id="arrow" src="../resources/images/image_route/arrow.png">
                                            <span class="detail">26.8km</span>
                                            <span class="detail">59분</span>
                                         </td>
                                     </tr>

                                    <tr>
                                        <td>
                                            <img src="../resources/images/image_route/광치기해변 1.png">
                                        </td>
                                        <td>
                                            <div class="spot_border">
                                                <p class="spot_title">광치기해변</p>
                                                <button class="spot_btn"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <img id="arrow" src="../resources/images/image_route/arrow.png">
                                            <span class="detail">26.8km</span>
                                            <span class="detail">59분</span>
                                         </td>
                                     </tr>

                                    <tr>
                                        <td>
                                            <img src="../resources/images/image_route/섭지코지 1.png">
                                        </td>
                                        <td>
                                            <div class="spot_border">
                                                <p class="spot_title">섭지코지</p>
                                                <button class="spot_btn"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
                                            </div>
                                        </td>
                                    </tr>

                                   <tr><td colspan="2"><p id="navi-menu" style="text-align: center; margin-top: 10%; font-size: 16px;">총 이동 거리 40.1km </p></td></tr>
                                   <tr><td colspan="2"><p id="navi-menu" style="text-align: center; margin-top: -5%; font-size: 16px; margin-bottom: 10%;">예상 이동 시간 83분</p></td></tr>
                                   
                                   <tr>
                                        <td colspan="2"> 
                                            <button class="_btn" id="ch_btn">순서 바꾸기</button>
                                            <button class="_btn" id="add_btn">추가하기</button>
                                        </td>
                                   </tr>
                               </table>
                            </div>     
                        </th>
                        
                        <th style="width: 50%;"> 
                            <div id="content_right" style="width: 100%;">
                                <p class="content-title" id="title2">예상 예산</p>
                                <div class="c1_border" id="right-top-border">
                                    <table style="width=100%">
                                        <tr>
                                            <td id="navi-menu" style="padding: 10px;">&nbsp;만장굴 입장료 (성인) 4,000원</td>
                                        </tr>
                                        <tr> 
                                            <td id="navi-menu" style="text-align: right; padding: 10px;" >총 4,000원&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
							</div>
                               
                                <br>
                                
                                <p class="content-title" id="title3">삼다수 님을 위한 <br> 삼다도의 추천 숙박</p>
                                <div class="c1_border" id="right-middle-border">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
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
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
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

                                <button class="_btn" id="morebtn">숙박 더 보러 가기</button>
                                
                                <br><br>
                                <p class="content-title" id="title4">삼다수 님이 찜하신 숙박</p>
                                <div class="c1_border" id="right-bottom-border">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
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
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
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
                        </th>
                    </table>
                    <br><br><br><br><br><br>
                </div>
            </div>
        </div>
        
        <p onclick="location.href='${ contextPath }/route/r_modal'">모달</p>
        
        <!-- 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="border: 0px;">
                    <p id="searchtitle">관광지 검색</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <class class="modal-body" id="modal-body" style="max-height: 420px; overflow: auto; overflow-x: hidden;">
                    <input type="text" id="search_input" placeholder="관광지를 검색하세요.">
                    <br><br>
                    <p id="zzim">삼다수 님이 찜하신 관광지</p>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                        	오라 3동 2250-1
                            <button id="addbtn">
                                <img src="../resources/images/image_route/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="../resources/images/image_route/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="../resources/images/image_route/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="../resources/images/image_route/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    
                </class>
                </div>
            </div>
        </div>
        <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.376073744219326, 126.54506534832129),
			level: 9
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
		<footer>
           <jsp:include page="../common/footer.jsp"/>
        </footer>

</html>