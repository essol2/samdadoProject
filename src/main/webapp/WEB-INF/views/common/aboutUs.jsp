<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Samdado</title>
    <style>

        * {
            font-family: 'Jeju Myeongjo', serif;
        }
        
        body{
        	margin : 0px;
        }

        .text1{
            font-size: 80px;
            margin-right: 0px;
            margin-left: 12%;
            color : white;
        }

        .text2{
            font-size: 15px;
            margin-left: 0px;
            color : white;
        }
        
        .main_text { 
            position: absolute;
            top: 55%;
            writing-mode: vertical-rl;
            text-orientation: mixed;
            padding-left: 3%;
        }
        
        #content1 {
            margin-bottom: 2%;

        }

        .ad_text {
            border: 1px solid black;
            border-radius: 10px 10px;
            width: 650px;
            height: auto;
            margin-right: 10%;
            margin-top: 1%;
        }
        
        #ad_box{
            padding-top: 5%;
            padding-left: 15%;
        }

        #content2 .textArea3{
            padding-top: 15%;
            text-align: center;
        }

        #textArea p {
            margin-top: 35%;
            
            text-align: center;
        }

        #textArea{
            display: inline-block;
           
        }

        .content2{            
            position: relative;
            width:100%;
            height: auto;
            padding-top: 10%; 
        }

        .image{
            position: absolute;           
            width: 100%;
            float: left;
            margin-left: 1.5%;
        }

        .text2{
            text-align: center;    
        }

        .mainimage{            
            width: 24%;
        }

        .gif_box{
           padding-top: 25%;
        }
    </style>

</head>
<body>
        <!-- 이미지 -->
        <div class="row" style="height: 100vh;"> <!-- height: 100vh; 여기 사이즈를 줄이면서 내용을 넣으삼 -->
            <div class="card bg-dark text-white">
                <img src="${contextPath}/resources/images/image_about/aboutUs.jpg" class="card-img" alt="..." width="100%" height="870px" style="filter: brightness(70%); padding:0px; margin:0px;">
                <div class="main_text">
                    <p class="text2">우리가 사랑하는 제주도의 또다름 이름.</p>
                    <b class="text1">삼 다 도</b>
                </div>
              </div>
        </div>
            
        <div class="col" id="textArea">
                <p style="font-size: 20px;" >
                    <b style="font-size: 50px;">또시 꼽 옵서양</b><br><br>
                    여행은 출발하기도 전부터<br>
                    행복한 상상을 가져다주죠.<br>
                    한국인들이 사랑하는 제주도에서<br>
                    여러분들의 상상이<br>
                    현실이 되는 순간만을 기다리고 있어요.<br>
                </p>
        </div>
            <div class="col">
                <img src="${contextPath}/resources/images/image_about/image59.png" alt="..." width="90%" height="870px" style="float: right;">
            </div>

        <!-- 아래 컨텐츠 2 -->
        <div class="row">
            <div class="col">
                <img src="${contextPath}/resources/images/image_about/jaju.png" alt="..." width="96%" height="870px">
            </div>

            <div class="col" id="content2">
              <p class="textArea3" style="font-size: 20px;">
                <b style="font-size: 50px;">많이 팝서,<br>다시 오꾸다양</b><br><br>
                제주 여행 제휴 마케팅 1등<br>
                삼다도와 함께해요 :)<br>
                심플하지만 실속있는 고효율 광고<br>
                마케팅으로 브랜드 인지도와<br>
                구매전환율을 높여보세요.<br>
              </p>

                <!-- 광고 박스 -->
                <div id="ad_box">
                <div class="ad_text">
                    <p >선택 1. 배너 광고<bR>
                    포인트 충전 CPC 광고<br>
                    첫 페이지에 갤러리 형식으로 배너 업로드<br>
                    최소 300000만원 충천<br>
                    1회 클릭 당 100원 차감<br>
                    관리자 심사 후 광고 진행</p>
                    <p style="font-size: 9px; color: red; margin-top: 0%;">기재 링크와 이미지가 동일하지 않을 시 반려될 수 있습니다.</p>
                </div>
                <div class="ad_text">
                    <p>선택 1. 프리미엄 광고<br>
                    프리미엄 서비스 구매 시 상위노출 혜택<br>
                    이미지 확대 + 프리미엄 아이콘 부여</p>
                </div>
            </div>
            </div>
          </div>
          
          <section class="content2">
              <div class="text2">
                  <h1>@삼다도 인스타그램</h1>
                  <h1># 제주  # 제주 여행 # 제주도</h1>
              </div>
              <div class="image">
                  <img class="mainimage" src="${contextPath}/resources/images/image_about/image60.png">
      
                  <img class="mainimage" src="${contextPath}/resources/images/image_about/IMG_4252.png">
             
                  <img class="mainimage" src="${contextPath}/resources/images/image_about/image57.png">
              
                  <img class="mainimage" src="${contextPath}/resources/images/image_about/image58.png">
              </div>
          </section>

        <section class="gif_box">
            <img src="${contextPath}/resources/images/image_about/moveSamdado.gif" width="100%" height="870px ">
        </section>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
    -->
</body>
</html>