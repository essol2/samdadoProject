<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_point</title>
    
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<style>
	
	$bg: #332f35;
	$fg: lighten($bg,20%);
	$borderWidth: 3px;

    /* 폰트 */
    * {
         font-family: 'Jeju Myeongjo', serif;
    }
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
        height : fit-content;
         margin-top : 5%;
        margin-left : 3%;
    }

    #pointBox{
        display: flex;
        width : 100%;
    }

    #leftArea{
        order : 1;
        width : 40%;
        margin-left : 10%;
        margin-top : 10px;
        margin-bottom: 10px;
        margin-right : 10px;
        
    }

    #rtopArea{
        background-color: white;
        width : 97%;
        height : 440px;
        margin-top : 0px;
        margin-left : 10px;
        margin-right : 10px;
        margin-bottom : 10px;
        /* border : 1px solid hotpink; */
/*         margin-bottom : 5%; */
    }
    
    #rightArea{
    	order : 2;
    	width : 40%;
        height : fit-content;
        /* border : 1px solid pink; */
        margin-top:35px;
        padding : 0px;
    }

    #topArea{
        background-color: white;
        text-align: center;
        margin-top : 5%;
        margin-bottom: 5%;
        padding : 5%;
        height : 220px;
        /* border : 1px solid blue; */
    }

    #bottomArea{
        background-color: white;
        text-align: center;
        padding : 5%;
        margin-bottom : 3%;
        height : 260px;
        /* border : 1px solid yellow; */
    }

    #showPoint{
        border : 1px solid #467355;
        width : 80%;
        height : 80px;
        border-radius: 5px;
        margin-top : 5%;
        margin-left : 10%;
        /* padding-bottom : 50px; */
    }

    #showPoint > h1{
        margin-top : 4%;
        margin-bottom : 4%;
        font-size: 50px;
    }
    .chargeBtn{
        border-style: none;
        color : #467355;
        border : 1px solid #467355;
        width : 20%;
        height : 65px;
        background-color: white;
        border-radius: 5px;
        margin-left : 3%;
    }

    #payBtn{
        border-style: none;
        color : white;
        width : 50%;
        height : 30px;
        background-color: #467355;
        border-radius: 5px;
    }

    #pointTable {
        width : 90%;
        margin-left : 5%;
        /* border : 1px solid red; */
    }

    #pointTable th, #pointTable td{
        border-bottom : 1px solid lightgray;
    }
    
    .cAbountBtn:checked,
	.cAbountBtn:not(:checked){
		position: absolute;
		left: -9999px;
		width: 0;
		height: 0;
		visibility: hidden;
	}
	
	.cAbountBtn:checked + .makeBorder,
	.cAbountBtn:not(:checked) + .makeBorder{
		display : inline-block;
		border : 1px solid #467355;
		width : 25%;
		height : 70px;
		padding-top : 2%;
        background-color: white;
        border-radius: 5px;
        margin-left : 3%;
        overflow: hidden;
		cursor: pointer;
		text-align: center;
		font-size : 20px;
	}
 	
 	.cAbountBtn:not(:checked) + .makeBorder{
 		background-color : white;
 		box-shadow: 3px 3px 0 0 gray;
 	}
 	
 	.cAbountBtn:checked + .makeBorder{
	 	background-color: #467355;
	 	color : white;
		/* box-shadow: 3px 3px 0 0 gray; */
 	}
 	
 	.cAbountBtn:not(:checked) + .makeBorder{
 		box-shadow: 3px 3px 0 0 gray;
 	}
 	
 	.cAbountBtn:checked + .makeBorder span,
	.cAbountBtn:not(:checked) + .makeBorder span{
		display: block;
	}
	
	#searchArea{
		/* border : 1px solid red; */
		width : 100%;
		height : 40px;
		display : inline-block;
		margin-left : 5px;
	}
	#searchBtn{
		border-radius : 3px;
		background-color : #467355;
		border-style : none;
		width : 50px;
		height : 20px;
		color : white;
	}
	
	.seRadio {
	  position: absolute;
	  visibility: hidden;
	  display: none;
	}
	
	.seLabel {
	  color: lighten($bg,40%);
	  display: inline-block;
	  cursor: pointer;
	  /* font-weight: bold; */
	  padding: 5px 10px;
	  text-align : center;
	  font-size : medium;
	  vertical-align : middle;
	  /* border : 1px solid red; */
	}
	
	.seRadio:checked + .seLabel{
	  color: lighten($bg,60%);
	  background-color: #467355
	}

	.radio-group {
	  border: solid #467355;
	  display: inline-block;
	  /* margin: 20px; */
	  border-radius: 10px;
	  overflow: hidden;
	}
	
	#searchArea{
		/* border : 1px solid purple; */
		height : 60px;
		margin-top : 0px;
		display : inline-block;
		text-align : center;
		align-items : center;
		padding-top : auto;
		padding-bottom:auto;
	}

	#searchThisBtn{
		border-style:none;
		background-color : #467355;
		border-radius : 5px;	
		height : 50px;
		color : white;
		margin-top: 3px;
		margin-right : 3px;
		margin-bottom : 10%;
		margin-left : 5px;
		padding-top : 10px;
		padding-left : 20px;
		padding-right : 20px;
		padding-bottom : 10px;
		/* padding:20px; */
		vertical-align : center;
		flex : 1;
	}
	
	#startDate{
		vertical-align : center;
		margin-left : 5px;
		margin-bottom : 10px;
		flex : 1;
	}
	
	input[type="date"]::-webkit-clear-button, input[type="date"]::-webkit-inner-spin-button { 
	 /* display: none;  */
	} 
	input[type="date"]::-webkit-calendar-picker-indicator { 
	 color: #467355; 
	} 
	input[type="date"] { 
	 background: rgb(0,0,0,0.1); 
	 color: #467355; 
	 border-style : none;
	 width : 210px;
	 height : 50px;
	}

    @media (max-width:1650px){
         /* 마이페이지 css */
            body{
                background-image: url('${contextPath}/resources/images/image_mp/backgroundImg.png');
                background-repeat: no-repeat;
                background-size: 100%;
            }
            #topMenu{
            align-items: center;
            width : 80%;
            height : 150px;
            /* border : 1px solid black; */
            }
       
            .menuBox{
                width : 95%;
                height : 150px;
                /* border : 1px solid blue; */
                display : inline-block;
                position:relative;
                top : 0;
                left : 3%;
                margin-left : 4%;
                align-items: center;
            }
            .menuButton{
                width : 140px;
                height : 130px;
                border : 1px solid white;
                background-color: white;
                color : #bfbfbf;
                text-align : center;
                display : inline-block;
                margin-top : 2%;
                margin-left : 2%;
                border-radius: 2px;
                align-items: center;
                /* -webkit-transition-duration : 0.4s;
                transition-duration: 0.4s; */
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
                margin-left : 3%;
            }

            .btnImg{
                width: 60px;
                height : 60px;
                /* border : 1px solid yellow; */
            }

            .clickedBtn{
                box-shadow: 3px 3px gray;
                width : 140px;
                height : 130px;
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
            #mainBox{
                position : absolute;
                top : 25%;
                left : 3%;
                background-color:rgba( 255, 255, 255, 0.8 );
                border : 5px solid white;
                width : 77%;
                height : 500px;
            }

            .menuBoxEle{
                /* border : 1px solid red; */
                width : 110px;
                height : 110px;
                text-align: center;
                margin-left :5%;
            }
        }
</style>
<body>

<!-- 결제 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <div id="back">
         <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
        <section class="page-start">
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/buserinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="goToPoint()"><div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/walletW.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/gotoqna'"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="pointBox">
                    <div id="leftArea">
                        <div id="topArea">
                            <h2 class="titles">현재 잔여 포인트</h2>
                            <div id="showPoint">
                                <h1 style="text-align: center;">${pList.get(0).getPbalance()}</h1>
                            </div>
                        </div>
                        <div id="bottomArea">
                            <h2 class="titles">포인트 충전</h2><br>
                            <div id="forBtns">
								<input type="radio" name="cAmount" class="cAbountBtn" id="30000won" value="3만원 충전">
								<label class="makeBorder" for="30000won">
									<span data-hover="30000won">30,000원</span>
								</label>
								<input type="radio" name="cAmount" class="cAbountBtn" id="60000won" value="6만원 충전">
								<label class="makeBorder" for="60000won">
									<span data-hover="60000won">60,000원</span>
								</label>
								<input type="radio" name="cAmount" class="cAbountBtn" id="90000won" value="9만원 충전">
								<label class="makeBorder" for="90000won">
									<span data-hover="90000won">90,000원</span>
								</label>
                            </div> 
                            <br>
                            <button class="goToPayment" id="payBtn" type="button">결제하기</button>
                        </div>
                    </div>
                    <div id="rightArea">
                    	<div id="rtopArea">
                    	<br>
	                        <h2 style="color:#467355; text-align : center; margin-top : 4%;">포인트 사용내역</h2>
	                        <hr style="background-color: #467355; width : 100%; "> 
	                        <table id="pointTable">
	                        	<thead>
		                            <tr>
		                                <th>날짜</th>
		                                <th>내용</th>
		                                <th>금액</th>
		                            </tr>
	                            </thead>
	                            <tbody>
		                            <c:forEach var="p" items="${ pList }">
			                            <tr>
			                                <td>${ p.pdate }</td>
			                                <td>${ p.pdetail }</td>
			                                <td style="color : #467355">${ p.pamount }</td>
			                            </tr>
		                            </c:forEach>
								</tbody>
	                        </table> 
                        </div>
	                     <div id="searchArea">
							<table>
								<tr>
									<td style="padding-top : 15px;">
										<input type="date" id="startDate" name="startDate" style="margin-top: -5%;">
									</td>
									<td>	
										<div class="radio-group" style="height : 51px; margin-left : 7px; margin-top : 5px;">
											<input type="radio" id="option-one" name="selector" class="seRadio" value="1개월">
											<label for="option-one" class="seLabel" style="padding-top : 0px; paddig-bottom: 0px;">1개월</label>
											<input type="radio" id="option-two" name="selector" class="seRadio" value="3개월">
											<label for="option-two" class="seLabel" style="padding-top : 0px; paddig-bottom: 0px;">3개월</label>
											<input type="radio" id="option-three" name="selector" class="seRadio" value="6개월">
											<label for="option-three" class="seLabel" style="padding-top : 0px; paddig-bottom: 0px;">6개월</label>
											<input type="hidden" name="usno" id="usno" value=${ loginUser.usno }>
										</div>
									</td>
									<td style="padding-top : 5px;"> <button type="button" id="searchThisBtn">검색</button></td>
								</tr>
							</table>

							<!-- </form> -->
	                    </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
	
   <script>
	function goToPoint(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/point?usno='+${loginUser.usno};
	};
  </script>
  
  <!-- 결제API -->
  <script>

  	$("#payBtn").click(function() {
  		
  		var name = $('input[name="cAmount"]:checked').val();
  		
  		var amount = 0;
  		if(name == '3만원 충전'){
  			amount = 300;
  		} else if(name == '6만원 충전'){
  			amount = 200;
  		} else{
  			amount = 100;
  		}
  		
  		console.log(name);
  		
	    var IMP = window.IMP;
	    IMP.init('imp34313892');
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : name,
	        amount : amount,
	        buyer_email : "${loginUser.usemail}",
	        buyer_name : "${loginUser.usname}",
	        buyer_tel : "${loginUser.usphone}",
	        buyer_addr : '',
	        buyer_postcode : ''
	    }, function(rsp) {
	        if ( rsp.success ) {
	            var msg = '결제가 완료되었습니다!';
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            location.href = '${contextPath}/mypage/payment?amount='+amount+'&item='+name+'&usno='+${loginUser.usno};
	        } else {
	            var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
	        }
	    
	        alert(msg);
	    });
  	});
    </script>
    
	<!-- 검색 AJAX -->
	<script>
		$(function(){
			$("#searchThisBtn").on("click", function(){
				var selector = $('input[name="selector"]:checked').val();
				console.log(selector);
				
				var startDate = $('#startDate').val();
				console.log(startDate);
				
				var usno = ${ loginUser.usno };
				console.log(usno);
				
				var searchPo = new Object();
				searchPo.selector = selector;
				searchPo.startdate = startDate;
				searchPo.usno = usno;
				console.log(searchPo);
				
				$.ajax({
					url : "searchPeriod",
					data : JSON.stringify(searchPo),
					type : "POST",
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						console.log(data);
						
						tableBody =$("#pointTable tbody");
						tableBody.html("");
						
						for(var i in data){
							var pdateFormat = new Date(data[i].pdate);
							pdateFormat = getFormatDate(pdateFormat);
							
							var tr = $("<tr>");
							var pdate = $("<td>").text(pdateFormat);
							var pdetail = $("<td>").text(data[i].pdetail);
							var pamount = $("<td>").text(data[i].pamount);
							
							tr.append(pdate, pdetail, pamount);
							tableBody.append(tr);
						}
					},
					error : function(e){
						alert("error code : " + e.status + "\n"
								+ "message : " + e.responseText);
					}
				});
			});
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
</body>
</html>