<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Samadado</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
    <style>
        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

        footer {
            background-color: rgb(70, 115, 85);
            height: 190px;
        }

        .leftImg {
            margin-left: 6%;
            margin-top: 20px;
        }

        #footer_center {
            margin-left: 30%;
            margin-top: -130px;
            color: white;
        }

        #footer_right {
            margin-left: 60%;
            margin-top: -120px;
            color: white;
        }

        .rightImg {
            padding-right: 15px;
        }

        #copyRight {
            color: white;
            margin-left: 40%;
            margin-right: 40%;
            margin-top: 10px;
            margin-bottom: 0px;
            opacity: 0.5;
        }

        hr {
            color: white;
        }


        /* 네비 css */
        #back {
            width: 100%;
            height: auto;
            margin: auto;
            top: 0;
        }

        header {
            position: fixed;
            width: 240px;
            top: 0;
            left: 1200px;
            height: 100%;
            -webkit-transition-duration: 0.2s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.2s;
            transition-timing-function: ease;
            color: black;
            border-left: 3px solid black;
            z-index: 1;
        }

        .down {
            -webkit-transition-duration: 0.2s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.2s;
            transition-timing-function: ease;
        }

        .down #navi {
            -webkit-transition-duration: 0.4s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.4s;
            transition-timing-function: ease;
        }

        .center {
            text-align: center;
        }

        .right {
            text-align: right;
            position: relative;
            right: 10%;
            margin: auto;
        }

        #navi-title {
            font-size: 40px;
            font-weight: bold;
        }

        #navi-menu {
            font-size: 15px;
            font-weight: 500;
        }

        .navi {
            height: 600px;
            /* border : 1px solid pink; */
            margin-left: 2%;
            width: 100%;
        }

        .img {
            position: relative;
            left: 70%;
        }

        /* 반응형 */
        @media (max-width:1920px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 87%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }
        }

        @media (max-width:1650px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 85%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }
        }

        @media (max-width:1440px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 83%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }

        }

        body {
            margin: 0;
            padding: 0;
            height: auto;
            box-sizing: border-box;
            background: white;
            color: black;
        }

        /* 컨테이너 */

        #main-container {
            height: 100%;
            width: 85%;
            display: flex;
            flex-direction: column;

        }

        /* 검색필터 */

        #filter-nav {
            list-style-type: none;
            margin: 0;
            padding: 1.3rem;
        }

        #filter-nav ul {
            display: flex;
        }

        #filter-nav li {
            display: flex;
            font-size: 20px;
            padding: 10px;
        }

        #filter-img {
            width: 55px;
            height: 55px;
            margin-left: 3%;
        }

        .search-result {
            padding-left: 3%;
        }
        
        .topText{
        	font-size: 35px;
		    font-weight: bold;
		    color: #343a40;
        }

        /* 검색필터끝 */

        /* 정렬필터 */

        #choise2-nav {
            list-style-type: none;
            text-align: center;
            margin: 0;
            padding: 1.3rem;
            display: flex;
            align-items: flex-end;           
        }

        #choise2-nav ul {
            display: flex;
        }

        #choise2-nav li {
            display: flex;
            font-size: 20px;
            padding: 10px;
        }

        /* 정렬필터끝 */

        /* 리스트 */
		
		.list{
			flex-direction: column;
		}
		
        #firstlist {            
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            /* justify-content: center; */
            align-items: center;
			max-width: 1600px;
    		flex-wrap: wrap;
        }

        .premium {
            width: 60px;
            height: 60px;
        }

        /* 프리미엄테두리 반짝이효과 */
        .gradient-border {
            --borderWidth: 5px;
            background: white;
            position: relative;
            border-radius: var(--borderWidth);
        }

        .gradient-border:after {
            content: '';
            position: absolute;
            top: calc(-1 * var(--borderWidth));
            left: calc(-1 * var(--borderWidth));
            height: calc(100% + var(--borderWidth) * 2);
            width: calc(100% + var(--borderWidth) * 2);
            background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
            border-radius: calc(1.5 * var(--borderWidth));
            z-index: -1;
            animation: animatedgradient 2s ease alternate infinite;
            background-size: 300% 300%;
        }

        @keyframes animatedgradient {
            0% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%;
            }
        }

        /* 프리미엄테두리 반짝이효과 끝 */

        #secondlist {            
            margin-left: 1%;
		    /* flex: 5; */
		    display: flex;
		    /* justify-content: center; */
		    align-items: center;
		    /* max-width: 1600px; */
		    flex-wrap: wrap;

        }
        
        #thirdlist {
           
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;
            

        }

        .profile {

            display: none;
            flex-direction: column;
            /* align-items: center; */
            justify-content: center;
            /* flex: 1; */
            margin: 1rem;
            padding: 1rem;
            width: 435px;
            height: 500px;
            box-sizing: border-box;
        }
        
        .mainProfile {

            display: flex;
            flex-direction: column;
            /* align-items: center; */
            justify-content: center;
            /* flex: 1; */
            margin: 1rem;
            padding: 1rem;
            width: 435px;
            height: 500px;
            box-sizing: border-box;
        }
        
        .premium_div{
        	position:absolute;
        	margin-bottom:368px;
        }
        
        .moreProfile {

            display: flex;
            flex-direction: column;
            /* align-items: center; */
            justify-content: center;
            /* flex: 1; */
            margin: 1rem;
            padding: 1rem;
            width: 435px;
            height: 500px;
            box-sizing: border-box;
        }

        .image {
            object-fit: cover;
            width: 400px;
            height: 300px;
            border: 1px solid gray;
            border-radius: 3%; 
        }

        /* 리스트끝 */

        .btnarea {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex: 1;
        }

        /* 필터, 버튼 폰트 */

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .cover {
            width: 70px;
            height: 33px;
            border: 1px solid black;
            border-radius: 20%;            
        }

        .cover a, .cover label {
            text-decoration: none;
            color: black;
            font-family: 'GmarketSansBold' !important;
            line-height:0px;
        }

        .moreBtn {
            background-color: rgb(70, 115, 85);
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 75px;
            text-decoration: none;
            margin-bottom: 50px;
            font-family: 'GmarketSansBold' !important;
        }
        
        /* 사업장종류선택 */

        #choise-nav {
            list-style-type: none;
            text-align: center;
            margin: 0;
            padding: 1.3rem;
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;            
        }

        #choise-nav ul {
            display: flex;
        }

        #choise-nav li {
            display: flex;
            font-size: 20px;
            padding: 10px;
        }
        
        #searchValue{
        	width: 300px;
        }
        
        #searchBtn{
       	    background-color: #467355;
		    color: white;
		    border-radius: 10px;
		    border: none;
		    height: 35px;
		    font-weight:bold;
        }
        
        .cover2{
        	margin-left: 3%;
        	margin-top: 1%;
        }
        
        #jjimOn{
        	display : none;
        	background-color : rgba( 0,0,0,0);
        }
        
        .jjimBtn{
        	border-style : none;
        	width : fit-content;
        	height : fit-content;
        	backtround-color : rgba( 0,0,0,0);
        }
        
        .btn.btn-sea{-moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;}
		a{text-decoration:none;}        
        .btn.btn-sea {font-size: 18px; white-space:nowrap; width:150px; padding:.8em 1.5em; font-family: GmarketSansBold; line-height:18px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative; -webkit-transition: border .25s linear, color .25s linear, background-color .25s linear; transition: border .25s linear, color .25s linear, background-color .25s linear;}      
        .btn.btn-sea{background-color: #467355; border-color: #467355; -webkit-box-shadow: 0 3px 0 #088d74; box-shadow: 0 3px 0 #088d74;}
		.btn.btn-sea:hover{background-color:white; color:#467355;}
		.btn.btn-sea:active{ top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

        /* 사업장종류선택끝 */
    </style>
</head>

<body>
     <!-- navi.jsp include -->
    <jsp:include page="../../common/navi.jsp"/>

        <!-- 전체 section-->
        <section id="main-container">
			<!-- 페이지 이동 nav -->
            <nav id="choise-nav">
            	<ul id="choise">
                    <li>
                        <a href='${ contextPath }/business/hotel_list' class="btn btn-sea">숙박</a>
                    </li>
                    <li>
                        <a href='${ contextPath }/business/tour_list' class="btn btn-sea">관광지</a>
                    </li>
                    <li>
                        <a href='${ contextPath }/business/restaurant_list' class="btn btn-sea">음식점</a>
                    </li>
                    <li>
                        <a href='${ contextPath }/business/rentcar_list' class="btn btn-sea">렌트카</a>
                    </li>
                </ul>
            </nav>

            <nav id="filter-nav">
                <img id="filter-img" src="../resources/images/image_main/logo_g.png" alt="">							
                <div class="search-result">
                    <label class="topText">삼다도와 함께하는</label><br>
                    <label class="topText">제주도 지역의 렌트카</label>
                </div>
                <form id="search_business_form">
                    <div class="cover2">
                      	<input type="text" name="searchValue" id="searchValue" value="${ param.searchValue }" placeholder="렌트카 업체 이름">
                       	<button class="btn btn-secondary" id="searchBtn" type="button">검색</button>
                    </div>
                </form>
            </nav>
            
            <script>	
		    $(function(){
		    	 $("#searchBtn").on("click", function() {
		    		 	var search = {};		         		
		         		search.searchValue = $("#searchValue").val();
		         		search.searchKind = 4;
		    			$.ajax({
		    				 url : '${contextPath}/business/searchBusinessList', 
		    	              data : JSON.stringify(search),
		    	              type : "post",
		    	              contentType : "application/json; charset=utf-8",
		    	              dataType : "json",
		    	              success : function(data){
		    	            	  var cate = document.getElementById("secondlist");
		    	            	  var list = "";
		    	            	  for(var i in data){
		    	              		str  = "<div class='moreProfile'>";
		    	              		str += "<img class='image' src='${ contextPath }/resources/busUploadFiles/"+ data[i].file_rename +"' onclick='selectRes(" + data[i].bus_code + ")'>";
		    	                    str += "<b>★4.90(후기 99+개)</b>";
		                            str += "<b>"+ data[i].bus_name +"</b>";
		                            str += "<c:if test='${ loginUser.usno != null }'>"
			                        str += "<button id='jjimToggle' class='jjimBtn'><img src='${contextPath}/resources/images/image_listpage/heart_off.png'></button>";
			                        str += "</c:if>";
		                            str += "</div>";
		                            
		                            list += str;
		    	              		}
		    	            	  cate.innerHTML=list;
		    	              },
		    	              error : function(data){
		    	            	 alert('error');
		    	               
		    	              }
		    			})
		    		});
		    });
			</script>

            <nav id="choise2-nav">
                <ul id="choise2">                    
                    <li>
                        <div class="cover"><label id="starList">별점순</label></div>
                    </li>
                    <li>
                        <div class="cover"><label id="reviewList">후기순</label></div>
                    </li>
                </ul>

            </nav>
            
            <script>
            $(function starList(){
		    	$("#starList").click(function(){
		    			var kinds = $(this).val(); 
		    			$.ajax({
		    				 url : '${contextPath}/business/starList', 
		    	              type : "post", 
		    	              data : {"kinds" : kinds},
		    	              success : function(data){
		    	            	  var cate = document.getElementById("secondlist");
		    	            	  var list = "";
		    	            	  for(var i in data){
		    	            		 if(data[i].bus_category == 'C'){
		    	              		str  = "<div class='moreProfile'>";
		    	              		str += "<img class='image' src='${ contextPath }/resources/busUploadFiles/"+ data[i].file_rename +"' onclick='selectRes(" + data[i].bus_code + ")'>";
		    	              		str += "<b>★"+ data[i].avstar +"(후기 "+ data[i].revcnt +"개)</b>";
		    	              		str += "<b>"+ data[i].bus_name +"</b>";
		    	              		str += "<b>"+ data[i].tour_tema +" / "+data[i].tour_category +"</b>"
		    	              		str += "<div id='frm_read'>"
		                            str += "<a href='javascript: like_func();'><img src='../resources/images/image_listpage/heart.png'></a>";
		                            str += "</div>";               
		                            str += "</div>";
		                            
		                            list += str;
		    	            		 }
		    	              		}
		    	            	  cate.innerHTML=list;
		    	              },
		    	              error : function(data){
		    	            	 alert('error');
		    	               
		    	              }//error
		    			})//ajax
		    		});//click
		    });//ready
		    
		    $(function(){
		    	$("#reviewList").click(function(){
		    			var kinds = $(this).val(); 
						
		    			$.ajax({
		    				 url : '${contextPath}/business/reviewList', 
		    	              type : "post", 
		    	              data : {"kinds" : kinds},
		    	              success : function(data){
		    	            	  //console.log(data);
		    	            	  var cate = document.getElementById("secondlist");
		    	            	  var list = "";
		    	            	  for(var i in data){
		    	            		  if(data[i].bus_category == 'C'){
				    	              		str  = "<div class='moreProfile'>";
				    	              		str += "<img class='image' src='${ contextPath }/resources/busUploadFiles/"+ data[i].file_rename +"' onclick='selectRes(" + data[i].bus_code + ")'>";
				    	              		str += "<b>★"+ data[i].avstar +"(후기 "+ data[i].revcnt +"개)</b>";
				    	              		str += "<b>"+ data[i].bus_name +"</b>";
				    	              		str += "<b>"+ data[i].tour_tema +" / "+data[i].tour_category +"</b>"
				    	              		str += "<div id='frm_read'>"
				                            str += "<a href='javascript: like_func();'><img src='../resources/images/image_listpage/heart.png'></a>";
				                            str += "</div>";               
				                            str += "</div>";
				                            
				                            list += str;
				    	            		 }
		    	              		}
		    	            	  cate.innerHTML=list;
		    	              },
		    	              error : function(data){
		    	            	 alert('error');
		    	               
		    	              }//error
		    			})//ajax
		    		});//click
		    });//ready
            </script>

            <!-- 관광지목록 div -->

            <div class="list">
            	<div id="firstlist" class="gradient-border">
                <c:forEach var="c" items="${ carList }">
                <c:if test="${ c.bus_classify eq 'P' && c.file_lv eq '0' }">
                    <div class='mainProfile'>
                    <input type="hidden" id="bus_code" name="bus_code" value="${ c.bus_code }">
                        <div class="premium_div">                    	
                        <img class="premium" src="../resources/images/image_listpage/premiumicon.png">
                    	</div>
                        <img class="image" src="../resources/busUploadFiles/${ c.file_rename }" onclick="selectRes(${c.bus_code})">
                        <b>${ c.bus_name }</b>	                        
	                        <c:if test="${ loginUser.usno != null }">
	                        <button id="jjimToggle" class="jjimBtn"><img src="${contextPath}/resources/images/image_listpage/heart_off.png"></button>
	                        </c:if>
                    </div>
                </c:if>    
                </c:forEach>
                </div>

                <div id="secondlist">
                <c:forEach var="c" items="${ carList }">
                <c:if test="${c.bus_classify eq 'G' }">
                    <div class='profile'>
                    	<c:if test="${ c.file_lv eq '0' }">
                    	<input type="hidden" id="bus_code" name="bus_code" value="${ c.bus_code }">
                        <img class="image" src="${ contextPath }/resources/busUploadFiles/${ c.file_rename }" onclick="selectRes(${c.bus_code})">
                        </c:if>
                        <b>★4.90(후기 99+개)</b>
                        <b>${ c.bus_name }</b>
                        <c:if test="${ loginUser.usno != null }">
	                        <button id="jjimToggle" class="jjimBtn"><img src="${contextPath}/resources/images/image_listpage/heart_off.png"></button>
	                        </c:if>
                    </div>
                    </c:if>
                </c:forEach>
                </div>
            </div>
			
			
			<!-- 디테일 이동 -->
			<script>
				function selectRes(bus_code){
					location.href='${contextPath}/business/car_detail?bus_code=' + bus_code;
				}
			</script>
			
                <div class="btnarea">
                    <button class="moreBtn">더보기</button>
                </div>
                
            <!-- 더보기 -->
			<script>				
						$(document).ready(function(){
							size_div = $('.profile').length;
							
							x = 6;
							$('.profile:lt('+x+')').addClass('moreProfile');
							$('.moreBtn').click(function(){
								x= (x+6 <= size_div)? x+6 : size_div;
								$('.profile:lt('+x+')').addClass('moreProfile');	
							});
						});
			</script>

        </section>

         <footer>
            <div id="footer_left">
                <img src="../resources/images/image_footer/footerlogo.png" class="leftImg">
            </div>
            <div id="footer_center">
                <img src="../resources/images/image_footer/Vector.png" class="centerImg"> &nbsp 서울 특별시 강남구 테헤란로14길 6<br><br>
                <img src="../resources/images/image_footer/phone.png" class="centerImg"> &nbsp (064)740-6000 <br><br>
                <img src="../resources/images/image_footer/message.png" class="centerImg"> &nbsp samdado@ijto.co.kr
            </div>
            <div id="footer_right">
                <p id="samdado_news">삼다도 소식</p>
                <img src="../resources/images/image_footer/facebook.png" class="rightImg">
                <img src="../resources/images/image_footer/twitter.png" class="rightImg">
                <img src="../resources/images/image_footer/LinkedIn.png" class="rightImg">
                <img src="../resources/images/image_footer/pininterest.png" class="rightImg">
            </div>
            <br>
            <br>
            <hr>
            <p id="copyRight" style="font-size: small;">© 2021 Digital Project. Team SAMDASOO</p>
        </footer>

        <script>
	
	
	$('.jjimBtn').click(function(){
		
		var $this = $(this);
		var bus_code = $(this).parent().eq(0).children().val();
		var check=$this.find(">img");
		
		console.log($this);
		console.log(check);
		
		var jjimOb = new Object();
		jjimOb.bus_code = bus_code;
		jjimOb.us_no = ${loginUser.usno};
		
		
		$this.find(">img").attr("src", function(index, attr){
			if(attr.match('_on')){
				
				$.ajax({
				url : "${contextPath}/mypage/jjimoff",
				data : JSON.stringify(jjimOb),
				type : "POST",
				contentType : "application/json; charset=utf-8",
				success : function(data){
					
					//console.log("하트 오프!");
					
					
				}, error:function(e){
					alert("error code : " + e.status + "/n" + "message : " + e.responseText);
				}
			});
				return attr.replace("_on.png", "_off.png");
				
			} else {
				
				$.ajax({
				url : "${contextPath}/mypage/jjimon",
				data : JSON.stringify(jjimOb),
				type : "POST",
				contentType : "application/json; charset=utf-8",
				success : function(data){
					
					//console.log("하트 온!");
					
					
				}, error:function(e){
					alert("error code : " + e.status + "/n" + "message : " + e.responseText);
				}
			});
				return attr.replace("_off.png", "_on.png");
			}
		});
	});

</script>

</body>

</html>