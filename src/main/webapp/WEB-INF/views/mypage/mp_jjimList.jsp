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
    <title>mypage_jjim</title>
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
        height : fit-content;
    }

    #reservBox{
        width : 31.5%;
        height : fit-content;
        background-color: white;
        border : 1px solid white;
        display: inline-block;
        margin-left : 1%;
        margin-top : 1%;
        margin-bottom : 1%;
        padding : 0;
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
        width : 95%;
        height : 300px;
        display: flex;
    }

    .reserveImgArea{
        order : 1;
        display: inline-block;
        width : 50%;
        height: 300px;
        margin-top : 0px;
        margin-right : 5px;
        /* border : 1px solid red; */
        padding : 0;
    }

    .reserveImg{
        width : 100%;
        height: 300px;
        padding : 0;
        margin : 0;
        /* border : 1px solid blue; */
    }

    .reserveContainer{
        order:2;
        display : inline-block;
        width : 46%;
        height : 300px;
        /* margin-left : 5%;
        margin-right : 2%;*/
        margin-top :10px;
        font-size:small;
        /* border : 1px solid yellowgreen; */
    }

    /* #reserveInfoArea{
        border : 1px solid pink;
    } */

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

    .jjimHeart{
        width : 20%;
        height : 10%;
        margin-left : 80%;
        margin-top : 0;
        margin-bottom : 0;
        align-items: right;
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
	    top: 8%;
	    left: 18%;
	    width : 20px;
	    height : 20px;
	}
</style>
<body>
       <!-- navi.jsp include -->
       <jsp:include page="../common/naviWhite.jsp"/>

            <div id="topMenu">
                <div id="countDday"> <p>삼다수님의 <br> 여행까지 <br>D-100</p> </div>
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="goToInfo();"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <img src="${contextPath}/resources/images/image_mp/dot_r.png" class="newAlert" id="reddot">
                    <button class="clickedBtn" id="myInfo" onclick="goToJjim();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimW.png" class="btnImg"> <br> 찜목록</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToBooking();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingB.png" class="btnImg"> <br> 내 예약</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToRoute();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToWallet();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
            <c:choose>
            <c:when test="${ !empty jjimList }">
             <c:forEach var="jl" items="${jjimList}" varStatus="jlNumber">
                <div id="reservBox" class="more">
                	<br>
                    <h5>${ jl.bus_name }</h5>
                    <div class="reservDetail">
                        <div class="reserveImgArea">
                            <img src="${ contextPath }/resources/busUploadFiles/${jl.file_rename}" alt="" class="reserveImg" >
                        </div>
                        <div class="reserveContainer">
                            <div id="reserveInfoArea" class="jjimBtn">
                            	<input  type="hidden"  name="bus_code"  id="bus_code"  value="${ jl.bus_code }">
                                <img src="${contextPath}/resources/images/image_mp/heart_on.png" alt="" id="jjimIcon"><br>
                                <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon"><br> ${ jl.bus_category }<br><br>
                                <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon"><br> ${ jl.bus_address }<br><br>
                                <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon"><br> ${ jl.bus_phone }<br><br>
                            </div>
                            <div class="reserveBtnArea">
                                <button class="reserveBtn" id="detailResv" onclick="goToDetail(${ jl.bus_code});">상세페이지</button><br>
                            </div>
                        </div>
                        
                    </div>
                </div>
                </c:forEach>
               <%--  <div id="forAlign">
	              <p style="color  : #bfbfbf; margin : 0px; padding:0px;">더보기</p>
		          <img src="${contextPath}/resources/images/image_mp/moreBtn.png" id="moreBtn">
		     </div> --%>
                </c:when>
                <c:otherwise>
                	<div style="text-align : center; margin-left : auto; margin-right : auto; margin-top:8%; margin-bottom:auto;">
							<img src="${ contextPath }/resources/images/image_main/logo_g.png" style="margin-left : auto; margin-right:auto;"><br><br>
 		            		<h1 style="color : #467355; font-size : 30px; text-align : center; margin-left : auto; margin-right : auto;">찜이 한개도 없네요<br>삼다도엔 좋은 여행지들이 한가득!!</h1>
 		            		<button onclick="location.href='${ contextPath }/business/hotel_list'" id="goList" style="border-style:none; background-color : #467355; color : white; margin-left : auto; margin-right:auto; padding : 2%; margin-bottom:10%;">삼다도 여행상품들 보러가기!</button>
					</div>
                </c:otherwise>
                </c:choose>
                
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
			
			function goToDetail(bus_code){
				location.href='${contextPath}/business/detail?bus_code='+bus_code;
			}
			
			function goToInfo(){
				var uspart = "일반";
				location.href='${contextPath}/mypage/userinfo?usno='+${loginUser.usno} + '&uspart='+uspart;
			}
			
			function goToRoute(){
				location.href="${contextPath}/mypage/myroute?usno=" + ${loginUser.usno};
			}
	    </script>
		<script>
		$('.jjimBtn').click(function(){

			var $this = $(this);
			var bus_code = $(this).children().val();
			var check = $this.find("#jjimIcon");
			
			
			console.log(bus_code);
			console.log(check);
			
			var jjimOb = new Object();
			jjimOb.bus_code = bus_code;
			jjimOb.us_no = ${loginUser.usno};
			
			$this.find("#jjimIcon").attr("src", function(index, attr){
				if(attr.match('_on')){
					//console.log(" on 들어오니?");
					$.ajax({
					url : "${contextPath}/mypage/jjimoff",
					data : JSON.stringify(jjimOb),
					type : "POST",
					contentType : "application/json; charset=utf-8",
					success : function(data){
						
						//console.log("하트 오프!");
						
						
					}, error:function(e){
						alert("error code : " + e.status + "\n" + "message : " + e.responseText);
					}
				});
					return attr.replace("_on.png", "_off.png");
					
				} else {
					//console.log("off 들어오니?");
					$.ajax({
					url : "${contextPath}/mypage/jjimon",
					data : JSON.stringify(jjimOb),
					type : "POST",
					contentType : "application/json; charset=utf-8",
					success : function(data){
						
						//console.log("하트 온!");
						
						
					}, error:function(e){
						alert("error code : " + e.status + "\n" + "message : " + e.responseText);
					}
				});
					return attr.replace("_off.png", "_on.png");
				}
			});
		});
		</script>
		
		<script>				
	$(document).ready(function(){
		size_div = $('.more').length;
							
		x = 3;
		$('.more:lt('+x+')').addClass('moremore');
		$('#moreBtn').click(function(){
			x= (x+3 <= size_div)? x+3 : size_div;
			$('.more:lt('+x+')').addClass('moremore');	
		});
	});
	</script>
	
 
 
</body>
</html>