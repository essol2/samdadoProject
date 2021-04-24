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
    <title>News</title>
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

    #alertTable{
        color : black;
         /* border : 1px solid blue;  */
        width : 95%;
        margin : 3%;
    }
    #alertTable th{
        width : 10%;
        border-top : 1px solid lightgray;
        border-bottom : 1px solid lightgray;
        font-size: small;
    }
    #alertTable td{
        border-top : 1px solid lightgray;
        border-bottom : 1px solid lightgray;
        padding : 3px;
        padding-top : 10px;
        padding-bottom: 10px;
        font-size: 14px;
        
    }
 .modal {
	  position:relative;
	  width:100%;
	  height:100%;
	  z-index:1;
	  border : 1px solid rgba(0, 0, 0, 0);
	  margin : auto;
	  align-items : center;
	  /* text-align : center; */
	  display : none;
	}

	.modal button{
	  display:inline-block;
	  width:120px;
	  height : 60px;
	  margin-left:2%;
	  float : right;
	  background-color : #467355;
	  color : white;
	  border-style : none;
	  
	}
	
	.modal .modal_content {
	  width:860px;
	  height :fit-content;
	  /* margin:100px auto; */
	  margin-left : auto;
	  margin-right : auto;
	  margin-top : 10%;
	  padding:20px 20px 90px;
	  background:#fff;
	  border-radius : 20px;
	  /* border : 1px solid yellow; */
	}
	
	.modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	  /* border : 1px solid blue; */
	} 
	
	#innerModalBox{
		width : 90%;
		height : 90%;
		background-color : #467355;
		color : white;
		border-radius : 20px;
		border : 1px solid #467355;
		margin : auto;
	}
   
   #modalTable{
   	background-color : #467355;
   	color : white;
   	padding : 5%;
   	text-align : left;
   	/* border : 1px solid white; */
   	border-radius : 20px;
   	width : 97%;
   	margin : auto;
   }
   
   #modalTable tr, #modalTable td, #modalTable th{
    /* border : 1px solid white; */
   	padding-top : 1%;
   	padding-bottom : 1%;
   	padding-left : 2%;
   	padding-right : 2%;
   }
   
   #modalYTable{
   	background-color : #467355;
   	color : white;
   	padding : 5%;
   	text-align : left;
   	/* border : 1px solid white; */
   	border-radius : 20px;
   	width : 97%;
   	margin : auto;
   }
   
   #modalYTable tr, #modalYTable td, #modalYTable th{
   	/* border : 1px solid white; */
   	padding-top : 1%;
   	padding-bottom : 1%;
   	padding-left : 2%;
   	padding-right : 2%;
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

        <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/buserinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="goToAlert();"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellW.png" class="btnImg"> <br> 내 소식</div></button>
                    <img src="${contextPath}/resources/images/image_mp/dot_r.png" class="newAlert" id="reddot">
                    <button class="menuButton" id="myInfo" onclick="goToBuss();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToAdvert();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToPoint();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/gotoqna'"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="alertBox">
		            <h2 style='margin : 3%; overflow:auto;'>내 소식</h2>
		            <table id="alertTable"> 
		            <c:choose>
		            <c:when test="${ !empty alertNList || !empty alertYList}">
			            <c:forEach var="ab" items="${ alertNList }" varStatus="abStatus">
			                <tr style="cursor : pointer;" onclick="detailNAlert(${ab.nno})" class="newList">
			                    <th class="nno" style="color : #467355;">new</th>
			                    <td style="color : #467355;">${ab.ntitle}</td>
			                    <td style="display : none;" class="ncate">${ab.ncate}</td>
			                    <c:if test="${ab.ncate == 'R'}">
			                    	<td>신고접수</td>
			                    </c:if>
			                    <c:if test="${ab.ncate == 'Q'}">
			                    	<td >문의답변</td>
			                    </c:if>
			                    <c:if test="${ab.ncate == 'P'}">
			                    	<td>포인트</td>
			                    </c:if>
			                    <c:if test="${ab.ncate == 'A' || ab.ncate == 'AA'}">
			                    	<td>배너광고</td>
			                    </c:if>
			                     <c:if test="${ab.ncate == 'B'}">
			                    	<td>공지사항</td>
			                    </c:if>
			                    
			                    <td><fmt:formatDate value="${ ab.ndate }" type="date" pattern="yyyy-MM-dd" /></td>
			                    
			                </tr>
			             </c:forEach>
			              <c:forEach var="ay" items="${ alertYList }" varStatus="ayStatus">
			                <tr onclick="detailYAlert(${ay.nno})" style="cursor : pointer;" class="readList">
			                    <th>${ay.nno}</th>
			                    <td>${ay.ntitle}</td>
			                    <c:if test="${ay.ncate == 'R'}">
			                    	<td>신고접수</td>
			                    </c:if>
			                    <c:if test="${ay.ncate == 'Q'}">
			                    	<td>문의답변</td>
			                    </c:if>
			                    <c:if test="${ay.ncate == 'P'}">
			                    	<td>포인트</td>
			                    </c:if>
			                    <c:if test="${ay.ncate == 'A' || ay.ncate == 'AA'}">
			                    	<td>배너광고</td>
			                    </c:if>
			                     <c:if test="${ay.ncate == 'B'}">
			                    	<td>공지사항</td>
			                    </c:if>
			                    <td><fmt:formatDate value="${ ay.ndate }" type="date" pattern="yyyy-MM-dd" /></td>
			                </tr>
			             </c:forEach>
			             </c:when>
			             <c:otherwise>
			             	<td colspan="4" style="color : #467355; font-size : 30px; text-align : center;"> 
			             	<img src="${ contextPath }/resources/images/image_main/logo_g.png"><br>
			             	소식이 없습니다!
			             	</td>
			             </c:otherwise>
			             </c:choose>
		            </table>
	       		</div>
            </div>
            
 	<div id="modalN" class="modal">
		<div class="modal_content">
			<div>
            	<h4 style="text-align : center; color : #467355; padding : 3px;"><b>알림</b></h4>
            	<hr>
               		<table id="modalTable">
               		
               		</table>
            		<div id="buttonBoxes">
            		<br>
	            		<button type="button" id="modal_close_Nbtn" class="chButtons" onclick="backBtn(${loginUser.usno})">닫기</button>
            		</div>
    		</div>
		</div>
						   
		<div class="modal_layer"></div>
	</div>
	
	<div id="modalY" class="modal">
		<div class="modal_content">
			<div>
            	<h4 style="text-align : center; color : #467355; padding : 3px;"><b>알림</b></h4>
            	<hr>
               		<table id="modalYTable">
               		
               		</table>
            		<div id="buttonBoxes">
            		<br>
	            		<button type="button" id="modal_close_Ybtn" class="chButtons">닫기</button>
            		</div>
    		</div>
		</div>
						   
		<div class="modal_layer"></div>
	</div>
	<script>
		function detailNAlert(nno){
			var datailList = findDetailAjax(nno);
			$("#modalN").fadeIn();
		}
		function backBtn(usno){
			var newData = newDataListAjax(usno);
			$("#modalN").fadeOut(); 
		}
		
		function detailYAlert(nno){
			var datailList = findDetailAjax(nno);
			$("#modalY").fadeIn();
		}
		
		$("#modal_close_Ybtn").click(function(){
			   $("#modalY").fadeOut();
		});   
		
		
		function findDetailAjax(nno){
			
			//console.log("아작스 전에 nno 확인 : " + nno);
			
			var searchNno = new Object();
			searchNno.nno = nno;
			
			$.ajax({
				url : "${contextPath}/mypage/detail",
				data : JSON.stringify(searchNno),
				type : "post", 
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(deAlert) {
					
					if(deAlert.nstatus == 'N'){
						table = $("#modalTable");
					} else if(deAlert.nstatus == 'Y'){
						table =  $("#modalYTable");
					}
					
					table.html("");
					
					var tr1 = $("<tr>");
					var tnno = $("<th style='width : 10%; text-align : right;'>").text("번호 : ");
					var tnnoData = $("<td style='width : 40%; text-align : left;'>").text(deAlert.nno);
					
					
					if(deAlert.ncate == 'A' && deAlert.alstatus == 'RI'){ // 배너 광고신청 - 이미지 반려
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "배너광고 신청 승인 거부 - 이미지");
						
						var blankTr = $("<tr>");
						var blankTd = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr2 = $("<tr>");
						var tcontent2 = $("<td colspan='4'>").text("'" + deAlert.bus_name + "' 사업장에 대한 " +deAlert.almessage+"로 인한 배너광고 신청 반려입니다.");

						var tr3 = $("<tr>");
						var tcontent3 = $("<td colspan='4'>").text("이는 1. 사진 규격이 일치하지 않거나, 2. 건강하지 못한 내용을 담은 배너 이미지 등록시 발생합니다.");
						
						var tr4 = $("<tr>");
						var tcontent4 = $("<td colspan='4'>").text("배너 이미지 확인 후 다시 신청해주세요!");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tcontent2);
						tr3.append(tcontent3);
						tr4.append(tcontent4);
						blankTr.append(blankTd);
						table.append(tr1, blankTr, tr2, tr3, tr4); 
					} else if(deAlert.ncate == 'A' && deAlert.alstatus == 'RP'){ // 배너 광고신청 - 포인트 반려
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "배너광고 신청 승인 거부 - 포인트");
						
						var blankTr = $("<tr>");
						var blankTd = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr2 = $("<tr>");
						var tcontent2 = $("<td colspan='4'>").text("'" + deAlert.bus_name + "' 사업장에 대한 " + deAlert.almessage+"로 인한 배너광고 신청 반려입니다.");

						var tr3 = $("<tr>");
						var tcontent3 = $("<td colspan='4'>").text("이는 포인트 잔액이 부족하여 발생합니다.");
						
						var tr4 = $("<tr>");
						var tcontent4 = $("<td colspan='4'>").text("내 포인트에서 포인트 충전 후 다시 신청해주세요!");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tcontent2);
						tr3.append(tcontent3);
						tr4.append(tcontent4);
						blankTr.append(blankTd);
						table.append(tr1, blankTr, tr2, tr3, tr4);
					} else if(deAlert.ncate == 'A' && deAlert.alstatus == 'Y'){ // 배너 광고신청 - 승인
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "배너광고 신청 승인");
						
						var blankTr = $("<tr>");
						var blankTd = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr2 = $("<tr>");
						var tcontent2 = $("<td colspan='4'>").text(deAlert.bus_name+"의 배너광고가 승인되었습니다!");

						var asdateFormat = new Date(deAlert.alStartDate);
						asdateFormat = getFormatDate(asdateFormat);
						
						var tr3 = $("<tr>");
						var tcontent3 = $("<td colspan='4'>").text(asdateFormat + "에 배너광고가 시작됩니다.");
						
						var tr4 = $("<tr>");
						var tcontent4 = $("<td colspan='4'>").text("삼다도와 함께 번창하세요!!");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tcontent2);
						tr3.append(tcontent3);
						tr4.append(tcontent4);
						blankTr.append(blankTd);
						table.append(tr1, blankTr, tr2, tr3, tr4);
					} else if(deAlert.ncate == 'AA'){ // 배너 광고신청 - 신청완료
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "배너광고 신청 완료");
						
						var blankTr = $("<tr>");
						var blankTd = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr2 = $("<tr>");
						var tcontent2 = $("<td colspan='4'>").text("사업장 이름: '" + deAlert.bus_name+"'의 배너광고가 신청되었습니다!");

						var tr3 = $("<tr>");
						var tcontent3 = $("<td colspan='4'>").text("심사 후 결과 발표까지 약 3일 요소 되며 내 소식 페이지를 통해 알림으로 결과를 받으실 수 있습니다.");
						
						var tr4 = $("<tr>");
						var tcontent4 = $("<td colspan='4'>").text("내 소식을 꼭 확인해주세요.");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tcontent2);
						tr3.append(tcontent3);
						tr4.append(tcontent4);
						blankTr.append(blankTd);
						table.append(tr1, blankTr, tr2, tr3, tr4);
					} else if(deAlert.ncate == 'Q'){ // 문의하기 답변
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "문의하기");
						
						var qdateFormat = new Date(deAlert.qdate);
						qdateFormat = getFormatDate(qdateFormat);
						
						var tr2 = $("<tr>");
						var tqdate = $("<th style='width : 15%; text-align : right;'>").text("문의일 : ");
						var tqdateData = $("<td colspan='3'>").text(qdateFormat);

						var blankTr = $("<tr>");
						var blankTd = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr3 = $("<tr>");
						var tqcontData = $("<td colspan='4'>").text("문의주신 내용 : " + deAlert.qcont);
						
						var tr4 = $("<tr>");
						var tqreplyData = $("<td colspan='4'>").text("답변 : " + deAlert.qreply);
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tqdate, tqdateData);
						tr3.append(tqcontData);
						tr4.append(tqreplyData);
						blankTr.append(blankTd);
						table.append(tr1, tr2, blankTr, tr3, tr4);
					} else if(deAlert.ncate == 'R' && deAlert.rexdate == null){ // 신고하기 - 접수됨
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "신고 접수");
						
						var rdateFormat = new Date(deAlert.rdate);
						rdateFormat = getFormatDate(rdateFormat);
						
						var tr2 = $("<tr>");
						var tqdate = $("<th style='width : 15%; text-align : right;'>").text("신고번호 : ");
						var tqdateData = $("<td style='width : 30%; text-align : left;'>").text(deAlert.reno);
						var tqcont = $("<th style='width : 20%; text-align : right;'>").text("신고일 : ");
						var tqcontData = $("<td style='text-align : left;'>").text(rdateFormat);

						var blankTr = $("<tr>");
						var blankTr = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr4 = $("<tr>");
						var tqreply = $("<th colspan='4'>").text("신고내용 : " + deAlert.bus_code + " 사업장에 대한 신고가 들어왔습니다.");
						
						var tr5 = $("<tr>");
						var tqreplyData = $("<td colspan='4'>").text("신고가 3번 등록되면 7일간 사업장이 정지됩니다. 주의 바랍니다.");
						
						var tr6 = $("<tr>");
						var trimg = $("<th colspan='4'>")
						var imgTd = $("<img src='${contextPath}/resources/busUploadFiles/" + deAlert.rimgcname + "' style='width : 98%;'>");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tqdate, tqdateData, tqcont, tqcontData);
						tr4.append(tqreply);
						tr5.append(tqreplyData);
						tr6.append(trimg, imgTd);
						blankTr.append(blankTd2);
						table.append(tr1, tr2, blankTr, tr4, tr5, tr6);
					} else if(deAlert.ncate == 'R' && deAlert.rexdate != null){ // 신고하기 - block 됨
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "사업장 정지");
						
						var rdateFormat = new Date(deAlert.rdate);
						rdateFormat = getFormatDate(rdateFormat);
						
						var tr2 = $("<tr>");
						var tqdate = $("<th style='width : 15%; text-align : right;'>").text("신고번호 : ");
						var tqdateData = $("<td style='width : 30%; text-align : left;'>").text(deAlert.reno);
						var tqcont = $("<th style='width : 20%; text-align : right;'>").text("신고일 : ");
						var tqcontData = $("<td style='width : 45%; text-align : left;'>").text(rdateFormat);

						var redateFormat = new Date(deAlert.rexdate);
						redateFormat = getFormatDate(redateFormat);
						
						var tr3 = $("<tr>");
						var trblockData = $("<td colspan='4'>").text("정지 해제 예정일 : " + redateFormat);
						
						var blankTr2 = $("<tr>");
						var blankTd2 = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr4 = $("<tr>");
						var tqreply = $("<th colspan='4'>").text("신고내용 : " + deAlert.bus_code + " 사업장에 대한 신고가 들어왔습니다. ");
						
						var tr5 = $("<tr>");
						var tqreplyData = $("<td colspan='4'>").text("신고가 3번 등록되어 해당 사업장은 7일간 정지됩니다. ");
						
						var tr6 = $("<tr>");
						var trimg = $("<th colspan='4'>");
						var imgTd =  $("<img src='${contextPath}/resources/busUploadFiles/" + deAlert.rimgcname + "' style='width : 98%;'>");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr2.append(tqdate, tqdateData, tqcont, tqcontData);
						tr3.append(trblockData);
						tr4.append(tqreply);
						tr5.append(tqreplyData);
						tr6.append(trimg, imgTd);
						blankTr2.append(blankTd2);
						table.append(tr1, tr2, blankTr2, tr3, tr4, tr5, tr6);
					} else if(deAlert.ncate == 'P'){ // 포인트 얼마남지않음
						var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
						var tncateData = $("<td style='width : 60%; text-align : left;'>").text(deAlert.ncate + "포인트");

						var blankTr2 = $("<tr>");
						var blankTd2 = $("<td colspan='4' style='height : 30px;'>").text(" ");
						
						var tr3 = $("<tr>");
						var tqcont = $("<th colspan='4'>").text("잔여 포인트는 " + deAlert.pbalance + "입니다.");
						
						var tr4 = $("<tr>");
						var tqreply = $("<th colspan='4'>").text("배너광고를 지속하기 위해서는 포인트 충전이 필요합니다.");
						
						tr1.append(tnno, tnnoData, tncate, tncateData);
						tr3.append(tqcont);
						tr4.append(tqreply);
						blankTr2.append(blankTd2);
						table.append(tr1, blankTr2, tr3, tr4);
					}
				
					
	
				},
				error : function(e) {
					alert("error code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
			});
		}
		
		
		function newDataListAjax(usno){
			
			var searchUsno = new Object();
			searchUsno.usno = usno;
			var uspart = "제휴"
			searchUsno.uspart = uspart;
			
			$.ajax({
				url : "${contextPath}/mypage/alertajax",
				data : JSON.stringify(searchUsno),
				type : "post", 
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					
					console.log(data);
					
					table = $("#alertTable");
					table.html("");
					
					
					for(var i in data){
						
						var fNdate = new Date(data[i].ndate);
						fNdate = getFormatDate(fNdate);
						

						if(data[i].nstatus == 'N'){
							var tr1 = $("<tr style='cursor : pointer;' onclick='detailNAlert("+data[i].nno+")' class='newList'>");
							var ajnno = $("<td style='color : #467355;'>").text("new");
							var ajntitle = $("<td style='color : #467355;'>").text(data[i].ntitle);
							
							if(data[i].ncate  == 'Q'){
								var ajncate  = $("<td>").text("문의답변");
							} else if(data[i].ncate == 'R'){
								var ajncate = $("<td>").text("신고접수");
							} else if(data[i].ncate == 'P'){
								var ajncate = $("<td>").text("포인트");
							} else if(data[i] = 'B'){
								var ajncate = $("<td>").text("공지사항");
							} else{
								var ajncate = $("<td>").text("배너광고");
							}
							
							var ajndate =  $("<td>").text(fNdate);
							
							tr1.append(ajnno, ajntitle, ajncate, ajndate);
							
						} else if(data[i].nstatus == 'Y'){
							var tr2 = $("<tr onclick='detailYAlert("+data[i].nno+")' style='cursor : pointer;' class='readList'>");
							var ajnno = $("<td>").text(data[i].nno);
							var ajntitle = $("<td>").text(data[i].ntitle);
							
							if(data[i].ncate  == 'Q'){
								var ajncate  = $("<td>").text("문의답변");
							} else if(data[i].ncate == 'R'){
								var ajncate = $("<td>").text("신고접수");
							} else if(data[i].ncate == 'P'){
								var ajncate = $("<td>").text("포인트");
							} else if(data[i] = 'B'){
								var ajncate = $("<td>").text("공지사항");
							} else{
								var ajncate = $("<td>").text("배너광고");
							}
							
							var ajndate =  $("<td>").text(fNdate);
							
							tr2.append(ajnno, ajntitle, ajncate, ajndate);
						}
						table.append(tr1, tr2);
					}
				},
				error : function(e) {
					alert("error code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
			
			});
		} 
	</script>
       
    <script>
	function goToPoint(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/point?usno='+${loginUser.usno};
	};
	
	function goToBuss(){
		location.href='${contextPath}/mypage/buss?usno='+${loginUser.usno};
	}
	
	function goToAdvert(){
		location.href='${contextPath}/mypage/advert?usno='+${loginUser.usno};
	}
	
	function goToAlert(){
		var uspart = "제휴";
		location.href="${contextPath}/mypage/alert?usno="+${loginUser.usno} +"&uspart=" + uspart;
	}
	</script>
	
	<script>
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
	 		
	 		if(${not empty sessionScope.loginUser}){
	 			if(${loginUser.uspart eq "일반"}){
	 				var uspart = "일반";
	 			} else if(${loginUser.uspart eq "제휴"}){
	 				var uspart = "제휴";
	 			} else {
	 				var uspart = " ";
	 			}
	 			
	 			var searchU = new Object();
				searchU.usno = ${loginUser.usno};
				searchU.uspart = uspart;
	 			
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
	 					}
	 				},
	 				error : function(e){
	 					alert("error code : " + e.status + "\n"
									+ "message : " + e.responseText);
	 				}
	 			});
	 		}
	 		
	 	});
	 </script>
	
</body>
</html>