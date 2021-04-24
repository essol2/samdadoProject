<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mypage_resevation</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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

body {
	background-image:
		url('${contextPath}/resources/images/image_mp/backgroundImg.png');
	background-size: 100%;
}

#topMenu {
	align-items: center;
	width: 98%;
	height: 150px;
	/* border : 1px solid black; */
	position: absolute;
}

#countDday {
	/* border : 1px solid pink; */
	display: inline-block;
	position: relative;
	left: 3%;
	width: 15%;
	height: 150px;
	color: white;
	text-align: center;
	font-size: 30px;
	margin-left: 4%;
	margin-top: 5%;
}

.menuBox {
	width: 55%;
	height: 150px;
	/*  border : 1px solid blue; */
	display: inline-block;
	position: relative;
	top: -60%;
	left: 3%;
	margin-left: 3%;
	/* margin-top : 1.5%; */
	align-items: center;
}

.menuButton {
	width: 155px;
	height: 140px;
	border: 1px solid white;
	background-color: white;
	color: #bfbfbf;
	text-align: center;
	display: inline-block;
	margin-top: 2%;
	margin-left: 2%;
	border-radius: 2px;
	align-items: center;
}

.menuButton:hover {
	box-shadow: 6px 6px gray;
	cursor: pointer;
}

.menuBoxEle {
	/* border : 1px solid red; */
	width: 110px;
	height: 110px;
	text-align: center;
	margin-left: 11%;
	padding: 0;
}

.btnImg {
	width: 60px;
	height: 60px;
	/*  border : 1px solid yellow; */
}

.clickedBtn {
	box-shadow: 3px 3px gray;
	width: 155px;
	height: 140px;
	border: 1px solid #467355;
	background-color: #467355;
	color: white;
	text-align: center;
	display: inline-block;
	margin-top: 2%;
	margin-left: 2%;
	border-radius: 2px;
	align-items: center;
}

.clickedBtn:hover {
	box-shadow: 6px 6px gray;
	cursor: pointer;
}
/* mainBox */
#mainBox {
	position: absolute;
	top: 30%;
	left: 3%;
	background-color: rgba(255, 255, 255, 0.8);
	border: 5px solid white;
	width: 77%;
	height: fit-content;
}

/*     #mainBox2{
    	position : absolute;
        top : 30%;
        left : 3%;
        display : flex;
    } */
.reservBox {
	width: 31.5%;
	height: fit-content;
	background-color: white;
	border: 1px solid white;
	display: inline-block;
	margin-left: 1%;
	margin-top: 1%;
	margin-bottom: 1%;
}

.reservBox h5 {
	color: #467355;
	margin-left: 5%;
	margin-bottom: 3px;
}

.reservDetail {
	border: 1px solid #467355;
	margin-left: 2%;
	margin-bottom: 2%;
	margin-right: 2%;
	margin-top: 0;
}

.reserveContainer {
	margin: 2%;
	font-size: small;
	/* border : 1px solid black; */
}

.reserveBtnArea {
	text-align: right;
	padding-bottom: 2px;
	padding-right: 2px;
	/* border : 1px solid black; */
}

.reserveBtn {
	border-style: none;
	background: white;
	border: 1px solid #467355;
	color: #467355;
	border-radius: 3px;
	padding: 3px;
	margin: 2px;
}

#leftBox {
	order: 1;
}

#middleBox {
	order: 2;
}

#rightBox {
	order: 3;
}

#modalRoom {
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	border: 1px solid rgba(0, 0, 0, 0);
	margin: auto;
	align-items: center;
	/* text-align : center; */
	display: none;
}

#modalRoom button, #modal_submit_btn {
	display: inline-block;
	width: 120px;
	height: 60px;
	margin-left: 3%;
	float: right;
	background-color: #467355;
	color: white;
	border-style: none;
}

#modal_submit_btn {
	margin-right: 6%;
}

#modalRoom .modal_content {
	width: 950px;
	height: fit-content;
	/* margin:100px auto; */
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	margin-bottom: auto;
	padding: 20px 10px;
	background: #fff;
	border-radius: 20px;
	position : fixed; left:20%;bottom:0.5%;
	/* border : 1px solid yellow; */
}

#modalRoom .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
	/* border : 1px solid blue; */
}

#modalTable tr, #modalTable td, #modalTable {
	/* border: 1px solid red; */
}
.starR1{
    background: url('${contextPath}/resources/images/image_mp/star.png') no-repeat -51px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
   	/* border : 1px solid red; */
}
.starR2{
    background: url('${contextPath}/resources/images/image_mp/star.png') no-repeat -66px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
    /* border : 1px solid blue; */
}
.starR1.on{background-position: -10px 0;}
.starR2.on{background-position:-25px 0;}

 .nooo{
	text-align : center;
	color : #467355;
	font-size : 20px;
}
.forAlign{
		align-items : center;
		text-align : center;
	}
  
  .moreBtn{
  	text-align : center;
  	border-style : none;
  	width  : 50px;
  	height : 20px;
  	margin-left : 0;
  	margin-right :0;
  }

/* .moreBtn{
		width : 100px;
		height : 50px;
		align-items : center;
	} */
	
	.moreH, .moreC, .moreT{
  	display: none;
  	flex-direction: column;
  }
  
  .moremoreH, .moremoreC, .moremoreT{
  	display: flex;
  	flex-direction: column;
  }
  
</style>
<body>
	<!-- navi.jsp include -->
	<jsp:include page="../common/navi.jsp" />
	
	<c:set var="today" value="<%=new java.util.Date()%>" />
	<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd" />

	<div id="topMenu">
		<div id="countDday">
			<p>${ loginUser.usname }님의
				<br> 여행까지 <br> ${ now }
			</p>
		</div>
		<div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/userinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보<br> <br></div></button>
                    <button class="menuButton" id="myInfo" onclick="goToJjim();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록<br><br> </div></button>
                    <button class="clickedBtn" id="myInfo" onclick="goToBooking();"> <div class="menuBoxEle" onclick="location.href='${contextPath}/mypage/booking'"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingW.png" class="btnImg"> <br> 내 예약<br> <br></div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행<br> <br></div></button>
                    <button class="menuButton" id="myInfo" onclick="goToWallet();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑<br><br></div></button>
        </div>
	</div>

	

	<div id="mainBox">
	<div style="display:flex;">
		<div id="leftBox" class="reservBox">
			<br>
			<h3 style="color: #467355; text-align: center;">숙박 예약 내역</h3>
			<hr>
			<c:choose>
			<c:when test="${ !empty hotelList}">
			<c:forEach items="${ hotelList }" var="hl" varStatus="hlNum">
			<div class="moreH">
				<h5 id="bookTitle">${ hl.r_bus_name }</h5>
				<div class="reservDetail">
				<div >
					<div class="reserveContainer">
						<img src="${contextPath}/resources/images/image_mp/calendar.png"
							alt="" class="reservIcon">&nbsp ${ hl.r_booking_trv }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/tag-outline.png"
							alt="" class="reservIcon">&nbsp ${ hl.r_booking_product }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/credit_card.png"
							alt="" class="reservIcon">&nbsp <fmt:formatNumber value="${ hl.r_booking_pay }" pattern="#,###"/><br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/location_outline.png"
							alt="" class="reservIcon">&nbsp ${ hl.r_booking_address }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/phone_outline.png"
							alt="" class="reservIcon">&nbsp ${ hl.r_booking_phone }<br>
						<br>
					</div>
					<div class="reserveBtnArea">
						<c:choose>
							<c:when test="${hl.r_booking_trv > now}">
								<button class="reserveBtn" id="cancleResv" onclick="goToCancel(${ hl.r_booking_no }, 'room', '${ hl.r_bus_name }');">예약취소</button>
							</c:when>
							
							<c:when test="${hl.r_booking_trv < now && hl.r_review_check ne null}">
								<button class="reserveBtn" id="writeReview" onclick="goToReWrite('${ hl.r_bus_name}', '${ hl.r_booking_trv }', ${ hl.r_booking_no }, '${ hl.file_rename }','h', '${hl.r_bus_code }');">후기수정</button>
							</c:when>
							
							<c:when test="${hl.r_booking_trv < now && hl.r_review_check eq null}">
								<button class="reserveBtn" id="writeReview" onclick="goToReview('${ hl.r_bus_name}', '${ hl.r_booking_trv }', ${ hl.r_booking_no }, '${ hl.file_rename }', 'h', '${hl.r_bus_code }', 'I', 0);">후기작성</button>
							</c:when>
							
							<c:otherwise>
								<button class="reserveBtn" id="cancleResv" disabled style="background-color:#bfbfbf;">예약취소</button>
							</c:otherwise>
						</c:choose>
						<button class="reserveBtn" id="detailResv"
							onclick="goToDetail(${ hl.r_bus_code});">상세페이지</button>
						<br>
					</div>
				</div>
				</div>
				<br>
				</div>
			</c:forEach>
			<div class="forAlign"  id="moreBtnH">
				<p style="color : #bfbfbf; margin : 0px; padding:0px;">더보기</p>
				<img src="${contextPath}/resources/images/image_mp/moreBtn.png" class="moreBtn">
			</div>
			</c:when>
			<c:otherwise>
				<div class="nooo"> 예약 내역이 없습니다!</div>
			</c:otherwise>
			</c:choose>
			
		</div>
		


		<div id="middleBox" class="reservBox">
			<br>
			<h3 style="color: #467355; text-align: center;">렌트카 예약 내역</h3>
			<hr>
			<c:choose>
			<c:when test="${!empty carList }">
				<c:forEach items="${ carList }" var="cl" varStatus="clNum">
				<div class="moreC">
				<h5>${ cl.c_bus_name }</h5>
				<div class="reservDetail" >
					<div class="reserveContainer">
						<img src="${contextPath}/resources/images/image_mp/calendar.png"
							alt="" class="reservIcon">&nbsp ${ cl.c_booking_trv }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/tag-outline.png"
							alt="" class="reservIcon">&nbsp ${ cl.c_booking_product }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/credit_card.png"
							alt="" class="reservIcon">&nbsp <fmt:formatNumber value="${ cl.c_booking_pay }" pattern="#,###"/><br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/location_outline.png"
							alt="" class="reservIcon">&nbsp ${ cl.c_booking_address }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/phone_outline.png"
							alt="" class="reservIcon">&nbsp ${ cl.c_booking_phone }<br>
						<br>
						<%-- <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp ${ hl.r_bus_name }<br> --%>
					</div>
					<div class="reserveBtnArea">
						<c:choose>
							<c:when test="${cl.c_booking_trv > now}">
								<button class="reserveBtn" id="cancleResv" onclick="goToCancel(${ cl.c_booking_no }, 'car', '${ cl.c_bus_name }');">예약취소</button>
							</c:when>
							
							<c:when test="${cl.c_booking_trv < now && cl.c_review_check ne null}">
								<button class="reserveBtn" id="writeReview" onclick="goToReWrite('${ cl.c_bus_name}', '${ cl.c_booking_trv }', ${ cl.c_booking_no }, '${ cl.file_rename }','c','${hl.c_bus_code }');">후기수정</button>
							</c:when>
							
							<c:when test="${cl.c_booking_trv < now && cl.c_review_check eq null}">
								<button class="reserveBtn" id="writeReview" onclick="goToReview('${ cl.c_bus_name}', '${ cl.c_booking_trv }', ${ cl.c_booking_no }, '${ cl.file_rename }', 'c', '${cl.c_bus_code }', 'I', 0);">후기작성</button>
							</c:when>
							
							<c:otherwise>
								<button class="reserveBtn" id="cancleResv" disabled style="background-color:#bfbfbf;">예약취소</button>
							</c:otherwise>
						</c:choose>
						<button class="reserveBtn" id="detailResv"
							onclick="goToDetail(${ cl.c_bus_code});">상세페이지</button>
						<br>
					</div>
				</div>
				</div>
				<br>
			</c:forEach>
			<div class="forAlign" id="moreBtnC">
				<p style="color : #bfbfbf; margin : 0px; padding:0px;">더보기</p>
				<img src="${contextPath}/resources/images/image_mp/moreBtn.png" class="moreBtn">
			</div>
			</c:when>
				<c:otherwise>
					<div class="nooo"> 예약 내역이 없습니다!</div>
				</c:otherwise>
			</c:choose>
			
		</div>

		<div id="rightBox" class="reservBox">
			<br>
			<h3 style="color: #467355; text-align: center;">입장권&체험권 예약 내역</h3>
			<hr>
			<c:choose>
			<c:when test="${ !empty tourList }">
			<c:forEach items="${ tourList }" var="tl" varStatus="tlNum">
			<div class="moreT">
				<h5>${ tl.t_bus_name }</h5>
				<div class="reservDetail">
					<div class="reserveContainer">
						<img src="${contextPath}/resources/images/image_mp/calendar.png"
							alt="" class="reservIcon">&nbsp ${ tl.t_booking_trv }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/tag-outline.png"
							alt="" class="reservIcon">&nbsp ${ tl.t_booking_product }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/credit_card.png"
							alt="" class="reservIcon">&nbsp <fmt:formatNumber value="${ tl.t_booking_pay }" pattern="#,###"/><br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/location_outline.png"
							alt="" class="reservIcon">&nbsp ${ tl.t_booking_address }<br>
						<br> <img
							src="${contextPath}/resources/images/image_mp/phone_outline.png"
							alt="" class="reservIcon">&nbsp ${ tl.t_booking_phone }<br>
						<br>
						<%-- <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp ${ cl.r_bus_name }<br> --%>
					</div>
					<div class="reserveBtnArea">
						<c:choose>
							<c:when test="${tl.t_booking_trv > now}">
								<button class="reserveBtn" id="cancleResv" onclick="goToCancel(${ tl.t_booking_no }, 'tour', '${ tl.t_bus_name }');">예약취소</button>
							</c:when>
							
							<c:when test="${tl.t_booking_trv < now && tl.t_review_check ne null}">
								<button class="reserveBtn" id="writeReview" onclick="goToReWrite('${ tl.t_bus_name}', '${ tl.t_booking_trv }', ${ tl.t_booking_no }, '${ tl.file_rename }','t', '${tl.t_bus_code }');">후기수정</button>
							</c:when>
							
							<c:when test="${tl.t_booking_trv < now && tl.t_review_check eq null}">
								<button class="reserveBtn" id="writeReview" onclick="goToReview('${ tl.t_bus_name}', '${ tl.t_booking_trv }', ${ tl.t_booking_no }, '${ tl.file_rename }', 't', '${tl.t_bus_code }', 'I', 0);">후기작성</button>
							</c:when>
							
							<c:otherwise>
								<button class="reserveBtn" id="cancleResv" disabled style="background-color:#bfbfbf;">예약취소</button>
							</c:otherwise>
						</c:choose>
						<button class="reserveBtn" id="detailResv"
							onclick="goToDetail(${ tl.t_bus_code});">상세페이지</button>
						<br>
					</div>
				</div>
				<br>
				</div>
				
			</c:forEach>
			<div class="forAlign" id="moreBtnT">
				<p style="color : #bfbfbf; margin : 0px; padding:0px;">더보기</p>
				<img src="${contextPath}/resources/images/image_mp/moreBtn.png"  class="moreBtn">
			</div>
			</c:when>
			<c:otherwise>
				<div class="nooo"> 예약 내역이 없습니다!</div>
			</c:otherwise>
			</c:choose>
			
		</div>
		
		
		
	</div>
	
	</div>
	
	

	<div id="modalRoom">
		<div class="modal_content">
			<div>
				<form action="${contextPath}/mypage/review" method="POST" enctype="multipart/form-data">
					<table style="width: 99%; height: 100%;" id="modalTable">
						<tr>
							<td style="display:none;"><input type="hidden" id="bus_code" name="bus_code"></td>
							<td style="display:none;"><input type="hidden" id="us_no" name="us_no" value="${loginUser.usno}">
							<input type="hidden" id="rev_lv" name="rev_lv" value="review">
							<input type="hidden" id="inup" name="inup">
							<input type="hidden" id="rev_no" name="rev_no">
							</td>
							
						</tr>
						<tr>
							<td rowspan="4" style="width: 45%; height: auto;" id="imgTd"></td>
							<td style="color: #467355; text-align: center; font-size: 50px; width : 50%;"
								colspan="6">어떠셨나요?<hr></td>
						</tr>
						<tr>
							<td colspan="6" id="bus_name" style="text-align: center; font-size:25px;"></td>
						</tr>
						<tr>
							<td colspan="6" id="goingDate" style="text-align: center; font-size:25px;"></td>
						</tr>
						<tr>
							<td colspan="6" style="text-align: center; font-size:25px; padding-left : 15%;"> 
							<div style="display : flex;">
								<div class="starRev" style="order : 1;">
								  <span class="starR1 on">☆</span>
								  <span class="starR2">☆</span>
								  <span class="starR1">☆</span>
								  <span class="starR2">☆</span>
								  <span class="starR1">☆</span>
								  <span class="starR2">☆</span>
								  <span class="starR1">☆</span>
								  <span class="starR2">☆</span>
								  <span class="starR1">☆</span>
								  <span class="starR2">☆</span>
								  <span id="starScore" style="order : 2; margin-left : 20px;"> 0.5</span>
								  <input type="hidden" id="re_star" name="re_star" value="0.5">
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="7"> <hr></td>
						</tr>
						<tr>
							<td colspan="7">
								<div style="display:flex;">
									<div id="image_preview" class="uploadBox" style="width: 220px; height: 180px; order : 1; margin-left:10%;">
										<img src="${contextPath}/resources/images/image_mp/photo.png" alt="사진영역" style="width: 100%; height: 100%;">
									</div>
									<div id="image_preview2" class="uploadBox" style="width: 220px; height: 180px; order : 2; margin-left:5%;">
										<img src="${contextPath}/resources/images/image_mp/photo.png" alt="사진영역" style="width: 100%; height: 100%;">
									</div>
									<div id="image_preview3" class="uploadBox" style="width: 220px; height: 180px; order : 3; margin-left:5%;">
										<img src="${contextPath}/resources/images/image_mp/photo.png" alt="사진영역" style="width: 100%; height: 100%;">
									</div>
								</div>
							</td>
						</tr>
						<tr style="width : 100%;">
							<td colspan="7">
								<div style="display:flex">
									<div class="f_box" style="order : 1; margin-left:10%;">
										<input type="file" id="img" name="rimg1">
									</div>
									<div class="f_box" style="order : 2;">
										<input type="file" id="img2" name="rimg2">
									</div> 
									<div class="f_box" style="order : 3;">
										<input type="file" id="img3" name="rimg3">
									</div> 
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="7" style="height:30%; "> <br> </td>
						</tr>
						<tr>
							<td colspan="7"><textarea id="reviewContent" style="width: 100%;" rows="5" cols="30" name="rev_comment"></textarea>
								<div id="textCnt">(0/100)</div></td>
						</tr>
					</table>
				<input type="hidden" name="booking_no" id="booking_no">
				<input type="hidden" name="rev_hct" id="rev_hct">
				<div id="buttonBoxes">
					<hr class="my-4">
					<button type="submit" id="modal_submit_btn" class="chButtons">확인</button>
					<button type="button" id="modal_close_btn" class="chButtons">취소</button>
				</div>
				</form>
			</div>
		</div>
		<div class="modal_layer"></div>
	</div>


	<script>
 	function goToBooking(){
		location.href='${contextPath}/mypage/booking?usno='+${loginUser.usno};
	}
 	
    function goToWallet(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/wallet?usno='+${loginUser.usno};
	};
	
	function goToJjim(){
		location.href='${contextPath}/mypage/jjimlist?usno='+${loginUser.usno};
	}
	
	function goToDetail(bus_code){
		location.href='${contextPath}/business/detail?bus_code='+bus_code;
	}
	
	function goToCancel(bookingLv, category, bus_name){

		var result = confirm(bus_name + "의 예약을 정말 취소하시겠습니까?");
		
		if(result){
			location.href='${contextPath}/mypage/canbook?bookingLv=' + bookingLv + '&category=' + category + '&usno=' + ${loginUser.usno};
		}
		
	}
    </script>

	<script>

		function goToReview(bus_name, goingDate, booking_no, file_rename, rev_hct, bus_code, inup, rev_no){
			
			//console.log(inup);
			
			if(inup == 'I'){
				$('#inup').val("I");
				$('#rev_no').val(rev_no);
			} else if(inup  = 'U'){
				$('#inup').val("U");
				$('#rev_no').val(rev_no);
			}
			
			$('#bus_code').val(bus_code);
			$('#bus_name').text(bus_name);
			$('#goingDate').text(goingDate);
			$('#imgTd').append("<img src='${ contextPath }/resources/busUploadFiles/"+ file_rename + "' style='width : 100%; height:auto;'>");
			$('#rev_hct').val(rev_hct);
			$('#booking_no').val(booking_no);
			
			$("#modalRoom").fadeIn();
		}
		   
		
		$("#modal_close_btn").click(function(){
			$('#imgTd*').empty();
			$('#reviewContent*').val('');
			$('#image_preview').empty();
			$('#image_preview2').empty();
			$('#image_preview3').empty();
			$('#image_preview').append('<img src="${contextPath}/resources/images/image_mp/photo.png" alt="사진영역" style="width: 100%; height: 100%;">');
			$('#image_preview2').append('<img src="${contextPath}/resources/images/image_mp/photo.png" alt="사진영역" style="width: 100%; height: 100%;">');
			$('#image_preview3').append('<img src="${contextPath}/resources/images/image_mp/photo.png" alt="사진영역" style="width: 100%; height: 100%;">');
			
		   $("#modalRoom").fadeOut();
		});    
		
		$(document).ready(function() {
		    $('#reviewContent').on('keyup', function() {
		        $('#textCnt').html("("+$(this).val().length+" / 100)");
		 
		        if($(this).val().length > 100) {
		            $(this).val($(this).val().substring(0, 100));
		            $('#textCnt').html("(100 / 100)");
		        }
		    });
		});
		
		function goToReWrite(bus_name, goingDate, booking_no, file_rename, rev_hct, bus_code){
			
			var searchR = new Object();
			searchR.usno = ${loginUser.usno};
			searchR.rev_hct = rev_hct;
			searchR.booking_no = booking_no;
			
			//console.log(searchR);
			
			$.ajax({
				url : "rewrite",
				data : JSON.stringify(searchR),
				type : "POST",
				contentType : "application/json; charset=utf-8",
				success : function(data){
					//console.log(data);
					//console.log("<img src='${ contextPath }/resources/busUploadFiles/"+ data.img_rename1 + "' alt='사진영역' style='width: 100%; height: 100%;'>");
					
					var rdateFormat = new Date(data.r_booking_trv); // null
					rdateFormat = getFormatDate(rdateFormat);
					var cdateFormat = new Date(data.c_booking_trv);
					cdateFormat = getFormatDate(cdateFormat);
					var tdateFormat = new Date(data.t_booking_trv);
					tdateFormat = getFormatDate(tdateFormat);

					$('#reviewContent').val(data.rev_comment);
					
					if(data.img_rename1 != "미입력"){
						$('#image_preview').html("<img src='${ contextPath }/resources/muploadFiles/"+ data.img_rename1 + "' alt='사진영역' style='width: 100%; height: 100%;'>");
						//$('#img').val("${ contextPath }/resources/musUploadFiles/"+ data.img_rename1);
					}
					if(data.img_rename2 != "미입력"){
						$('#image_preview2').html("<img src='${ contextPath }/resources/muploadFiles/"+ data.img_rename2 + "' alt='사진영역' style='width: 100%; height: 100%;'>");
						//$('#img2').val("${ contextPath }/resources/musUploadFiles/"+ data.img_rename2);
					}
					if(data.img_rename3 != "미입력"){
						$('#image_preview3').html("<img src='${ contextPath }/resources/muploadFiles/"+ data.img_rename3 + "' alt='사진영역' style='width: 100%; height: 100%;'>");
						//$('#img3').val("${ contextPath }/resources/musUploadFiles/"+ data.img_rename3);
					}
					
					if(rev_hct == "h"){
						goToReview(data.r_bus_name, rdateFormat, data.r_booking_no, data.file_rename, data.rev_hct, data.bus_code, 'U', data.rev_no);
					} else if(rev_hct == "c"){
						goToReview(data.c_bus_name, cdateFormat, data.c_booking_no, data.file_rename, data.rev_hct, data.bus_code, 'U', data.rev_no);
					} else{
						goToReview(data.t_bus_name, tdateFormat, data.t_booking_no, data.file_rename, data.rev_hct, data.bus_code, 'U', data.rev_no);
					}

				},
				errorr:function(e){
					alert("error code : " + e.status + "\n" + "message : " + e.responseText);
				}
			});
			
			
		}
	</script>

	<script>

    $('#img').on('change', function() {
	    ext = $(this).val().split('.').pop().toLowerCase();
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	        resetFormElement($(this));
	        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	    } else {
	        file = $('#img').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $('#image_preview img').attr('src', blobURL);
			$('#image_preview').slideDown()

	        }
    });
    
    $('#img2').on('change', function() {
	    ext = $(this).val().split('.').pop().toLowerCase();
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	        resetFormElement($(this));
	        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	    } else {
	        file = $('#img2').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $('#image_preview2 img').attr('src', blobURL);
			$('#image_preview2').slideDown()

	        }
    });
    

    $('#img3').on('change', function() {
	    ext = $(this).val().split('.').pop().toLowerCase();
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	        resetFormElement($(this));
	        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	    } else {
	        file = $('#img3').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	        $('#image_preview3 img').attr('src', blobURL);
			$('#image_preview3').slideDown()

	        }
    });
    
    $('.starRev span').click(function(){
    	
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  
    	  var star = $("[class*=' on']");
    	  var starCnt = star.length;
    	  
    	  var starScore = starCnt/2;
    	  
    	  $('#starScore').text(starScore);
    	 /*  $('#re_star').text(starScore);
    	  $('#re_star').val(starScore); */

    	  $('#re_star').val(starScore);
    	  
    	  return false;
    	});
    
    function getFormatDate(date){
		var year = date.getFullYear();
        var month = (1 + date.getMonth());
        month = month >= 10 ? month : '0' + month;
        var day = date.getDate();
        day = day >= 10 ? day : '0' + day;
        return year + '-' + month + '-' + day;
	}
	</script>
	
	<script>				
	$(document).ready(function(){
		h_size_div = $('.moreH').length;
		x = 1;
		$('.moreH:lt('+x+')').addClass('moremoreH');
		$('#moreBtnH').click(function(){
			x= (x+1 <= h_size_div)? x+1: h_size_div;
			$('.moreH:lt('+x+')').addClass('moremoreH');
			if(x == h_size_div){
				$('#moreBtnH').css("display", "none");
			}
		});
	});
	
	$(document).ready(function(){
		c_size_div = $('.moreC').length;
							
		y = 1;
		$('.moreC:lt('+x+')').addClass('moremoreC');
		$('#moreBtnC').click(function(){
			y= (y+1 <= c_size_div)? y+1 : c_size_div;
			$('.moreC:lt('+y+')').addClass('moremoreC');	
			if(y == t_size_div){
				$('#moreBtnC').css("display", "none");
			}
		});
	});
	
	$(document).ready(function(){
		t_size_div = $('.moreT').length;
		z = 1;
		$('.moreT:lt('+x+')').addClass('moremoreT');
		$('#moreBtnT').click(function(){
			z= (z+1 <= t_size_div)? z+1 : t_size_div;
			$('.moreT:lt('+z+')').addClass('moremoreT');
			if(z == t_size_div){
				$('#moreBtnT').css("display", "none");
			}
		});
	});
	</script>

</body>
</html>