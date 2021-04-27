<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_route</title>
    <!-- 지도 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6&libraries=services,clusterer,drawing"></script>
 <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<style>

    /* 폰트 */
    * {
         font-family: 'Jeju Myeongjo', serif;
    }

	/* 마이페이지 css */
     #back {
        width: 1440px;
        height: 100%;
        /* margin: auto; */
        top: 0;
    }
    
    body{
        background-image: url('${contextPath}/resources/images/image_mp/backgroundImg.png');
        background-size: 100%;
    }
    #topMenu{
      align-items: center;
      width : 98%;
      height : 150px;
      /* border : 1px solid black; */
      position : absolute;
    }
    #countDday{
        /* border : 1px solid pink; */
        display : inline-block;
        position : relative;
        left : 3%;
        width : 15%;
        height : 150px;
        color : white;
        text-align : center;
        font-size: 30px;
        margin-left : 4%;
        margin-top : 5%;
    }
    .menuBox{
        width : 55%;
        height : 150px;
       /*  border : 1px solid blue; */
        display : inline-block;
        position:relative;
        top : -60%;
        left : 3%;
        margin-left : 3%;
        /* margin-top : 1.5%; */
        align-items: center;
    }
    .menuButton{
        width : 155px;
        height : 140px;
        border : 1px solid white;
        background-color: white;
        color : #bfbfbf;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 2%;
        border-radius: 2px;
        align-items: center;
    }

    .menuButton:hover{
        box-shadow: 6px 6px gray;
        cursor: pointer;
    }

    .menuBoxEle{
        /* border : 1px solid red; */
        width : 110px;
        height : 110px;
        text-align: center;
        margin-left : 11%;
        padding : 0;
    }

    .btnImg{
        width: 60px;
        height : 60px;
      /*  border : 1px solid yellow; */
    }

    .clickedBtn{
        box-shadow: 3px 3px gray;
        width : 155px;
        height : 140px;
        border : 1px solid #467355;
        background-color:#467355;
        color : white;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 2%;
        border-radius: 2px;
        align-items: center;
       	
    }

    .clickedBtn:hover{
        box-shadow: 6px 6px gray;
        cursor: pointer;
    }
    /* mainBox */
    #mainBox{
        position : absolute;
        top : 30%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : 600px;
    }s

    #tripTopBox{
        display: flex;
    }

   /*  #mapArea{
        order : 1;
        width : 70%;
        /* border : 1px solid red; 
        margin-right : 0px;
        display : inline-block;
    } */
    
    #map{
    	order : 1;
    	margin : 0px;
    }

    .dotImg{
        /* border : 1px solid pink; */
        margin-top : 3px;
        height : 10px;
        display: inline-block;
    }

    .forLineMath{
        display: inline-block;   
        height : auto;
        /* margin-bottom: 5px; */
        /* border : 1px solid yellowgreen; */
    }

    .tripReservInfoBox{
        background-color: white;
        border : 2px solid #467355;
        width : 101%;
        height: fit-content;
        margin-left : -0.5%;
        margin-top : 1%;
        margin-right : 1%;
        margin-bottom: 1%;
        align-items : center;
    }

    #rinfoText{
        display : block;
        margin-top : 3%;
        margin-left:3%;
    }

    .routesBox{
        display : inline-block;
        /* border : 1px solid blueviolet; */
        width : fit-content;
       /*  margin-left : 3%;
        margin-right : 3%; */
        padding-bottom : 3%;
        align-items: center;
    }

    .routeInfoBox{
        display : inline-block;
        border : 2px solid #467355;
        /* margin : 3px; */
        margin-left : auto;
        margin-right : auto;
        height : 200px;
        /* order : 1; */
        text-align: center;
    }

    .rArrowArea{
        display : inline-block;
        /* border : 1px solid blue; */
        height : 30px;
        margin-top : 5%;
        margin-bottom : 5%;
        padding-top:3%;
        padding-bottom:3%;
    }

    .noRouteBox{
        /* border : 1px solid pink; */
        text-align : center;
        align-items: center;
        margin-left : auto;
        margin-right : auto;
    }
    
    #reddot{
		position: absolute;
	    top: 8%;
	    left: 18%;
	    width : 20px;
	    height : 20px;
	}
	
	.rInfoImgArea{
		width : 100%;
		height : 90%;
	}
	
	.routeInfoBox{
		width : 200px;
	}

  #motherDiv{
  	flex-wrap : wrap;
  	display: flex;
  	width : 100%;
  	height : fit-content;
  	justify-content : center;
  	margin-left : 2%;
  }
</style>
<body>

    <div id="back">
         <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
        <section class="page-start">
            <div id="topMenu">
                <div id="countDday"> <p>삼다수님의 <br> 여행까지 <br>D-100</p> </div>
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="goToInfo();"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <img src="${contextPath}/resources/images/image_mp/dot_r.png" class="newAlert" id="reddot">
                    <button class="menuButton" id="myInfo" onclick="goToJjim();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToBooking();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingB.png" class="btnImg"> <br> 내 예약</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="goToRoute();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripW.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToWallet();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="tripContainer">
                    <div id="tripTopBox">
                             <div id="map" style="width: 100%; height:590px; disply:inline-block; margin:0px;"></div>
                             <script>
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(33.376073744219326, 126.54506534832129),
									level: 9
								};
						
								var map = new kakao.maps.Map(container, options);
							</script>
                    </div>
                    <c:choose>
                    <c:when test="${!empty routeTest }">
					<c:forEach items="${ routeTest }" var="rt" varStatus="rtNum">
                    <div class="tripReservInfoBox">
                        <div id="rinfoText"><h3 style="font-size: medium;">${ rtNum.count }일차.</h3></div>
                        <div id="motherDiv">
                        	
                       		<c:forEach var='rrt' items="${rt.value}" varStatus="rrtNum"> 
                       		<%-- <c:forEach var="i" begin="0" end="${fn:length(rt.key)}"> --%>
		                        <div class="routesBox">
		                           
		                            <c:if test="${ rrt.spot_no ne 0}">
		                            <div class="routeInfoBox">
		                                <div class="rInfoImgArea">
		                                
		                                    <img src="${contextPath}/resources/images/image_route/${rrt.spot_oname}" alt="" style="width:100%; height:100%;"> 
		                                </div>
		                                <div class="rNameArea">
		                                    <p>${rrt.spot_title}</p>
		                                </div>
		                            </div>
		                            </c:if>
		                            <c:if test="${rrt.bus_code ne 0}">
		                            <div class="routeInfoBox">
		                                <div class="rInfoImgArea">
		                                    <img src="${contextPath}/resources/images/image_route/${rrt.file_rename}" alt="" style="width:100%; height:100%;">
		                                </div>
		                                <div class="rNameArea">
		                                    <p>${routeTest[rrt].bus_name}</p>
		                            </div>
		                            </div>
		                            </c:if>
		                            
		                            <c:if test="${ rrtNum.last eq false }">
		                            <div class="rArrowArea">
		
		                                <img src="${contextPath}/resources/images/image_mp/arrow.png">
		
		                            </div>
		                            </c:if>
		                        </div>
                       		</c:forEach>
                       		</div>
                    	</div>
						</c:forEach>
							</c:when>
							<c:otherwise>
								 <div class="tripReservInfoBox">
			                        <div class="routesBox">
			                            <div class="noRouteBox">
			
			                                <img src="${contextPath}/resources/images/image_mp/noRoute.png" alt=""><br>
											
			                                <p>아직 저장된 길이 없습니다.</p>
			                            </div>
			                        </div>
			                    </div>
							</c:otherwise>
							</c:choose>

                   
                </div>
            </div>
        </section>
    </div>
     <script>
    function goToWallet(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/wallet?usno='+${loginUser.usno};
	};
	
	function goToBooking(){
		location.href='${contextPath}/mypage/booking?usno='+${loginUser.usno};
	}
	
	function goToJjim(){
		location.href='${contextPath}/mypage/jjimlist?usno='+${loginUser.usno};
	}
	function goToInfo(){
		var uspart = "일반";
		location.href='${contextPath}/mypage/userinfo?usno='+${loginUser.usno} + '&uspart='+uspart;
	}
	function goToRoute(){
		location.href='${contextPath}/mypage/myroute?usno='+${loginUser.usno};	
	}
	</script>
	
<!-- 	 <script>
    	document.getElementById('routeDate').valueAsDate = new Date();
    	
    	var today = new Date();
    	var dd = today.getDate();
    	var mm = today.getMonth() + 1;
    	var yyyy = today.getFullYear();
    	
    	 if(dd < 10){
    	        dd = '0' + dd;
    	    } 
    	    if(mm < 10){
    	        mm = '0' + mm;
    	    } 
    	
    	today = yyyy + '-' + mm + '-' + dd;
    	document.getElementById("routeDate").setAttribute("min", today);
    </script> -->
   
    
    <script>
	 	$(document).ready(function(){

	 		if('${loginUser.usid}' != ''){
	 			var searchU = new Object();
					searchU.usno = "${loginUser.usno}";
					searchU.uspart = "${loginUser.uspart}";
					
	 			$.ajax({
	 				url : "${contextPath}/mypage/new",
	 				data : JSON.stringify(searchU),
	 				type : "post",
	 				contentType : "application/json; charset=utf-8",
	 				success : function(data){
	 					if(data > 0){
	 						$('.newAlert').css("display","block");
	 						$('.newAlert').css("display","inline-block");
	 						$('.newAlert').css("margin-bottom","5px;");
	 					} else{
	 						alert("세션확인 오류!");
	 					}
	 				},
	 				error : function(e){
	 					alert("세션확인 오류2!"+ "error code : " + e.status + "\n"
									+ "message : " + e.responseText);
	 				}
	 			});
	 		}
	 		
	 	});
	 </script>
	  <script language=JavaScript>
    	var arr = new Array();
    	<c:forEach items="${list}" var="list">
    		arr.push({
    			title: "${list.spot_title}",
    			address: "${list.spot_address}",
    			content: "${list.spot_content}",
    			path1: "${list.spot_path}",
    			path2: "${list.spot_oname}"
    			});
    	</c:forEach>
    	
    	var positions = arr;
    	
    	//console.log(positions);
    	
    	var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.376073744219326, 126.54506534832129),
			level: 8
		};

		var map = new kakao.maps.Map(container, options);
		
		var geocoder = new kakao.maps.services.Geocoder();
		var imageSrc = "${ contextPath }/resources/images/image_route/marker.png";
		var imageSize = new kakao.maps.Size(33, 54);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		var bounds = new kakao.maps.LatLngBounds();
		
		var linePath = [];
		
		var distanceOverlay;
		
		var polyline = new kakao.maps.Polyline({
		    path: linePath,
		    strokeWeight: 3,
		    strokeOpacity: 1,
		    strokeColor: 'red',
		    strokeStyle: 'solid'
		});
		
		
		const addressSearch = address => {
		    return new Promise((resolve, reject) => {
		        geocoder.addressSearch(address.address, function(result, status) {
		            if (status === kakao.maps.services.Status.OK) {
		            	
		            	  var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						       
						       // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords,
						            image: markerImage
						        });
						       
						       marker.setMap(map);
							

					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + address.title + '</div>'
					        });
					        
					        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
						    
						    kakao.maps.event.addListener(marker, 'click', function() {
						        document.getElementById("detail_modal").click();
						        document.getElementById("detail_title").innerHTML = address.title;
						        document.getElementById("detail_address").innerHTML = address.address;
						        document.getElementById("detail_content").innerHTML = address.content;
						        
						  	});
					    	
					    	bounds.extend(new kakao.maps.LatLng(coords.Ma, coords.La));
					    	map.setBounds(bounds);
		                
		                resolve(result);
		            } else {
		                reject(status);
		            }
		        });
		    });
		};

		(async () => {
		    try {
		        for(let address of positions) {
		            const result = await addressSearch(address);
		            setPolyLine(result);
		            console.log("길이: " + polyline.getLength());
		        }
		    } catch (e) {
		        console.log(e);
		    }
		})();

		function setPolyLine(result) {
		    const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    linePath.push(coords);
		    polyline.setPath(linePath);
		    
		    if(!polyline.getMap()) {
		        polyline.setMap(map);
		    }
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
    </script>
 
</body>
</html>