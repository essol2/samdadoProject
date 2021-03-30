<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_route</title>
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
        /* background-repeat: no-repeat; */
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
    /* mainBox */
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

    #tripTopBox{
        display: flex;
    }

    #mapArea{
        order : 1;
        width : 75%;
        /* border : 1px solid red; */
        margin : 1%;
    }
    #jejuMapImg{
        width:100%;
        height : auto;
    }

    #reserveInfoArea{
        order : 2;
        width : 20%;
        border : 2px solid #467355;
        background-color: white;
        font-size: small;
        padding : 1%;
        margin : 1%;
    }

    .dotImg{
        /* border : 1px solid pink; */
        margin-top : 3px;
        height : 10px;
        display: inline-block;
    }

    .forLineMath{
        display: inline-block;   
        height : auto;
        /* margin-bottom: 5px; */
        /* border : 1px solid yellowgreen; */
    }

    .tripReservInfoBox{
        background-color: white;
        border : 2px solid #467355;
        width : 98%;
        height: fit-content;
        margin-left : 1%;
        margin-right : 1%;
        margin-bottom: 1%;
    }

    #rinfoText{
        display : block;
        margin-top : 3%;
        margin-left:3%;
    }

    .routesBox{
        display : flex;
        /* border : 1px solid blueviolet; */
        width : 94%;
        margin-left : 3%;
        margin-right : 3%;
        padding-bottom : 3%;
        align-items: center;
    }

    .routeInfoBox{
        display : inline-block;
        border : 2px solid #467355;
        /* margin : 3px; */
        margin-left : auto;
        margin-right : auto;
        height : 200px;
        /* order : 1; */
        text-align: center;
    }

    .rArrowArea{
        display : inline-block;
        /* border : 1px solid blue; */
        height : 30px;
        margin-top : 5%;
        margin-bottom : 5%;
        padding-top:3%;
        padding-bottom:3%;
    }

    .noRouteBox{
        /* border : 1px solid pink; */
        text-align : center;
        align-items: center;
        margin-left : auto;
        margin-right : auto;
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
                height : 60px;
                /* border : 1px solid yellow; */
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
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingB.png" class="btnImg"> <br> 내 예약</div></button>
                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripW.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="tripContainer">
                    <div id="tripTopBox">
                        <div id="mapArea">

                            <img src="image_mp/jejuMap.png" alt="" id="jejuMapImg">

                        </div>
                        <div id="reserveInfoArea">
                            <h3 style="color:#467355;"> 여행정보</h3>
                            <br>

                            <img src="${contextPath}/resources/images/image_mp/dot.png" class="dotImg"> <div class="forLineMath">동행자</div>
                            <p>3명</p>
                            <br>
                            <img src="${contextPath}/resources/images/image_mp/dot.png" class="dotImg"> <div class="forLineMath">여행일자</div>
                            <p>21.05.04 화 - 21.05.06 목 (2박 3일)</p>
                            <br>
                            <img src="${contextPath}/resources/images/image_mp/dot.png" class="dotImg"> <div class="forLineMath">비행기</div>
                            <p>김포-제주 13:02 제주항공</p>
                            <p>제주-김포 18:30 대한항공</p>
                            <br>
                            <img src="${contextPath}/resources/images/image_mp/dot.png" class="dotImg"> <div class="forLineMath">예상경비</div>

                            <p>총 318,000원</p>
                            <p style="color: red;">(길에 포함된 호텔, 교통, 입장권, 체험권의 합계 입니다.)</p>
                        </div>

                    </div>
                    <div class="tripReservInfoBox">
                        <div id="rinfoText"><h3 style="font-size: medium;">1일차. (소요시간 : 10시간)</h3></div>
                        <div class="routesBox">
                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">
                                    <img src="${contextPath}/resources/images/image_mp/kimpoAirport.png" alt="">
                                </div>
                                <div class="rNameArea">
                                    <p>제주공항</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/hostel.png" alt="">
                  </div>
                                <div class="rNameArea">
                                    <p>삼삼 게스트 하우스</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">
               </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/kimpoAirport.png" alt="">
                  </div>
                                <div class="rNameArea">
                                    <p>제주공항</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/hostel.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>삼삼 게스트 하우스</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/hostel.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>삼삼 게스트 하우스</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tripReservInfoBox">
                        <div id="rinfoText"><h3 style="font-size: medium;">1일차. (소요시간 : 10시간)</h3></div>
                        <div class="routesBox">
                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/kimpoAirport.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>제주공항</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/hostel.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>삼삼 게스트 하우스</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/kimpoAirport.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>제주공항</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/hostel.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>삼삼 게스트 하우스</p>
                                </div>
                            </div>

                            <div class="rArrowArea">

                                <img src="${contextPath}/resources/images/image_mp/arrow.png">

                            </div>

                            <div class="routeInfoBox">
                                <div class="rInfoImgArea">

                                    <img src="${contextPath}/resources/images/image_mp/hostel.png" alt="">

                                </div>
                                <div class="rNameArea">
                                    <p>삼삼 게스트 하우스</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tripReservInfoBox">
                        <div id="rinfoText"><h3 style="font-size: medium;">2일차.</h3></div>
                        <div class="routesBox">
                            <div class="noRouteBox">

                                <img src="${contextPath}/resources/images/image_mp/noRoute.png" alt=""><br>

                                <p>아직 저장된 길이 없습니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
 
</body>
</html>