<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_adver</title>

    <!-- 차트 링크 --> 
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

    #adverBox{
        display: flex;
        width : 100%;
        margin-top : 4%;
    }

    #leftAdverBox{
        order : 1;
        width : 35%;
        margin-left : 5%;
        margin-top : 10px;
        margin-bottom: 10px;
        margin-right : 10px;
    }

    #adverContainer{
        background-color: white;
        height : 98%;
        width : 100%;
    }

    #bannerAdverBox{
        border : 1px solid #463755;
        border-radius: 3px;
        width : 80%;
        margin-left : 10%;
        margin-right : 10%;
        margin-bottom: 5%;
    }

    #primeumAdverBox{
        border : 1px solid #463755;
        border-radius: 3px;
        width : 80%;
        margin-left : 10%;
        margin-right : 10%;
        margin-bottom: 5%;
    }

    #rightAdverBox{
        order : 2;
        width : 53%;
        margin : 10px;
    }

    #topAdverBox{
        background-color: white;
        text-align: center;
        /* margin-top : 3%; */
        margin-bottom: 3%;
        /* padding : 5%; */
        height : 18%;
        padding-top : 1%;
        padding-bottom : 5%
    }

    #topAdverBox h2{
        /* border : 1px solid red; */
        height : 100%;
    }

    #topAdverBox b{
        font-size: 70px;
        margin-bottom : 10%;
        /* border : 1px solid blue; */
        margin-top : 5%;
        padding-bottom: 5%;
    }

    #bottomAdverBox{
        background-color: white;
        text-align: center;
        padding : 5%;
        height : 53.5%;
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
    <!--부트스트랩-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <div id="back">
        <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
        <section class="page-start">
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/adverW.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="adverBox">
                    <div id="leftAdverBox">
                        <div id="adverContainer">
                            <br>
                            <h3 style="color: #467355; margin-left : 10%;">진행중인 광고</h3>
                            <div id="bannerAdverBox">
                                <h3 style="color: #467355; text-align:center;">메인 페이지 매너 광고</h3> 

                                <p style="text-align: center; font-size: small;">사업장 이름 : 바라 솔솔 감귤농장</p>
                                <p style="text-align: center; font-size: small;">신청일 : 21.02.22</p>
                                <p style="text-align: center; font-size: small;">승인일 : 21.02.24</p>
                            </div>
                            <div id="primeumAdverBox">
                                <h3 style="color: #467355; text-align:center;">프리미엄 광고</h3> 

                                <p style="text-align: center; font-size: small;">사업장 이름 : 바라 솔솔 감귤농장</p>
                                <p style="text-align: center; font-size: small;">결제일 : 21.02.22</p>
                                <p style="text-align: center; font-size: small;">등록번호 : 033</p>
                            </div>
                        </div>
                    </div>
                    <div id="rightAdverBox">
                        <div id="topAdverBox">
                            <h2 style="color: #467355;">실시간 누적 클릭 수 : &nbsp; <b id="boldText">138,330</b> 회</h2>
                        </div>
                        <div id="bottomAdverBox">
                            <div class="container"> 
                                <canvas id="myChart"></canvas> 
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
    </div>
    <script>
        var ctx=document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            type='line',

            data : {
                labels : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets : [{
                    labels : 'Advertisement Click',
                    backgroundColor : 'transparent',
                    borderColor : 'green',
                    data : [0, 10, 5, 2, 20, 30, 45]
                }]
            },

            option:{}
        })
    </script>
    
</body>
</html>