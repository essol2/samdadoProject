<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Samdado</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
    <style>

        * {
            font-family: 'Jeju Myeongjo', serif;
        }
   .container--fluid{
   		width : 100%;
   }
	
		body{
			margin : 0;
			padding : 0;
			background-image: url("${contextPath}/resources/images/image_aboutUs/aboutUs.jpg");
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    background-size : 100% 870px;
		    width : 100%;
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
        }
        
        .main_text { 
            position: absolute;
            top: 55%;
            writing-mode: vertical-rl;
            text-orientation: mixed;
            padding-left: 3%;
        }
        
        #content1 {
            /* margin-bottom: 2%; */

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
            width : 100%;
            padding-top : 1%;
            padding-bottom : 1%;
            background-color : white;
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
        }

        .text2{
            text-align: center;    
        }

        .mainimage{            
            width: 24%;
        }

        .gif_box{
           padding-top: 24.1%;
        }
        #imagesBox{
        	background-color : white;
        	margin-top : 5%;
        	padding-bottom : 5%;
        	text-align : center;
        	width:
        }
        .infoImg{
        	display : inline-block;
        	width : 20%;
        	/* border : 2px solid red; */
        	margin : 4%;
        }
        
        #adinfo{
        	padding-top : 5%;
        	padding-bottom : 10%;
        	background-color : white;
        }
        
        .card-img{
        	background-attachment : fixed;
        }
        
        #iconImg{
        	float : right;
        	padding : 2%;
        	width : 50px;
        }
    </style>

</head>
<body>
    <div class="container--fluid">
        <!-- 이미지 -->
        <div class="row" style="height: 100vh;">
            <div class="card bg-dark text-white">
            <div id="icon" style="width:100%">
            <a href="${contextPath}/main">
           <img src="${contextPath}/resources/images/image_main/logo_w.png" alt="..." id="iconImg">
           </a>
            </div>
                <div class="main_text">
                    <p style="color : white;">우리가 사랑하는 제주도의 또다른 이름</p>
                    <b class="text1">삼 다 도.</b>
                </div>
              </div>
        </div>

        <!-- 아래 컨탠츠 1 -->
        <div class="row" id="content1">
        
        <div id="imagesBox">
        <img src="${contextPath}/resources/images/image_aboutUs/routeinfo.png" class="infoImg" alt="...">
        <img src="${contextPath}/resources/images/image_aboutUs/tourinfo.png" class="infoImg" alt="...">
        <img src="${contextPath}/resources/images/image_aboutUs/accountinfo.png" class="infoImg" alt="..." >
        </div>
        <div class="col" id="textArea">
               <!--  <p style="font-size: 20px;" >
                    <b style="font-size: 50px;">또시 꼽 옵서양</b><br><br>
                    여행은 출발하기도 전부터<br>
                    행복한 상상을 가져다주죠.<br>
                    한국인들이 사랑하는 제주도에서<br>
                    여러분들의 상상이<br>
                    현실이 되는 순간만을 기다리고 있어요.<br>
                </p> -->
               <img src="${contextPath}/resources/images/image_aboutUs/thirdImg.png" class="infoImg" alt="..." style="width:100%; margin:0;">
                
        </div>
        <!-- 아래 컨텐츠 2 -->
        <div class="row" id="adinfo">
                <img src="${contextPath}/resources/images/image_aboutUs/adinfo.png" alt="..." width="100%">
            
          </div>
          
          <section class="content2">
              <div class="text2">
                  <h1 style="color:black; font-size : 30px; margin-bottom:0;">@삼다도 인스타그램</h1>
                  <p style="margin-top:0;"> 지금 삼다도 인스타그램에서 제주도의 신선한 여행 바람을 만나보세요</p>
                  <img src="${contextPath}/resources/images/image_aboutUs/instagram.png" width ="10%">
                  <h1 style="color:white"># 제주  # 제주 여행 # 제주도</h1>
              </div>
              <div class="image">
                  <MARQUEE scrollamount="8">
      			  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/image60.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/IMG_4252.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/image57.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/image58.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/image60.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/IMG_4252.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/image57.png">
                  <img class="mainimage" src="${contextPath}/resources/images/image_aboutUs/image58.png"></MARQUEE>
              </div>
          </section>

        <section class="gif_box">
            <img src="${contextPath}/resources/images/image_aboutUs/moveSamdado.gif" width="100%" height="870px ">
        </section>
        </div>
        <jsp:include page="./footer.jsp"/>
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