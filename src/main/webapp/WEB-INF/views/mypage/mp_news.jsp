<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height : 700px;
    }

    #alertBox{
        position : absolute;
        top:27%;
        left : 5%;
        /* border: 1px solid black; */
        width : 73%;
    }

    #alertTable{
        color : black;
        /* border : 1px solid blue; */
        width : 100%;
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

                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellW.png" class="btnImg"> <br> 내 소식</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                
            </div>
        </section>
    </div>
        <div id="alertBox">
            <h2>내 소식</h2>
            <table id="alertTable"> 
                <tr>
                    <th>1.</th>
                    <td>사용자님께서 커뮤니티에 작성하신 글에대한 신고가 접수되었습니다.</td>
                </tr>
                <tr>
                    <th>2.</th>
                    <td>사업장 번호 0001에 대한 광고 신청이 승인되었습니다.</td>
                </tr>
            </table>
        </div>
    
</body>
</html>