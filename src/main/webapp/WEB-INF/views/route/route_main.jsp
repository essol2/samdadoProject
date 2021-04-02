<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길 만들기</title>
 <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6"></script>
    <style>

        /* 반응형 */
        @media (max-width:1920px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:87%;
                height:100%;
                -webkit-transition-duration:0.2s;
                -webkit-transition-timing-function:ease;
                transition-duration:0.2s;
                transition-timing-function:ease;
                color: white;
                border-left: 3px solid white;
                z-index: 1;
            }

            #bannerBoxLeft{
                width : 43%;
                height : auto;
                display : inline-block;
                margin-left : 5%;
                margin-right : 6%;
            }

            #bannerBoxRight{
                width : 43%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 90%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */               
            }

            #bottom {
                width: 1640px;
                height: auto;
                display: flex;
            }

        }

        @media (max-width:1650px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:85%;
                height:100%;
                -webkit-transition-duration:0.2s;
                -webkit-transition-timing-function:ease;
                transition-duration:0.2s;
                transition-timing-function:ease;
                color: white;
                border-left: 3px solid white;
                z-index: 1;
            }

            #left_side_text {
                max-width: 49%;
                max-height: 800px;
                /* border : 1px solid red; */
                margin-left : 2%;
            }

            #bannerBoxLeft{
                width : 40%;
                height : auto;
                display : inline-block;
                margin-left : 10%;
                margin-right : 4%;
            }

            #bannerBoxRight{
                width : 40%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 90%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
            }
            #bottom {
                width: 1440px;
                height: auto;
                display: flex;
            }

        }

        @media (max-width:1440px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:83%;
                height:100%;
                -webkit-transition-duration:0.2s;
                -webkit-transition-timing-function:ease;
                transition-duration:0.2s;
                transition-timing-function:ease;
                color: white;
                border-left: 3px solid white;
                z-index: 1;
            }

            #left_side_text {
                max-width: 48%;
                max-height: 800px;
                /* border : 1px solid red; */
                margin-left : 3%;
            }

            /* 오른쪽 이미지 영역 전체 */
            #right_side_img {
                max-width: 48%;
                max-height: 800px;
                /* border : 1px solid blue; */
            }

            #bannerBoxLeft{
                width : 46%;
                height : auto;
                display : inline-block;
                margin-left : 3%;
                margin-right : 2%;
            }

            #bannerBoxRight{
                width : 46%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 80%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
            }

            #bottom {
                width: 1440px;
                height: auto;
            }

        }

        .route_title {
            max-width: 48%;
            max-height: 800px;
            margin-left : 10%;
        }

        #content-logo {
            /* display: inline-block; */
            position: relative;
            margin-left: 100px;
        }

        #content-title {
            font-size: 30px;
            color: black;
            display: inline-block;
            position: relative;
        }

        #route_select {
            border: 2px solid black;
            width: 80%;
            position: relative;
            margin: auto;
        }

        #select td {
            padding-left: 10px;
            padding-right: 10px;
            text-align: center;
            width: 80px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .bold {
            font-weight: bold;
            font-size: 18px;
        }

        .tabletr {
            padding-top: 10px;
            padding-bottom: 5px;
        }

        #searchbtn {
            background-color: rgb(70, 115, 85);
            border: rgb(70, 115, 85);
            color: white;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            font-weight: 300;
            margin-bottom: 10px;
            margin-left: 88%;
            width: 100px;
            height: 35px;
        }

        #map {
            width: 100%;
            margin: auto;
        }
        
    </style>
</head>
<body>
   <jsp:include page="../common/navi.jsp"/>
        <!-- 내용 -->
        <div id="bottom">
            <div id="content">
                <br><br><br>
                <div class="route_title">
                    <img id="content_logo" width="70px" height="70px" src="../resources/images/image_main/logo_g.png"/>
                    &nbsp;
                    <p id="content-title">길 만들기</p>
                </div>

                <div id="route_select">
                	<br>
                 	<form id="routeSearchForm" action="${ contextPath }/route/search" method="get" onsubmint="return searchForm();">
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold">지역</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="radio" name="area" id="east" value="east" required>
                		<label for="east">  동부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="west" value="west" required>
                		<label for="west">  서부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="south" value="south" required>
                		<label for="south">  남부</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="area" id="north" value="north" required>
                		<label for="north">  북부</label>
                		
                		<br>
                		
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold" stype="padding: 10%;">주제</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="radio" name="thema" id="sightseeing" value="sightseeing" required>
                		<label for="sightseeing">  관광</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="thema" id="break" value="break" required>
                		<label for="break">  휴식</label>
                		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="thema" id="beach" value="beach" required>
                		<label for="beach">  바다</label>
                		
                		<br>
                		
                		&nbsp;&nbsp;&nbsp;&nbsp;<label class="bold">날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;
                		<input type="date" name="routeDate" id="routeDate" value="routeDate" required>
                		
                		<button class="btn" id="searchbtn">검색하기</button>
                	</form>
                </div>
                <br>
                <div id="map" style="width: 1200px; height:800px;"></div>
                <br><br><br>
            </div>
        </div>
        <footer>
           <jsp:include page="../common/footer.jsp"/>
        </footer>
    
   <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.376073744219326, 126.54506534832129),
			level: 9
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>