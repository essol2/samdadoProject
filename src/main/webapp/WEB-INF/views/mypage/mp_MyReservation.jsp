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
    <title>mypage_resevation</title>
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
        height : 500px;
    }

    .reservBox{
        width : 31.5%;
        height : fit-content;
        background-color: white;
        border : 1px solid white;
        display: inline-block;
        margin-left : 1%;
        margin-top : 1%;
        margin-bottom : 1%;
    }

    .reservBox h5{
        color :#467355;
        margin-left : 5%;
        margin-bottom: 3px;
    }

    .reservDetail{
        border : 1px solid #467355;
        margin-left : 2%;
        margin-bottom : 2%;
        margin-right : 2%;
        margin-top : 0;
    }

    .reserveContainer{
        margin : 2%;
        font-size:small;
        /* border : 1px solid black; */
    }

    .reserveBtnArea{
        text-align: right;
        padding-bottom: 2px;
        padding-right : 2px;
        /* border : 1px solid black; */
    }

    .reserveBtn{
        border-style: none;
        background: white;
        border : 1px solid #467355;
        color : #467355;
        border-radius: 3px;
        padding : 3px;
        margin : 2px;
    }
</style>
<body>
         <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>

            <div id="topMenu">
                <div id="countDday"> <p>${ loginUser.usname }님의 <br> 여행까지 <br>D-100</p> </div>
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/userinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="location.href='${contextPath}/mypage/booking'"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingW.png" class="btnImg"> <br> 내 예약</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="menuButton" id="myInfo"  onclick="goToWallet();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="leftBox" class="reservBox"> 
                	<br>
                    <h3 style="color: #467355; text-align: center;">숙박 예약 내역</h3>
                    <hr style="background-color: #467355; width : 90%; height: 2px;">
                    <c:forEach items="${ hotelList }" var="hl" varStatus="hlNum">
                    	<h5 id="bookTitle">${ hl.r_bus_name }</h5>
                    	<div class="reservDetail">
	                        <div class="reserveContainer">
	                            <img src="${contextPath}/resources/images/image_mp/calendar.png" alt="" class="reservIcon">&nbsp ${ hl.r_booking_trv }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon">&nbsp ${ hl.r_booking_product }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/credit_card.png" alt="" class="reservIcon">&nbsp ${ hl.r_booking_pay }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon">&nbsp ${ hl.r_booking_address }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon">&nbsp ${  hl.r_booking_phone }<br><br>
	                            <%-- <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp ${ hl.r_bus_name }<br> --%>
	                            <input type="hidden" id="bus_code" value="${ hl.r_bus_code }">
	                            <input type="hidden" id="category" value="room">
	                        </div>
	                        <div class="reserveBtnArea">
	                            <button class="reserveBtn" id="cancleResv" onclick="goToCancel(${ hl.r_booking_no }, 'room', '${ hl.r_bus_name }');">예약 취소</button>
	                            <button class="reserveBtn" id="detailResv" onclick="goToDetail(${ hl.r_bus_code});">상세페이지</button><br>
                        	</div>
                    	</div>
                    </c:forEach>
                </div>
			

                <div id="middleBox" class="reservBox">
                	<br>
                    <h3 style="color: #467355; text-align: center;">렌트카 예약 내역</h3>
                    <hr style="background-color: #467355; width : 90%; height: 2px;">
                    <c:forEach items="${ carList }" var="cl" varStatus="clNum">
                    	<h5>${ cl.c_bus_name }</h5>
                    	<div class="reservDetail">
	                        <div class="reserveContainer">
	                            <img src="${contextPath}/resources/images/image_mp/calendar.png" alt="" class="reservIcon">&nbsp ${ cl.c_booking_trv }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon">&nbsp ${ cl.c_booking_product }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/credit_card.png" alt="" class="reservIcon">&nbsp ${ cl.c_booking_pay }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon">&nbsp ${ cl.c_booking_address }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon">&nbsp ${  cl.c_booking_phone }<br><br>
	                            <%-- <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp ${ hl.r_bus_name }<br> --%>
	                        	<input type="hidden" name="whatKind" value="car">
	                        </div>
	                        <div class="reserveBtnArea">
	                            <button class="reserveBtn" id="cancleResv" onclick="goToCancel(${cl.c_bus_code}, 'car', '${ cl.c_bus_name }');">예약 취소</button>
	                            <button class="reserveBtn" id="detailResv" onclick="goToDetail(${cl.c_bus_code});">상세페이지</button><br>
                        	</div>
                    	</div>
                    </c:forEach>
                </div>

                <div id="rightBox" class="reservBox">
                	<br>
                    <h3 style="color: #467355; text-align: center;">입장권&체험권 예약 내역</h3>
                    <hr style="background-color: #467355; width : 90%; height: 2px;">
                    
                 	<c:forEach items="${ tourList }" var="tl" varStatus="tlNum">
                    	<h5>${ tl.t_bus_name }</h5>
                    	<div class="reservDetail">
	                        <div class="reserveContainer">
	                            <img src="${contextPath}/resources/images/image_mp/calendar.png" alt="" class="reservIcon">&nbsp ${ tl.t_booking_trv }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon">&nbsp ${ tl.t_booking_product }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/credit_card.png" alt="" class="reservIcon">&nbsp ${ tl.t_booking_pay }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon">&nbsp ${ tl.t_booking_address }<br><br>
	                            <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon">&nbsp ${  tl.t_booking_phone }<br><br>
	                            <%-- <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp ${ hl.r_bus_name }<br> --%>
	                        	<input type="hidden" name="whatKind" value="tour">
	                        </div>
	                        <div class="reserveBtnArea">
	                            <button class="reserveBtn" id="cancleResv" onclick="goToCancel(${tl.t_bus_code}, 'tour', '${ tl.t_bus_name }');">예약 취소</button>
	                            <button class="reserveBtn" id="detailResv" onclick="goToDetail(${tl.t_bus_code});">상세페이지</button><br>
                        	</div>
                    	</div>
                    </c:forEach>
            	</div>
            </div>
 <script>
    function goToWallet(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/wallet?usno='+${loginUser.usno};
	};
	
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
</body>
</html>