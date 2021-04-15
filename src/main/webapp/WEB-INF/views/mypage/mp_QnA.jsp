<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_Q&A</title>
</head>
<style>

    /* 폰트 */
    * {
         font-family: 'Jeju Myeongjo', serif;
    }

    /*마이페이지 css*/
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

    #leftBox{
        width: 100%;
        border-right : thick double white;
        display : inline-block;
    }

    #memInfoTable{
        width : 90%;
        margin-left : 5%;
        margin-top : 1.5%;
        /* border : 1px solid red; */
    }

   #memInfoTable td, #memInfoTable tr{
        border-bottom : 1px solid lightgray; 
        border-collapse: collapse;
        padding : 15px;
        padding-top : 25px;
        padding-bottom: 25px;
   }

   #memInfoTable th{
        width : 130px;
        text-align: right;
        font-size: small;
        border-right : 1px solid lightgray;
        border-bottom : 1px solid lightgray;
        padding : 15px;
        margin-left : 5%;
   }

    #changePwdBtn, #memOut, #changeInfo{
        background-color: #467355;
        border-style: none;
        color : white;
        padding : 5px;
    }

    #specificCon{
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

    #qcont{
        margin-left : 25%;
        margin-right : 10%;
    }

    #subBtn{
        background-color: #467355; 
        color:white; 
        border-radius: 5px; 
        border-style: none;
        padding : 5px;
        width : 30%;
        height : 20%;
        cursor: pointer;
        margin-left : 35%;
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

    <div id="back">
         <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
        <section class="page-start">
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/buserinfo'"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToBuss();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToAdvert();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToPoint()"> <div class="menuBoxEle" onclick="location.href='${ contextPath }/mypage/point'"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="location.href='${ contextPath }/mypage/gotoqna'"> <div class="menuBoxEle" onclick="location.href='${ contextPath }/mypage/gotoqna'"><br><img src="${contextPath}/resources/images/image_mp/qnaW.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
               <div id="contextArea">
                    <br><br>
                   <h1 style="text-align: center; color: #467355;">관리자에게 문의 보내기.<br></h1>
                   <form action="${ contextPath }/mypage/sendQnA" method="POST" onsubmit="return submitValidate();">
	                   <p style="text-align: center; font-size: small;">삼다도에 대한 어떤 문의든 남겨주세요. 답변은 최대 3일 소요될 수 있습니다. &nbsp(주말, 공휴일 제외)<br><br>
	                    최대한 빨리 답변 드리도록 하겠습니다.<br><br>
	                    답변은 ‘내소식' 메뉴에서 확인하실 수 있습니다.</p>
	                    <p><textarea cols="80" rows="10" id="qcont" name="qcont"></textarea></p>
	                    <input type="hidden" name="usno" id="usno" value="${ loginUser.usno }">
	                    <input type="submit" value="전송" id="subBtn">
	                    <br><br>
	               </form>
               </div>
            </div>
        </section>
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
	</script>
    
</body>
</html>