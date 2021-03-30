<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        background-repeat: no-repeat;
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
        margin-left : 3%;
    }
    .menuBox{
        width : 55%;
        height : 150px;
        /* border : 1px solid blue; */
        display : inline-block;
        position:relative;
        top : -60%;
        left : 3%;
        margin-left : 3%;
        align-items: center;
    }
    .menuButton{
        width : 150px;
        height : 110px;
        border : 1px solid white;
        background-color: white;
        color : #bfbfbf;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 5%;
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
        margin-left : 6%;
    }

    .btnImg{
        width: 60px;
        height : 60px;
        /* border : 1px solid yellow; */
    }

    .clickedBtn{
        box-shadow: 3px 3px gray;
        width : 150px;
        height : 110px;
        border : 1px solid #467355;
        background-color:#467355;
        color : white;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 1%;
        border-radius: 2px;
        align-items: center;
    }

    .clickedBtn:hover{
        box-shadow: 6px 6px gray;
        cursor: pointer;
    }
    /* 마이페이지 - mainBox */
    #mainBox{
        position : absolute;
        top : 25%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : fit-content;
        position : absolute;
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
            #countDday{
                /* border : 1px solid pink; */
                display : inline-block;
                position : absolute;
                width : 20%;
                height : 150px;
                color : white;
                text-align : center;
                font-size: 30px;
                margin-left : 3%;
            }
            .menuBox{
                width : 70%;
                height : 150px;
                /* border : 1px solid blue; */
                display : inline-block;
                position:relative;
                top : 0;
                left : 25%;
                margin-left : 3%;
                align-items: center;
            }
            .menuButton{
                width : 130px;
                height : 110px;
                border : 1px solid white;
                background-color: white;
                color : #bfbfbf;
                text-align : center;
                display : inline-block;
                margin-top : 2%;
                margin-left : 2.5%;
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
                /* height : 60px;
                border : 1px solid yellow; */
            }

            .clickedBtn{
                box-shadow: 3px 3px gray;
                width : 130px;
                height : 110px;
                border : 1px solid #467355;
                background-color:#467355;
                color : white;
                text-align : center;
                display : inline-block;
                margin-top : 2%;
                margin-left : 2.5%;
                border-radius: 2px;
                align-items: center;
            }

            .clickedBtn:hover{
                box-shadow: 6px 6px gray;
                cursor: pointer;
            }

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

                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록</div></button>
                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingW.png" class="btnImg"> <br> 내 예약</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="leftBox" class="reservBox"> 
                    <h3 style="color: #467355; text-align: center;">숙박 예약 내역</h3>
                    <hr style="background-color: #467355; width : 90%; height: 2px;">
                    <h5>제주 신라 호텔</h5>
                    <div class="reservDetail">
                        <div class="reserveContainer">

                            <img src="${contextPath}/resources/images/image_mp/calendar.png" alt="" class="reservIcon">&nbsp 21.05.04 ~ 21.05.07 (3박 4일)<br><br>
                            <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon">&nbsp 스탠다드 트윈룸, 정원 전망<br><br>
                            <img src="${contextPath}/resources/images/image_mp/credit_card.png" alt="" class="reservIcon">&nbsp 134,400 (결제완료)<br><br>
                            <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon">&nbsp 제주특별자치도 석귀포시 색달동 중문관광로 72번길 75<br><br>
                            <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon">&nbsp 064) 735-5114<br><br>
                            <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp 조식미포함<br>

                        </div>
                        <div class="reserveBtnArea">
                            <button class="reserveBtn" id="cancleResv">예약 취소</button>
                            <button class="reserveBtn" id="detailResv">상세페이지</button><br>
                        </div>
                    </div>
                </div>

                <div id="middleBox" class="reservBox">
                    <h3 style="color: #467355; text-align: center;">렌트카 예약 내역</h3>
                    <hr style="background-color: #467355; width : 90%; height: 2px;">
                    <h5>SK렌트카</h5>
                    <div class="reservDetail">
                        <div class="reserveContainer">

                            <img src="${contextPath}/resources/images/image_mp/calendar.png" alt="" class="reservIcon">&nbsp 21.05.04 ~ 21.05.07 (3박 4일)<br><br>
                            <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon">&nbsp 스탠다드 트윈룸, 정원 전망<br><br>
                            <img src="${contextPath}/resources/images/image_mp/credit_card.png" alt="" class="reservIcon">&nbsp 134,400 (결제완료)<br><br>
                            <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon">&nbsp 제주특별자치도 석귀포시 색달동 중문관광로 72번길 75<br><br>
                            <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon">&nbsp 064) 735-5114<br><br>
                            <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp 조식미포함<br>

                        </div>
                        <div class="reserveBtnArea">
                            <button class="reserveBtn" id="cancleResv">예약 취소</button>
                            <button class="reserveBtn" id="detailResv">상세페이지</button><br>
                        </div>
                    </div>
                </div>

                <div id="rightBox" class="reservBox">
                    <h3 style="color: #467355; text-align: center;">입장권&체험권 예약 내역</h3>
                    <hr style="background-color: #467355; width : 90%; height: 2px;">
                    <h5>서귀포 감귤농장 체험장</h5>
                    <div class="reservDetail">
                        <div class="reserveContainer">

                            <img src="${contextPath}/resources/images/image_mp/calendar.png" alt="" class="reservIcon">&nbsp 21.05.04 ~ 21.05.07 (3박 4일)<br><br>
                            <img src="${contextPath}/resources/images/image_mp/tag-outline.png" alt="" class="reservIcon">&nbsp 스탠다드 트윈룸, 정원 전망<br><br>
                            <img src="${contextPath}/resources/images/image_mp/credit_card.png" alt="" class="reservIcon">&nbsp 134,400 (결제완료)<br><br>
                            <img src="${contextPath}/resources/images/image_mp/location_outline.png" alt="" class="reservIcon">&nbsp 제주특별자치도 석귀포시 색달동 중문관광로 72번길 75<br><br>
                            <img src="${contextPath}/resources/images/image_mp/phone_outline.png" alt="" class="reservIcon">&nbsp 064) 735-5114<br><br>
                            <img src="${contextPath}/resources/images/image_mp/warning_outline.png" alt="" class="reservIcon">&nbsp 조식미포함<br>

                        </div>
                        <div class="reserveBtnArea">
                            <button class="reserveBtn" id="cancleResv">예약 취소</button>
                            <button class="reserveBtn" id="detailResv">상세페이지</button><br>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
 
</body>
</html>