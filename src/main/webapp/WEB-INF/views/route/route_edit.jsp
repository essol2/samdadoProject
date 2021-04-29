<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길 수정하기</title>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
 <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6&libraries=services,clusterer,drawing"></script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
	
	<jsp:include page="../common/navi.jsp"/>
	<link rel="stylesheet" href="${ contextPath }/resources/css/route/route_modal.css" type="text/css">
	<%-- <link rel="stylesheet" href="${ contextPath }/resources/css/route/route_result.css" type="text/css"> --%>
	<style>
	
	.modal-body div {
			margin: 0px;
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
        
        div {
        disply:block;
        }
        
        <!-- 상세보기 modal -->
        .modal-body div {
			margin: 0px;
		}
	        .top_div {
            display: flex;
        }

        .bottom_div {
            text-align: center;
        }

        .left_div {
            padding-left: 20px;

        }

        .right_div {
            text-align: center;
            width: 100%;
        }

        .detail_img {
            width: 300px;
            height: 200px;
        }

        .detail_content {
            font-size: 13px;
        }
        
        /* css */
        @charset "UTF-8";

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
            margin-left: 10%;
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
            cursor: default;
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
	
	#cost-content {
		width: 100%;
		padding: 10px;
	}
	
	#costTable {
		width: 100%;
	}
	
	#costTable td {
		width: 100%;
	}
    </style>
</head>
<body>
		<div id="bottom">
            <div id="content" style="width : 90%;">
                <br><br><br>
                <div class="route_title">
                    <image id="content_logo" width="70px" height="70px" src="../resources/images/image_main/logo_g.png"></image>
                    &nbsp;
                    <label class="content-title">길 수정하기</label>
                </div>

                <div id="route_select">
                	<br>
                	<c:if test="${ area == 'east' }">
                		<c:set var="check1" value="checked"/>
                	</c:if>
                	<c:if test="${ area == 'west' }">
                		<c:set var="check2" value="checked"/>
                	</c:if>
                	<c:if test="${ area == 'south' }">
                		<c:set var="check3" value="checked"/>
                	</c:if>
                	<c:if test="${ area == 'north' }">
                		<c:set var="check4" value="checked"/>
                	</c:if>
                	
                	<c:if test="${ thema == 'sightseeing' }">
                		<c:set var="check5" value="checked"/>
                	</c:if>
                	<c:if test="${ thema == 'break' }">
                		<c:set var="check6" value="checked"/>
                	</c:if>
                	<c:if test="${ thema == 'beach' }">
                		<c:set var="check7" value="checked"/>
                	</c:if>
                 	<form id="routeSearchForm" action="${ contextPath }/route/search" method="get" onsubmit="return searchForm();">
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
								<table id="routeTable" style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
									<c:forEach var="r" items="${ list }" varStatus="index">
										<tr id="tr1">
											<td>
												<img style="width: 300px; height: 225px;" src="${ r.spot_path }${ r.spot_oname }">
											</td>
											<td>
												<div class="parent">
													<div class="spot_border">
														<p class="spot_title" name="title" id="spotTitle">${ r.spot_title }</p>
														<button class="spot_btn" id="deleteSpot" onclick="deleteSpot(this)"><img src="../resources/images/image_route/trashcan.png">삭제하기</button>
													</div>
													<div class="spot_chnge">
	                                                	<button class="up_down" id="tableUp" onclick="moveUp(this)" ><img src="../resources/images/image_route/btn_up.png"></button>
	                                                    <br>
	                                                    <button class="up_down" id="tableDown" onclick="moveDown(this)"><img src="../resources/images/image_route/btn_down.png"></button>
	                                                </div>
	                                             </div>   
											</td>
										</tr>
										
										<c:if test="${ !index.last }">
		                                    <tr id="tr2">
		                                       <td colspan="2">
		                                           <img id="arrow" src="../resources/images/image_route/arrow.png">
		                                           <!-- <span class="detail">26.8km</span>
		                                           <span class="detail">59분</span> -->
		                                        </td>
		                                    </tr>
	                                    </c:if>
                               </c:forEach>
                                 </table>
                                 <table style="margin: auto; margin-top: 10%; margin-bottom: 10%;">
                                   <tr>
                                        <td style="width: 500px;" colspan="3"> 
                                        <p style="margin-top: 15%;"></p>
                                            <button class="_btn" id="ch_btn">변경 완료</button>
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
		                                    	<td id="cost-content">&nbsp;${ r.spot_title }<fmt:formatNumber value="${ r.spot_price }" pattern="#,###"/>원</td>
		                                        <c:set var="totalPrice" value="${ totalPrice + r.spot_price }"/>
		                                    </tr>
                                      	</c:forEach>
                                    	
                                        <tr> 
                                            <td id="tcost-content" style="text-align: right;" >총 <span id="totalPrice"><fmt:formatNumber value="${ totalPrice }" pattern="#,###"/></span>원&nbsp;</td>
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
                                <c:forEach var="h" items="${ hotelList }">
                                <c:if test="${ h.bus_classify eq 'P' && h.file_lv eq '0' }">
                                   <table style="margin: auto; margin-top: 10%; margin-bottom: 10%; text-align : center;">
                                        <tr>
                                            <td onclick="goToDetail(${h.bus_code})" ><img src="${contextPath}/resources/busUploadFiles/${h.file_rename}" style="width : 90%; height : auto;"></td>
                                        </tr>
                                         <tr>
                                            <td id="navi-content" style="font-size : 30px; color : #467355; padding-top:2%;">${h.bus_name }</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content" style="color:#bfbfbf;">${h.hotel_facility }</td>
                                        </tr>
                                       
                                    </table>
                                </c:if>
                                </c:forEach>
                                  
                                </div>
                                <br>

                                <button class="_btn" id="morebtn" onclick="location.href='${ contextPath }/business/hotel_list'">숙박 더 보러 가기</button>
                                
                               <br><br>
                                <c:if test="${ !empty loginUser && !empty jjimList}">
                                <label class="content-title" id="title4">${ loginUser.usname } 님이 찜하신 숙박</label>
                                <div class="c1_border" id="right-bottom-border">
                      			<c:forEach items="${ jjimList }" var="jl" varStatus="jlNum">
                                    <table style="margin: auto; margin-top: 10%; margin-bottom: 10%; text-align : center;">
                                        <tr>
                                            <td onclick="goToDetail(${jl.bus_code})" ><img src="${contextPath}/resources/busUploadFiles/${jl.file_rename}" style="width : 90%; height : auto;"></td>
                                        </tr>
                                         <tr>
                                            <td id="navi-content" style="font-size : 30px; color : #467355; padding-top:2%;">${jl.bus_name }</td>
                                        </tr>
                                        <tr>
                                            <td id="navi-content" style="color:#bfbfbf;">${jl.hotel_facility }</td>
                                        </tr>
                                       
                                    </table>
                                 </c:forEach>
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
                    <button id="search_btn">검색</button>
                    <br><br>
                    
                    <div id="search_list"></div>
                    
                     <c:if test="${ !empty loginUser && !empty jjimB}">
	                    <p id="zzim">${ loginUser.usname } 님이 찜하신 관광지</p>
	                    <c:forEach var="j" items="${ jjimB }" varStatus="jlNum">
	                    	<div class="zzim_list" >
		                        <p style="cursor: pointer;" class="zzim_content_title">${ j.bus_name }</p>
		                        <p style="cursor: pointer;" class="zzim_content">${ j.bus_address }</p>
	                    	</div>
                  		</c:forEach>
                    
                    <br>
                    </c:if>
                </class>
                </div>
            </div>
        </div>
        
   		<!-- 상세보기 button -->
        <button id="detail_modal" type="button" class="mapSearchbtn" data-bs-toggle="modal" data-bs-target="#detailModal" style="position: relative; z-index: 10; margin-left: 91%; margin-top: 1%; display:none;"></button>
        
        <!-- 상세보기 Modal -->
	    <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <p id="searchtitle">상세보기</p>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <class class="modal-body" id="modal-body">
	                    <div class="top_div">

	                        <div class="right_div">
	                            <br>
		                            <p id="detail_title"></p>
		                            <p class="detail_content" id="detail_address"></p>
	                        </div>
	                    </div>
	
	                    <div class="bottom_div">
	                        <br>
	                        <p id="detail_content"></p>
	                    </div>
	                </class>
	            </div>
	        </div>
	    </div> 
	    
	    <input type="hidden" id="sPath">
	   	<input type="hidden" id="sOname">
	   	<input type="hidden" id="bPath">
	    <form id="clist" action="${contextPath}/route/clearChange" method="post">
	    </form>
	   
	    
	<!-- 추가하기 -->
	<script>	
		function addSpot1(el) {
			var $button = $(el).closest('button');
			var title = $button.prev().prev().html();
			var path = $("#sPath").text();
			var name = $("#sOname").text();
			
			console.log(path);
			console.log(name);
			
			var $tr = $("#routeTable tbody");
			
			$tr.append("<tr><td colspan='2'><img id='arrow' src='../resources/images/image_route/arrow.png'></td></tr>");
			$tr.append("<tr id='tr1'><td><img src='" + path + name +"'></td><td><div class='parent'><div class='spot_border'><p class='spot_title' name='title' id='spotTitle'>" + title + "</p><button class='spot_btn' id='deleteSpot' onclick='deleteSpot(this)'><img src='../resources/images/image_route/trashcan.png'>삭제하기</button></div><div class='spot_chnge'><button class='up_down' id='tableUp' onclick='moveUp(this)' ><img src='../resources/images/image_route/btn_up.png'></button><br><button class='up_down' id='tableDown' onclick='moveDown(this)'><img src='../resources/images/image_route/btn_down.png'></button></div></div></td></tr>");
			
			alert("추가되었습니다!");
		}
		
		function addSpot2(el) {
			var $button = $(el).closest('button');
			var title = $button.prev().prev().html();
			var path = $("#bPath").text();
			
			console.log(path);
			
			var $tr = $("#routeTable tbody");
			
			$tr.append("<tr><td colspan='2'><img id='arrow' src='../resources/images/image_route/arrow.png'></td></tr>");
			$tr.append("<tr id='tr1'><td><img style='height: 225px; width: 300px;' src='../resources/busUploadFiles/" + path + "'></td><td><div class='parent'><div class='spot_border'><p class='spot_title' name='title' id='spotTitle'>" + title + "</p><button class='spot_btn' id='deleteSpot' onclick='deleteSpot(this)'><img src='../resources/images/image_route/trashcan.png'>삭제하기</button></div><div class='spot_chnge'><button class='up_down' id='tableUp' onclick='moveUp(this)' ><img src='../resources/images/image_route/btn_up.png'></button><br><button class='up_down' id='tableDown' onclick='moveDown(this)'><img src='../resources/images/image_route/btn_down.png'></button></div></div></td></tr>");
			
			alert("추가되었습니다!");
		}
	</script>
	
	<!-- 저장 버튼 -->
	<script>
		$("#add_btn").on("click", function(){
			alert("변경 완료 후 추가해 주세요.");
		});
	</script>
	    
	<!-- 변경 완료 -->
	<script>
		$("#ch_btn").on("click", function(){
			/* var arr = new Array(); */
			
			$("#clist").html("");
			
			$("#tr1 #spotTitle").each(function(index, element){
				/* arr.push($(this).text()); */
				$("#clist").append("<input type='hidden' name='chlist' value='" + $(this).text() + "'/>");
			}); 
			
			/* console.log(arr); */
			
			$("#clist").submit();
		});
		
	</script>
	
	<!-- 여행지 삭제 -->
	<script>
		function deleteSpot(el) {
			var $tr1 = $(el).closest('tr');
			var $tr2 = $tr1.prev();
			var $tr3 = $tr1.next();
			
			if($tr1.prev().html() != null) {
				$tr1.remove();
				$tr2.remove();
			} else if($tr1.next().next().html != null) { 
				$tr1.remove();
				$tr3.remove();
			} else {
				$tr1.remove();
				$tr3.remove();
			}
		}
	</script>
	    
	<!-- 순서 변경 -->
	<script>
	 function moveUp(el) {
		var $tr1 = $(el).closest('tr');
	 	
		if($tr1.prev().html() != null) {
			$tr1.prev().prev().before($tr1);
		 	
			var $tr2 = $tr1.next();
			$tr2.next().after($tr2);
		}
		
	}
	
	function moveDown(el) {
		var $tr1 = $(el).closest('tr');
		
		if($tr1.next().next().html() != null) {
			$tr1.next().next().after($tr1);
			
			var $tr2 = $tr1.prev();
			$tr2.prev().before($tr2);		
		}
	}
	</script>
	    
	<!-- 검색 모달창 -->
	<script language=JavaScript>
		$("#search_btn").on("click", function(){
		var sTitle = $("#search_input").val();
		var data = { sTitle : sTitle };
		
		$.ajax({
			url: "${ contextPath }/route/searchSpot",
			data: data,
			type: "post",
			dataType: "json",
			success: function(data) {
				console.log(data);
				
				sdiv = $("#search_list");
				sdiv.html("");
				
				for(var i in data) {
					if(data[i].spot_title != null) {
						div = $("<div class='zzim_list'>");
						title = $("<p class='zzim_content_title' id='searchSpotTitle'>").text(data[i].spot_title);
						address = $("<p class='zzim_content'>").text(data[i].spot_address);
						add = $("<button id='addbtn' onclick='addSpot1(this)'><img src='../resources/images/image_route/download.png'>추가하기</button>");
						path = $("#sPath").text(data[i].spot_path);
						oname = $("#sOname").text(data[i].spot_oname);
						br = $("<br>");
						
						div.append(title, address, add);
						sdiv.append(div, br);
					}
					
					if(data[i].bus_name != null) {
						/* if(data[i].) for문 안에 if문으로 조건 돌리기 */
						div = $("<div class='zzim_list'>");
						title = $("<p class='zzim_content_title' id='searchSpotTitle'>").text(data[i].bus_name);
						address = $("<p class='zzim_content'>").text(data[i].bus_address);
						add = $("<button id='addbtn' onclick='addSpot2(this)'><img src='../resources/images/image_route/download.png'>추가하기</button>");
						path = $("#bPath").text(data[i].file_rename);
						br = $("<br>");
						
						div.append(title, address, add);
						sdiv.append(div, br);
					}
				}
				
				$("#search_input").val("");			
			}
			
		});
		
		});
	</script>    
        
        
    <!--  지도 스크립트 -->
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
    	
    	console.log(positions);
    	
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
		
		/* positions.forEach(function(addr, index){
			geocoder.addressSearch(addr.address, function(result, status) {
				
				 if (status === kakao.maps.services.Status.OK) {
					 
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        
				        console.log(result[0]);
					       
					       // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords,
					            image: markerImage
					        });
					       
					       marker.setMap(map);
						
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + positions[index].title + '</div>'
				        });
				        
				        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				    	
				    	bounds.extend(new kakao.maps.LatLng(coords.Ma, coords.La));
				    	map.setBounds(bounds);
				    	
						linePath.push(new kakao.maps.LatLng(coords.Ma, coords.La)); 
						console.log(linePath);
						
						var polyline = new kakao.maps.Polyline({
									path: linePath, 
									strokeWeight: 3, 
									strokeOpacity: 1,
									strokeColor: 'red', 
									strokeStyle: 'solid' 
						});
						
						/* polyline.setMap(map);
						
						console.log("길이: " + polyline.getLength());

				 }
				
				 });
			}); */
		
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
		<footer>
           <jsp:include page="../common/footer.jsp"/>
        </footer>
</html>