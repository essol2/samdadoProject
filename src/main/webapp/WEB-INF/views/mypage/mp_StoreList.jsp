<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: fit-content;
        /* margin: auto; */
        top: 0;
    }
    
    body{
        background-image: url('${contextPath}/resources/images/${contextPath}/resources/images/image_mp/backgroundImg.png');
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

    .menuBox{
        width : 95%;
        height : 150px;
        /* border : 1px solid blue; */
        display : inline-block;
        position:relative;
        top : -10%;
        left : 3%;
        margin-left : 3%;
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
        top : 20%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : 100%;
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
        width : 45%;
        text-align: right;
        padding : 5px;
    }

    #rightInfoBox{
        order : 2;
        /* border : 1px solid blue; */
        width : 55%;
    }

    .btnForBusiness{
        border-style: none;
        background-color : #467355;
        color : white;
        padding : 10px;
    }

    #infoTextTable th{
        text-align: left;
        padding-right : 10px;
    }

    #infoTextTable td{
        font-size: small;
        color : #467355;
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

    @media (max-width:1650px){
         /* 마이페이지 css */
            body{
                background-image: url('${contextPath}/resources/images/image_mp/backgroundImg.png');
                /* background-repeat: no-repeat; */
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
                height : fit-content;
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

                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeW.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="businessSplit">
                    <br>
                    <h3 style="text-align: center;">바람솔솔 감귤농장</h3>
                    <hr style="background-color: #467355; width : 60%; height: 2px;">
                    <div id="busiInfoBox">
                        <div id="leftImgBox">

                            <img src="${contextPath}/resources/images/image_mp/image34.png" alt="" class="businessImg">

                        </div>
                        <div id="rightInfoBox">
                            <table id="infoTextTable">
                                <tr>
                                    <th>사업장 번호</th>
                                    <td>SB0001</td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>064)123-1234</td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>제주특별자치도 석귀포시 색달동 중문관광로 72번길 75</td>
                                </tr>
                                <tr>
                                    <th>등록일</th>
                                    <td>2021.05.03</td>
                                </tr>
                                <tr>
                                    <th>진행중인 광고</th>
                                    <td>배너광고, 프리미엄 광고</td>
                                </tr>
                            </table>
                            <div id="btnArea">
                                <br>
                                <button class="btnForBusiness" id="viewDetailBtn">사업장 페이지로 이동</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="businessSplit"></div>
                    <br>
                    <h3 style="text-align: center;">바람솔솔 감귤농장</h3>
                    <hr style="background-color: #467355; width : 60%; height: 2px;">
                    <div id="busiInfoBox">
                        <div id="leftImgBox">

                            <img src="${contextPath}/resources/images/image_mp/image34.png" alt="" class="businessImg">

                        </div>
                        <div id="rightInfoBox">
                            <table id="infoTextTable">
                                <tr>
                                    <th>사업장 번호</th>
                                    <td>SB0001</td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>064)123-1234</td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>제주특별자치도 석귀포시 색달동 중문관광로 72번길 75</td>
                                </tr>
                                <tr>
                                    <th>등록일</th>
                                    <td>2021.05.03</td>
                                </tr>
                                <tr>
                                    <th>진행중인 광고</th>
                                    <td>배너광고, 프리미엄 광고</td>
                                </tr>
                            </table>
                            <div id="btnArea">
                                <br>
                                <button class="btnForBusiness" id="viewDetailBtn">사업장 페이지로 이동</button>
                            </div>
                        </div>
                    </div>
                    <div id="newBusiBtnArea">
                        <button id="newBusiBtn">사업장 추가하기</button>
                    </div>
                </div>
             
            </div>
           
        </section>
    </div>

    
</body>
</html>