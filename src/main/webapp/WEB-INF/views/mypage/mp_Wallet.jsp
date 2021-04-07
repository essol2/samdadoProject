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
    <title>mypage_wallet</title>
    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- chart.js library -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
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
        height : 1050px;
    }

    .mainTable{
        width : 98%;
        margin : 1%;
    }

    .mainTable, .mainTable tr,.mainTable td, .mainTable th{
        border : 1px solid lightgray;
        border-collapse: collapse;
    }
    
    #forExcelExport{
    	height : 500px;
    }

    .thisWalletPage{
        color : #467355;
        width : 10%;
        font-size: small;
    }

    .newWalletBtn{
        background-color : #467355;
        color : white;
        width : 10%;
        font-size: large;
    }

    .addingNew{
        width: 100%;
        background-color : #467355;
        color : white;
        text-align: center;
        border-style: none;
        cursor: pointer;
        font-size : small;
    }
    .preWalDate{
        width: 100%;
        border-style: none;
        cursor: pointer;
        margin : 0;
        padding: 0;
        color : white;
        background-color : #467355;
    }

    .clickedPreWallet{
        background-color: #467355;
        color : white;
    }

    .unclickedPreWallet{
       background-color: white;
        color:#467355;
    }

    #clickedDate{
        background-color: #467355;
        color : white;
    }

    #unclickedDate{
        background-color: white;
        color:#467355;
    }

    #forTopBlank{
        width : 20%;
    }

    .walletName{
        width : 20%;
    }

    .walletCate{
        width : 15%;
    }

    .walletPrice{
        width : 10%;
    }

    .walletPayDate{
        width : 10%;
    }

    .walletStatus{
        width : 7%;
    }

    .walletTouch{
        width : 8%;
        padding-left : 1%;
    }

    .walletPerson{
        width : 10%;
    }

    #walletMidTable th{
        background-color: rgb(228, 228, 228);
        color : gray;
        text-align : center;
    }

    #walletMidTable td{
        padding-top : 0.5%;
        padding-bottom: 0.5%;
        background-color: white;
        font-size: small;
        text-align : center;
    }
    
    .walletAccompany{
    	width : 5%;
    }
    
    .walletWhoPay{
    	width : 10%;
    }

    /* The switch - the box around the slider */
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    /* Hide default HTML checkbox */
    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    /* The slider */
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked + .slider {
        background-color: #467355;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #467355;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }

    #clickedWallet{
        background-color: #467355;
        color:white;
        width : 15%;
    }

    #unClickedWallet{
        width : 15%;
        color : #467355;
    }

    #forBottomBlank{
        width : 5%;
    }

    #numberTd{
        width : 10%;
    }

    #quantityTogether{
        width : 90%;
        height: 100%;
        border-style: none;
    }

    #howManyPeople{
        width : 8%;
        color : #467355;
    }

    #walletBottomTable{
        margin-top : 10%;
        text-align: center;
        background-color: white;
        height: 40px;
        font-size: medium;
    }

    #walletTopTable{
        height : 40px;
        background-color: white;
        font-size: medium;
    }
    
    #addNewDetail{
    	border-radius : 50%;
    	width : 100px;
    	height : 100px;
    	position : fixed; left:5%;bottom:10%;
    	box-shadow: 0px 0px 0px 5px lightgray;
    }
    
    #btnExport{
    	width : 100%;
    	height : 100%;
    	box-shadow: 0px 0px 0px 5px lightgray;
    }
   
  #modal {
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

	#modal button, #modal_submit_btn {
	  display:inline-block;
	  width:120px;
	  height : 60px;
	  margin-left:3%;
	  float : right;
	  background-color : #467355;
	  color : white;
	  border-style : none;
	  
	}
	
	#modal_submit_btn{
		margin-right : 6%;
	}
	
	#modal .modal_content {
	  width:860px;
	  height :580px;
	  /* margin:100px auto; */
	  margin-left : auto;
	  margin-right : auto;
	  margin-top : 10%;
	  padding:20px 10px;
	  background:#fff;
	  border-radius : 20px;
	  /* border : 1px solid yellow; */
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
	
	#addNewAccTable{
		width : 80%;
	}
	
	#addNewAccTable, #addNewAccTable tr, #addNewAccTable td{
		/* border : 1px solid black; */
	}
	
	#addNewAccTable tr, #addNewAccTable td{
		padding-top : 5px;
		padding-bottom : 5px;
		color : #467355;
	}
	
	#inputTd{
		padding-left : 2%;
		padding-right : 2%;
	}
	
	#classifyUser, #countDateUser, #accAccompany, #whopay{
		display : none;
	}
	
	#accompanyTd{
		width : 230px;
	}
	
	.chartBtns{
		background-color : #467355;
		color : white;
		padding : 5px;
		border-style : none;
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

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/userinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록</div></button>
                    <button class="menuButton" id="myInfo" onclick="location.href='${contextPath}/mypage/booking'"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingB.png" class="btnImg"> <br> 내 예약</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="goToWallet();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/walletW.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
                <table id="walletTopTable" class="mainTable">
                <tr>
                	<c:forEach var="rd" items="${rdList}" varStatus="rdNum">
                        <td class="clickedPreWallet">
                        	<button class="preWalDate" onclick="location.href='${contextPath}/mypage/chpage?atd='+ ${rdNum.index} +'&usno=' + ${loginUser.usno}">
                        		<fmt:formatDate value="${rd.accTripDate}" type="date" pattern="yyyy-MM-dd"/>
                        	</button>
                        	</td>
                	</c:forEach>
                	<td id="forTopBlank">&nbsp</td>
                	<td><button class="addingNew" id="btnExport"><b>+엑셀다운</b></button></td>
                </tr>
                </table>
                
                <div class="container" style="width : 550px;">
                	<canvas id="myChart"></canvas>
                	<div id="btnsArea">
			    	<button class="chartBtns" id="byClassify">구분별</button>
			    	<button class="chartBtns" id="byWhopay">결제인별</button>
			    </div>
                </div>
                <script> 
			    	data = { 
			    		datasets: [{ 
			    			backgroundColor: ['#467355','#689978','#88b897'], 
			    			data: [10, 20, 30]
			    		}], 
			    		labels: ['red','yellow','blue'] 
			    	};
			    	
			    	var ctx2 = document.getElementById("myChart"); 
			    	var myDoughnutChart = new Chart(ctx2, { 
			    		type: 'doughnut', 
			    		data: data, 
			    		options: {
			    			cutoutPercentage: 30
			    		} 
			    	}); 
			    
			    </script>
                <div id="forExcelExport">
                <table id="walletMidTable" class="mainTable">
                    <thead>
                      <tr>
                        <th class="walletName">이름</th>
                        <th class="walletCate">구분</th>
                        <th class="walletPrice">가격</th>
                        <th class="walletPayDate">결제일자(예정일)</th>
                        <th class="walletStatus">상태</th>
                        <th class="walletTouch">더치페이</th>
                        <th class="walletPerson">1인 가격</th>
                        <th class="walletAccompany">인원</th> 
                        <th class="walletWhoPay">결제인</th>
                      </tr>
                    </thead>
                    <tbody >
                    <c:forEach var="ab" items="${ abList }" varStatus="abStatus">
                      <tr id="forChageAjax${abStatus.index}">
                        <td class="walletName">${ ab.accName }</td>
                        <td class="walletCate"> ${ ab.accClassify }</td>
                        <td class="walletPrice"><fmt:formatNumber value="${ ab.accWon }" pattern="#,###"/></td>
                        <td class="walletPayDate"><fmt:formatDate value="${ ab.accTripDate }" type="date" pattern="yyyy-MM-dd"/></td>
                        <td class="walletStatus">${ab.accPstatus }</td>
                        <td class="walletTouch">
                            <label class="switch">
                                <input type="checkbox" id="slideCheck${abStatus.index}"<c:if test="${ ab.accDutch == 'on' }">checked</c:if>>
                                <span class="slider round"></span>
                            </label>
                            <input type="hidden" id="thisDate" value="${ab.accTripDate}">
                        	<input type="hidden" id="thisColNum" value="${ab.accno}">
                        </td>
                        <td class="walletPerson">${ ab.accOneWon }</td>
	          			<c:if test="${ empty ab.whopay }">
	          				<td class="walletAccompany"> 1인지불 </td>
	          				<td class="walletWhoPay">${ loginUser.usname }</td>
	          			</c:if>
	          			<c:if test="${ !empty ab.whopay}">
	          				<td class="walletAccompany"> ${ ab.accAccompany } </td>
	          				<td class="walletWhoPay">${ab.whopay}</td>
	          			</c:if>
	          			
                    </c:forEach>
                    </tbody>
                  </table>
                  </div>
                  <table id="walletBottomTable" class="mainTable">
                      <tr>
                         <th style="width : 20%;">금액 계산</th>
                         <th style="width : 10%">&nbsp</th>
                         <td style="color : #467355; width : 10%;">총 합계</td>
                         <td style="width : 20%;"><fmt:formatNumber value="${ts}" pattern="#,###"/></td>
                         <td style="color : #467355; width : 10%;">1인당 금액</td>
                         <td style="width : 20%;"><fmt:formatNumber value="${ots}" pattern="#,###"/></td>
                         
                      </tr>
                  </table>
            </div>
        </section>
    </div>
    
    <div id="fixedAddBtn">
    	<button class="addingNew" id="addNewDetail"><b>+추가하기</b></button>
    </div>
    
	<div id="modal">
		<div class="modal_content">
			<div>
            	<h4 style="text-align : center; color : #467355; padding : 3px;"><b>새로운 가계부 입력</b></h4>
            	<hr>
                <form action="${ contextPath }/mypage/inputNewAB" method="POST" onsubmit="return submitValidate();">
                	<div class="row g-3">
                		<table id="addNewAccTable" style="margin-right : 5%;">
                			<tr>
                				<td><label for="_id" class="inputeda" style="float:right;">이름 </label></td>
                				<td class="inputTd" colspan="4">
                				<input type="text" class="inputeda" id="accName" name="accName" style="width:90%;" placeholder="넣고자 하는 상품의 이름을 입력해주세요." required></td>
                			</tr>
                			<tr>
                				<td><label for="_pwd" class="inputeda" id="forMargin" style="float:right;">구분</label></td>
                				<td class="inputTd" colspan="2">
                					<select class="inputeda" id="accClassify" name="accClassify" style="width:90%;">
                					 	<option value="구분" selected> 구분 </option>
		                				<option value="숙박">숙박</option>
		                				<option value="교통">교통</option>
		                				<option value="식비">식비</option>
		                				<option value="관광지 입장권">관광지 입장권</option>
		                				<option value="체험권">체험권</option>
		                				<option value="직접입력">직접입력</option>
	                				</select>
                				</td>
                				<td id="showThisTd" colspan="2">
                					<input type="text" class="inputeda" id="classifyUser" name="classifyUser" style="width:83%;" placeholder="직접 입력해주세요!">
                					<input type="number" class="inputeda" id="countDateUser" name="countDateUser" style="width:83%;" placeholder="몇일치 예약했나요?">
                				</td>
                			</tr>
                			<tr>
                				<td><label for="_id" class="inputeda" style="float:right;">가격 </label></td>
                				<td class="inputTd" colspan="2">
                				<input type="text" class="inputeda" id="accWon" name="accWon" style="width:90%;" placeholder="숫자만 입력해 주세요! ex)15000"  required></td>
                				<td><label for="_id" class="form-label" style="float:right;"> 여행일자 </label></td>
                				<td class="inputTd"><input type="date" class="inputeda" id="accTripDate" name="accTripDate" style="width:75%;" required></td>
                			</tr>
                			<tr>
                				<td><label for="_id" class="inputeda" style="float:right;">결제상태 </label></td>
                				<td class="inputTd" colspan="2">
	                				<select class="inputeda" id="accPstatus" name="accPstatus" style="width:90%;">
		                				<option value="결제완료">결제완료</option>
		                				<option value="현장결제">현장결제</option>
	                				</select>
                				</td>
                				<td><label for="_id" class="form-label" style="float:right;"> 결제수단 </label></td>
                				<td class="inputTd">
                					<select class="inputeda" id="payMethod" name="payMethod" style="width:75%;">
                					 	<option value="구분" selected> 결제수단 </option>
		                				<option value="checkCard">체크카드</option>
		                				<option value="creditCard">신용카드</option>
		                				<option value="account">계좌이체</option>
		                				<option value="note">현금</option>
	                				</select>
                				</td>
                			</tr>
                			<tr>
                				<td><label for="_id" class="inputeda" style="float:right;">더치페이 </label></td>
                				<td class="inputTd"> 
	                				<label class="switch">
	                                	<input type="checkbox" id="accDutch" name="accDutch">
	                                	<span class="slider round"></span>
	                            	</label>
                            	</td>
                            	<td class="inputTd" id="accompanyTd">
                            		<input type="number" class="inputeda" id="accAccompany" name="accAccompany" style="width:100%;" placeholder="동행인은 몇명인가요?" value="0">
                            	</td>
                				<td class="inputTd" colspan="2">
                					<input type="text" class="inputeda" id="whopay" name="whopay" style="width:83%;" placeholder="누가계산했나요?">
                				</td>
                			</tr>
                		</table>
                	<input type="hidden" name="usno" id="usno" value="${ loginUser.usno }">
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
    
    <!-- 부트스트랩 --> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    
    <script>
    function goToWallet(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/wallet?usno='+${loginUser.usno};
	};
    </script>
	
	<script>

		$("#addNewDetail").click(function(){
		   $("#modal").fadeIn();
		});
		   
		$("#modal_close_btn").click(function(){
		   $("#modal").fadeOut();
		});      
	</script>
	
	<script>
		$(document).ready(function() {
		  $('#accClassify').change(function() {
		    var result = $('#accClassify option:selected').val();
		    if (result == "직접입력") {
		      $("#classifyUser").show();
		    } else {
		      $("#classifyUser").hide();
		    }
		  }); 
		}); 
		
		$(document).ready(function() {
			$('#accClassify').change(function() {
			    var result = $('#accClassify option:selected').val();
			    if (result == "숙박") {
			      $("#countDateUser").show();
			    } else {
			      $("#countDateUser").hide();
			    }
			}); 
		}); 
		
		$(document).ready(function() {
			$('#accDutch').change(function() {
			    if ($(this).prop('checked')) {
			      $("#accAccompany").show();
			    } else {
			      $("#accAccompany").hide();
			    }
			}); 
		}); 
		
		$(document).ready(function() {
			$('#accDutch').change(function() {
			    if ($(this).prop('checked')) {
			      $("#whopay").show();
			    } else {
			      $("#whopay").hide();
			    }
			}); 
		}); 
	</script>
	<script>
		$("#btnExport").click(function (e) {
			window.open('data:application/vnd.ms-excel,' + encodeURIComponent($("#forExcelExport").html()))
			 e.preventDefault();
		});
	</script>
	<!-- on/off Button Toggle -->
	<script>
	for (var i=0; i<=${fn:length(abList)}; i++){
			$("#slideCheck"+i).click(function() {
			
			var usno = ${loginUser.usno}; // 로그인 되어있는 유저
			
			//var acNo = $('#thisColNum').val();
			var accDutch = $(this).val();
			
			//console.log(usno);
			//console.log(acNo);
			console.log(accDutch);
			
			//location.href="${contextPath}/mypage/onoff?usno="+usno + "&accTripDate=" + accTripDate + "&accno=" + accno + "&accDutch=" + accDutch;
			$.ajax({
				url : "onoff",
				data : {accno : $('#thisColNum').val()},
				type : "POST",
				success : function(data){
					if(data > 0){
						alert("통신성공!");
					} else{
						alert("전송 값과 일치하지 않습니다.");
						console.log(data);
					}
				},
				errorr:function(e){
					alert("error code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
			})
		});
	}
	</script>
</body>
</html>