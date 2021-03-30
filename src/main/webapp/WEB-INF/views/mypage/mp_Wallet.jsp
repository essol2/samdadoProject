<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_wallet</title>
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
    /* mainBox */
    #mainBox{
        position : absolute;
        top : 25%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : 500px;
        position : absolute;
    }

    table{
        width : 98%;
        margin : 1%;
    }

    table, table tr,table td, table th{
        border : 1px solid lightgray;
        border-collapse: collapse;
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
    }
    .preWalDate{
        width: 100%;
        border-style: none;
        cursor: pointer;
        margin : 0;
        padding: 0;
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
        width : 8%;
    }

    .walletStatus{
        width : 7%;
    }

    .walletTouch{
        width : 6%;
        padding-left : 1%;
    }

    .walletPerson{
        width : 10%;
    }

    .walletMidTable th{
        background-color: rgb(228, 228, 228);
        color : gray;
    }

    .walletMidTable td{
        padding-top : 0.5%;
        padding-bottom: 0.5%;
        background-color: white;
        font-size: small;
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

    .walletBottomTable{
        margin-top : 10%;
        text-align: center;
        background-color: white;
        height: 40px;
        font-size: medium;
    }

    .walletTopTable{
        height : 40px;
        background-color: white;
        font-size: medium;
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
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행</div></button>
                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/walletW.png" class="btnImg"> <br> 내 지갑</div></button>

                </div>
            </div>

            <div id="mainBox">
                <table class="walletTopTable">
                    <tr>
                        <th class="thisWalletPage">예산세우기</th>
                        <td class="clickedPreWallet"><button class="preWalDate" id="clickedDate">21.5.4(1일차)</button></td>
                        <td class="unclickedPreWallet"><button class="preWalDate" id="unclickedDate">21.5.4(1일차)</button></td>
                        <td class="unclickedPreWallet"><button class="preWalDate" id="unclickedDate">21.5.4(1일차)</button></td>
                        <td id="forTopBlank">&nbsp</td>
                        <td class="newWalletBtn"><button class="addingNew" id="nowPrewallet"><b>새 예산 넣기 +</b></button></td>
                    </tr>
                </table>
                <table class="walletMidTable">
                    <thead>
                      <tr>
                        <th class="walletName">이름</th>
                        <th class="walletCate">구분</th>
                        <th class="walletPrice">가격</th>
                        <th class="walletPayDate">결제일자</th>
                        <th class="walletStatus">상태</th>
                        <th class="walletTouch">더치페이</th>
                        <th class="walletPerson">1인 가격</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="walletName">다수농장 - 감귤따기 체험</td>
                        <td class="walletCate"> DAY1. 루트예약</td>
                        <td class="walletPrice">15,000원</td>
                        <td class="walletPayDate">21/03/04</td>
                        <td class="walletStatus">결제완료</td>
                        <td class="walletTouch">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </td>
                        <td class="walletPerson">약 : 15,000원</td>
                      </tr>
                      <tr>
                        <td class="walletName">삼삼렌트 + 보험</td>
                        <td class="walletCate">삼다도예약 - 교통비</td>
                        <td class="walletPrice">135,000원</td>
                        <td class="walletPayDate">21/03/04</td>
                        <td class="walletStatus">결제완료</td>
                        <td class="walletTouch">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </td>
                        <td class="walletPerson">약 : 45,000원</td>
                      </tr>
                      <tr>
                        <td class="walletName">귤귤 게스트 하우스 + 조식</td>
                        <td class="walletCate">삼다도예약 - 숙박</td>
                        <td class="walletPrice">48,000원</td>
                        <td class="walletPayDate">21/03/05</td>
                        <td class="walletStatus">현장지불</td>
                        <td class="walletTouch">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </td>
                        <td class="walletPerson">약 : 16,000원</td>
                      </tr>
                      <tr>
                        <td class="walletName">테디베어 박물관</td>
                        <td class="walletCate">직접입력 - 관광지 입장권</td>
                        <td class="walletPrice">9,900원</td>
                        <td class="walletPayDate">21/03/06</td>
                        <td class="walletStatus">결제완료</td>
                        <td class="walletTouch">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </td>
                        <td class="walletPerson">약 : 9.900원</td>
                      </tr>
                      <tr>
                        <td class="walletName">기름값</td>
                        <td class="walletCate">직접입력 - 교통비</td>
                        <td class="walletPrice">100,000원</td>
                        <td class="walletPayDate">21/03/07</td>
                        <td class="walletStatus">현장지불</td>
                        <td class="walletTouch">
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </td>
                        <td class="walletPerson">약 : 33,000원</td>
                      </tr>
                    </tbody>
                  </table>
                  <table class="walletBottomTable">
                      <tr>
                          <th class="thisWalletPage">일정</th>
                          <td id="clickedWallet"><button class="preWalDate" id="clickedDate">예산세우기</button></td>
                          <td id="unClickedWallet"><button class="preWalDate" id="unclickedDate">가계부1</button></td>
                          <td id="unClickedWallet"><button class="preWalDate" id="unclickedDate">가계부2</button></td>
                          <td id="forBottomBlank">&nbsp</td>
                          <td id="numberTd"><input type="number" id="quantityTogether" name="quantity" min="1" max="10"></td>
                          <td id="howManyPeople">동행자수</td>
                      </tr>
                  </table>
            </div>
        </section>
    </div>
 
</body>
</html>