<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_stores</title>
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
        background-image: url('../resources/images/image_mp/backgroundImg.png');
        background-size: 100%;
    }
    #topMenu{
      align-items: center;
      width : 98%;
      height : 150px;
      /* border : 1px solid black; */
      position : absolute;
    }

    .menuBox{
        width : 95%;
        height : 150px;
        /* border : 1px solid blue; */
        display : inline-block;
        position:relative;
        top : 3%;
        left : 3%;
        margin-left : 1%;
        align-items: center;
    }
    .menuButton{
        width : 170px;
        height : 150px;
        border : 1px solid white;
        background-color: white;
        color : #bfbfbf;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 3%;
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
        margin-left :14%;
    }

    .btnImg{
        width: 60px;
        height : 60px;
        margin-bottom: 8px;
        /* border : 1px solid yellow; */
    }

    .clickedBtn{
        box-shadow: 3px 3px gray;
        width : 170px;
        height : 150px;
        border : 1px solid #467355;
        background-color:#467355;
        color : white;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 3%;
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
        top : 20%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height: fit-content;
        margin-top : 5%;
        margin-left : 3%;
    }


    #busiInfoBox{
        display: flex;
        width : 100%;
        align-items: center;
         /* border : 1px solid green; */
    }
    

    #leftImgBox{
        order : 1;
        /* border : 1px solid red; */
        width : 35%;
        text-align: right;
        padding : 5px;
        margin-left : 13%;
    }

    #rightInfoBox{
        order : 2;
         /* border : 1px solid blue;  */
        width : 65%;
    }

    .btnForBusiness{
        border-style: none;
        background-color : #467355;
        color : white;
        padding : 10px;
        margin-left : 5%;
    }
    
    #infoTextTable{
    	width : 90%;
    	margin-right : 5%;
    }
    
	#infoTextTable th, #infoTextTable td, #infoTextTable tr{
		/* border : 1px solid black;  */
	}    

    #infoTextTable th{
        text-align: right;
        width : 15%;
        padding : 5px;
    }

    #infoTextTable td{
        font-size: small;
        color : #467355;
        padding-left : 7px;
        width : 60%;
    }

    #newBusiBtnArea{
        text-align: right;
        
    }

    #newBusiBtn{
        padding : 5px;
        margin : 10px;
        background-color: white;
        border : 1px solid #457355;
        color : #467355;
    }

	.insertBtn{
		border-style : none;
		padding : 10px;
		background-color : #467355;
		color : white;
		width : 200px;
		height : 100px;
		display:inline-block;
		margin-left : 1.5%;
		margin-right : 1.5%;
		margin-bottom : 3%;
		/* border : 1px solid red; */
	}
	
	#storeModal {
	  position:fixed;
	  width:100%;
	  height:100%;
	  z-index:1;
	  border : 1px solid rgba(0, 0, 0, 0);
	  margin : auto;
	  align-items : center;
	  text-align : center;
	  display : none;
	}

	#storeModal .modal_content {
	  width:600px;
	  height :380px;
	  /* margin:100px auto; */
	  margin-left : auto;
	  margin-right : auto;
	  margin-top : 10%;
	  background:#fff;
	  border-radius : 20px;
	  border : 3px solid lightgray;
	  /* box-shadow: 6px 6px gray; */
	}
	
	#modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	  /* border : 1px solid blue; */
	} 
	
	#btnDiv{
		/* border : 1px solid purple; */
	}
	
	.businessImg{
		width : 100%;
		/* border  :  1px solid blue; */
	}
	
	.moreBtn{
		width : 100px;
		height : 50px;
		align-items : center;
	}
	
	#forAlign{
		align-items : center;
		text-align : center;
	}
  
  #moreBtn{
  	text-align : center;
  	border-style : none;
  	width  : 50px;
  	height : 20px;
  	margin-left : 0;
  	margin-right :0;
  }
  
  .more{
  	display: none;
  	flex-direction: column;
  }
  
  .moremore{
  	display: flex;
  	flex-direction: column;
  }
  
  #reddot{
		position: absolute;
	    top: 13%;
	    left: 27%;
	    width : 30px;
	    height : 30px;
	}
</style>
<body>

    <div id="back">
         <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
 
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/buserinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToAlert();"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <img src="${contextPath}/resources/images/image_mp/dot_r.png" class="newAlert" id="reddot">
                    <button class="clickedBtn" id="myInfo" onclick="goToBuss();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeW.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToAdvert();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToPoint();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/gotoqna'"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
            <br>
            <c:choose>
            <c:when test="${!empty bussList}">
			   
	            <c:forEach items="${bussList}" var="bl" varStatus="blStatus">
	            
	                <div class="more">
	                    <br>
	                    
	                    <h3 style="text-align: center;">${ bl.bus_name }</h3>
	                    <hr style="background-color: #467355; width : 60%; height: 2px;">
	                    <div id="busiInfoBox">
	                        <div id="leftImgBox">
	                            <img src="${ contextPath }/resources/busUploadFiles/${ bl.file_rename }" alt="" class="businessImg">
	                        </div>
	                        
	                        <div id="rightInfoBox">
	                            <table id="infoTextTable">
	                                <tr>
	                                    <th>사업장 번호</th>
	                                    <td>${bl.bus_code}</td>
	                                </tr>
	                                <tr>
	                                    <th>전화번호</th>
	                                    <td>${bl.bus_phone}</td>
	                                </tr>
	                                <tr>
	                                    <th>주소</th>
	                                    <td>${bl.bus_address}</td>
	                                </tr>
	                                <tr>
	                                    <th>등록일</th>
	                                    <td>${bl.bus_date}</td>
	                                </tr>
	                                <tr>
	                                    <th>소개글</th>
	                                    <td>${bl.bus_intro}</td>
	                                </tr>
	                            </table>
	                            <div id="btnArea">
	                                <br>
	                                <button class="btnForBusiness" id="viewDetailBtn" onclick="detailClick(${blStatus.index});">사업장 페이지로 이동</button>
	                            	<input type="hidden" id="bus_code" value="${bl.bus_code}">
	                    	        <input type="hidden" id="cgr" value="${bl.bus_category}">
	                            </div>
	                        </div>
	                    </div>
	                    <br>
	                    </div>
	               
	                    </c:forEach>
	                    </c:when>
	                    <c:otherwise>
				            <img src="${ contextPath }/resources/images/image_main/logo_g.png"><br>
			            	<h1 style="color : #467355; font-size : 30px; text-align : center;">등록된 사업장이 없습니다!</h1>
			           </c:otherwise>
			           </c:choose>
	                    <div id="forAlign">
	                    	<p style="color  : #bfbfbf; margin : 0px; padding:0px;">더보기</p>
		                    <img src="${contextPath}/resources/images/image_mp/moreBtn.png" id="moreBtn">
		                 </div>
	                    
                    <div id="newBusiBtnArea">
                        <button id="newBusiBtn">사업장 추가하기</button>
                    </div>
                    
                </div>
              </div>

	<div id="storeModal">
		<div class="modal_content">
			<div>
				<br>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="float : right; margin-right : 20px;"></button>
				
				<!-- <h5 class="modal-title" style="margin-left : auto; margin-right:auto;">새로운 사업장 추가하기</h5> -->
            	<h4 style="text-align : center; color : #467355; padding : 3px; width:90%; margin-left:5%;"><b>새로운 사업장 등록하기</b></h4>
            	
            	<hr>
            	<br>
            	<div id="btnDiv">
	            	<button id="insertHotelBtn" class="insertBtn" onclick="location.href='${contextPath}/business/hotel_write'">숙박 등록하기</button>
	            	<button id="insertRestaurantBtn" class="insertBtn" onclick="location.href='${contextPath}/business/restaurant_write'">음식점 등록하기</button>
	            	<button id="insertCarBtn" class="insertBtn" onclick="location.href='${contextPath}/business/rentcar_write'">렌트카 등록하기</button>
	            	<button id="insertTourBtn" class="insertBtn" onclick="location.href='${contextPath}/business/tour_write'">관광지 등록하기</button>
            	</div>
            </div>    
		</div>
		<div class="modal_layer"></div>
	</div>
    
	<script>
	function goToPoint(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/point?usno='+${loginUser.usno};
	};
	
	function goToBuss(){
		location.href='${contextPath}/mypage/buss?usno='+${loginUser.usno};
	}

	function goToAdvert(){
		location.href="${contextPath}/mypage/advert?usno="+${loginUser.usno};
	}
	
	function goToAlert(){
		var uspart = "제휴";
		location.href="${contextPath}/mypage/alert?usno="+${loginUser.usno} +"&uspart=" + uspart;
	}
	
	function detailClick(i){
		
		var bus_code = $("#bus_code").val();
		var cgr = $("#cgr").val();
		
		console.log(bus_code);
		console.log(cgr);
		
		if(cgr=="R"){
			location.href="${contextPath}/business/restaurant_detail?bus_code="+bus_code;
		} else if(cgr=="H"){
			location.href="${contextPath}/business/hotel_detail?bus_code="+bus_code;
		}else if(cgr=="T"){
			location.href="${contextPath}/business/tour_detail?bus_code="+bus_code;
		}else{
			location.href="${contextPath}/business/car_detail?bus_code="+bus_code;
		}
	}
	</script>
	<!-- 새로운 사업장 insert 연결 모달 -->
	<script>

		$("#newBusiBtn").click(function(){
		   $("#storeModal").fadeIn();
		});
		   
		$(".btn-close").click(function(){
		   $("#storeModal").fadeOut();
		});      
	</script>

	<script>				
	$(document).ready(function(){
		size_div = $('.more').length;
							
		x = 1;
		$('.more:lt('+x+')').addClass('moremore');
		$('#moreBtn').click(function(){
			x= (x+2 <= size_div)? x+2 : size_div;
			$('.more:lt('+x+')').addClass('moremore');	
		});
	});
	</script>
	
	
</body>
</html>