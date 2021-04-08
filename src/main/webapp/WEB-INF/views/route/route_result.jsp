<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾은 길</title>
 	<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6&libraries=services,clusterer,drawing"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
	
	<jsp:include page="../common/navi.jsp"/>
	<link rel="stylesheet" href="${ contextPath }/resources/css/route/route_modal.css" type="text/css">
	<link rel="stylesheet" href="${ contextPath }/resources/css/route/route_result.css" type="text/css">
</head>
<body>
		<div id="bottom">
            <div id="content">
                <br><br><br>
                <div class="route_title">
                    <image id="content_logo" width="70px" height="70px" src="../resources/images/image_main/logo_g.png"></image>
                    &nbsp;
                    <label class="content-title">찾은 길</label>
                </div>

                <div id="route_select">
                	<br>
                	<c:if test="${ param.area == 'east' }">
                		<c:set var="check1" value="checked"/>
                	</c:if>
                	<c:if test="${ param.area == 'west' }">
                		<c:set var="check2" value="checked"/>
                	</c:if>
                	<c:if test="${ param.area == 'south' }">
                		<c:set var="check3" value="checked"/>
                	</c:if>
                	<c:if test="${ param.area == 'north' }">
                		<c:set var="check4" value="checked"/>
                	</c:if>
                	
                	<c:if test="${ param.thema == 'sightseeing' }">
                		<c:set var="check5" value="checked"/>
                	</c:if>
                	<c:if test="${ param.thema == 'break' }">
                		<c:set var="check6" value="checked"/>
                	</c:if>
                	<c:if test="${ param.thema == 'beach' }">
                		<c:set var="check7" value="checked"/>
                	</c:if>
                 	<form id="routeSearchForm" action="${ contextPath }/route/search" method="get" onsubmint="return searchForm();">
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold">지역</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="radio" name="area" id="east" value="east" ${ check1 }>
                		<label for="east">  동부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="west" value="west" ${ check2 }>
                		<label for="west">  서부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="south" value="south" ${ check3 }>
                		<label for="south">  남부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="north" value="north" ${ check4 }>
                		<label for="north">  북부</label>
                		
                		<br>
                		
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold" stype="padding: 10%;">주제</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="radio" name="thema" id="sightseeing" value="sightseeing" ${ check5 }>
                		<label for="sightseeing">  관광</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="thema" id="break" value="break" ${ check6 }>
                		<label for="break">  휴식</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="thema" id="beach" value="beach" ${ check7 }>
                		<label for="beach">  바다</label>
                		
                		<br>
                		
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold">날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="date" name="routeDate" id="routeDate" value="${routeDate}">
                		
                		<button class="_btn" id="searchbtn">검색하기</button>
                	</form>
                </div>
                <br>
                
                <div id="map" style="width: 1200px; height:800px;">
                	<button type="button" class="mapSearchbtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="position: relative; z-index: 10; margin-left: 91%; margin-top: 1%;">
        				<img class="srcimg" src="../resources/images/image_route/search.png">
    				</button>
                </div>
                
    	
                <br><br><br>
				<div id="content_bottom">
					<table style="width: 100%;">
						<th style="width: 50%;">
							<label class="content-title" id="title1" >추천 길</label>
							<div class="c_border" id="left-border">
								<table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
									<c:forEach var="r" items="${ list }" varStatus="index">
										<tr>
											<td>
												<img src="${ r.spot_path }${ r.spot_oname }">
											</td>
											<td>
												<div class="spot_border">
													<p class="spot_title">${ r.spot_title }</p>
													<button class="spot_btn"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
												</div>
											</td>
										</tr>
										<c:if test="${ !index.last }">
		                                    <tr>
		                                       <td colspan="2">
		                                           <img id="arrow" src="../resources/images/image_route/arrow.png">
		                                           <span class="detail">26.8km</span>
		                                           <span class="detail">59분</span>
		                                        </td>
		                                    </tr>
	                                    </c:if>
                               </c:forEach>
                                 
                                   <tr><td colspan="2"><p id="navi-content" style="text-align: center; margin-top: 10%; font-size: 16px;">총 이동 거리 40.1km </p></td></tr>
                                   <tr><td colspan="2"><p id="navi-content" style="text-align: center; margin-top: -5%; font-size: 16px; margin-bottom: 10%;">예상 이동 시간 83분</p></td></tr>
                                   
                                   <tr>
                                        <td colspan="2"> 
                                            <button class="_btn" id="ch_btn" onclick="location.href='${ contextPath }/route/changeRoute'">순서 바꾸기</button>
                                            <button class="_btn" id="add_btn">추가하기</button>
                                        </td>
                                   </tr>
                               </table>
                            </div>     
                        </th>
                        
                        <th style="width: 50%;"> 
                            <div id="content_right" style="width: 100%;">
                                <label class="content-title" id="title2">예상 예산</label>
                                <div class="c1_border" id="right-top-border">
                                    <table id="costTable">
                                    	<c:set var="totalPrice" value="0"/>
                                		<c:forEach var="r" items="${ list }">
											<tr>
		                                    	<td id="cost-content">&nbsp;${ r.spot_title } <fmt:formatNumber value="${ r.spot_price }" pattern="#,###"/>원</td>
		                                        <c:set var="totalPrice" value="${ totalPrice + r.spot_price }"/>
		                                    </tr>
                                      	</c:forEach>
                                    	
                                        <tr> 
                                            <td id="cost-content" style="text-align: right;" >총 <fmt:formatNumber value="${ totalPrice }" pattern="#,###"/>원&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
							</div>
                            
                                <br>
                                
                                <c:if test="${ !empty loginUser }">
                                	<label class="content-title" id="title3">${ loginUser.usname } 님을 위한 <br> 삼다도의 추천 숙박</label>
                                </c:if>
                                
                                <c:if test="${ empty loginUser }">
                                	<label class="content-title" id="title3">삼다도의 추천 숙박</label>
                                </c:if>
                                
                                <div class="c1_border" id="right-middle-border">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="${contextPath}/resources/images/image_route/호텔이미지.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content">제주도 좋은 호텔1</td>
                                        </tr>
                                    </table>
                                    <table style="margin: auto; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content">제주도 좋은 호텔2</td>
                                        </tr>
                                    </table>
                                </div>
                                <br>

                                <button class="_btn" id="morebtn" onclick="location.href='${ contextPath }/business/hotel_list'">숙박 더 보러 가기</button>
                                
                                <br><br>
                                <c:if test="${ !empty loginUser }">
                                <label class="content-title" id="title4">${ loginUser.usname } 님이 찜하신 숙박</label>
                                <div class="c1_border" id="right-bottom-border">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content">제주도 좋은 호텔1</td>
                                        </tr>
                                    </table>
                                    <table style="margin: auto; margin-bottom: 10%;">
                                        <tr>
                                            <td><img src="../resources/images/image_route/호텔이미지.png"></td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content" style="padding-top: 10px;">★4.90(후기 99+개)</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content">제주도 좋은 호텔2</td>
                                        </tr>
                                    </table>
                                </div>
                                </c:if>
                                <br>
                        </th>
                    </table>
                    <br><br><br><br><br><br>
                </div>
            </div>
        </div>
        
        <!-- 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="border: 0px;">
                    <p id="searchtitle">관광지 검색</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <class class="_modal-body" id="modal-body" style="max-height: 420px; overflow: auto; overflow-x: hidden;">
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
                    <br>
                </class>
                </div>
            </div>
        </div>
    
    <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.376073744219326, 126.54506534832129),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
		var geocoder = new kakao.maps.services.Geocoder();
		
		var imageSrc = "${ contextPath }/resources/images/image_route/marker.png";
		var imageSize = new kakao.maps.Size(33, 54);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		<c:forEach var="list" items="${list}">
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${list.spot_address}', function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image : markerImage
			        });
	
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${list.spot_title}</div>'
			        });
			       
			       kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			       kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			    
			     function makeOverListener(map, marker, infowindow) {
			    	    return function() {
			    	        infowindow.open(map, marker);
			    	    };
			    	}

			    	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			    	function makeOutListener(infowindow) {
			    	    return function() {
			    	        infowindow.close();
			    	    };
			    	}
			});    
		</c:forEach>

	</script>
</body>
		<footer>
           <jsp:include page="../common/footer.jsp"/>
        </footer>

</html>