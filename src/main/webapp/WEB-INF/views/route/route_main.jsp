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

	
	<link rel="stylesheet" href="${ contextPath }/resources/css/route/route_main.css" type="text/css">
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
    	document.getElementById('routeDate').valueAsDate = new Date();
    	
    	var today = new Date();
    	var dd = today.getDate();
    	var mm = today.getMonth() + 1;
    	var yyyy = today.getFullYear();
    	
    	 if(dd < 10){
    	        dd = '0' + dd;
    	    } 
    	    if(mm < 10){
    	        mm = '0' + mm;
    	    } 
    	
    	today = yyyy + '-' + mm + '-' + dd;
    	document.getElementById("routeDate").setAttribute("min", today);
    	
    </script>
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