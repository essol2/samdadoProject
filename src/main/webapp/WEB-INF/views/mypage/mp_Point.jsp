<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_point</title>
</head>
<style>

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

    #rightArea{
        order : 2;
        background-color: white;
        width : 40%;
        height : 510px;
        margin : 10px;
        margin-top : 2.5%;
/*         margin-bottom : 5%; */
    }

    #topArea{
        background-color: white;
        text-align: center;
        margin-top : 5%;
        margin-bottom: 5%;
        padding : 5%;
        height : 220px;
    }

    #bottomArea{
        background-color: white;
        text-align: center;
        padding : 5%;
        margin-bottom : 3%;
        height : 260px;
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
    
    [type="radio"]:checked,
	[type="radio"]:not(:checked){
		position: absolute;
		left: -9999px;
		width: 0;
		height: 0;
		visibility: hidden;
	}
	
	.cAbountBtn:checked + label,
	.cAbountBtn:not(:checked) + label{
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
 	
 	.cAbountBtn:not(:checked) + label{
 		background-color : white;
 		box-shadow: 3px 3px 0 0 gray;
 	}
 	
 	.cAbountBtn:checked + label{
	 	background-color: #467355;
	 	color : white;
		box-shadow: 3px 3px 0 0 gray;
 	}
 	
 	.cAbountBtn:not(:checked) + label{
 		box-shadow: 3px 3px 0 0 gray;
 	}
 	
 	.cAbountBtn:checked + label span,
	.cAbountBtn:not(:checked) + label span{
		display: block;
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
                                <h1 style="text-align: center;">128,000</h1>
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
                        <h2 style="color:#467355; text-align : center; margin-top : 4%;">포인트 사용내역</h2>
                        <hr style="background-color: #467355; width : 100%; "> 
                        <table id="pointTable">
                            <tr>
                                <th>날짜</th>
                                <th>내용</th>
                                <th>금액</th>
                            </tr>
                            <tr>
                                <td>21.03.02</td>
                                <td>충전</td>
                                <td style="color : #467355">+300,000</td>
                            </tr>
                            <tr>
                                <td>21.03.03</td>
                                <td>배너클릭</td>
                                <td style="color : red;">-500</td>
                            </tr>
                        </table>
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
    
</body>
</html>