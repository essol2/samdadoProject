<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>호텔 등록</title>
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	/* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
    }   
   	h3{
        margin: 25px 0px 12px;
    }

    .main-container{
        width: 87%;   
    }

    .logo-div{
        display: flex;
        background-color: rgb(70, 115, 85);
        padding-left: 2%;
    }

    .logo-wrap{
        flex: 0 0 auto;
        width: 8.2%;
        height: 13%;
    }

    .title-wrap{
        width: 92.33%;
        color: white;
        margin-top: 2.5%;
    }
    
    .join-main{
        width: 100%;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }

    .car-main{
        width: 100%;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }

    .join-content{
        width: 30%;
        flex-wrap: wrap;
        margin: 0 30px 0 30px;
    }
    
    .box{
        width: 100%;
        height: 50%;
        border: 1px solid black;
        box-sizing: border-box;
        padding: 10px 12px;
        border-radius: 8px;
    }

    .content, .postcodify_postcode5, 
    .postcodify_address, .postcodify_details{
        width: 100%;
        height: 100%;
        border: none;
        background: #fff;
    }
    
    .btnArea{
        width: 100%;
        padding: 3%;
        text-align: center;
    }

    #joinBtn{
        width: 20%;
        background-color:#467355;
        border-radius:6px;
        border:1px solid #467355;
        cursor:pointer;
        color:#ffffff;
        font-family:Arial;
        font-size:18px;
        font-weight:bold;
        padding:10px 79px;
        text-decoration:none;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .addBtn-area{
        width: 80%;
    }

    .addBtn{
        color: white;
        float: right;
        background-color: #467355;
        border:1px solid #467355;
        border-radius: 8px;
        font-weight:bold;
    }
    
    .textArea-con{
    	width:105%;
    	
    }
    
    #postcodify_search_button{
    	background-color:#467355;
        border-radius:6px;
        border:1px solid #467355;
        cursor:pointer;
        color:#ffffff;
    }
    
    .join-wrap{
        width: 100%;

    }
</style>
<body>
	<!-- navi.jsp include -->
    <jsp:include page="../../common/navi.jsp"/>
    
    <!-- 메인 -->
	<div class="main-container">
		<!-- 로고헤더 -->
        <div class="logo-div">
            <div class="logo-wrap">
                <img src="${ contextPath }/resources/images/image_main/logo_w.png" style="width: 100px; height: 100px;">
            </div>
            <div class="title-wrap">
                <h3 style="margin: 0;">호텔 등록페이지</h3>
            </div>        
        </div>
	    
		<form action="${ contextPath }/business/hotel_insert" id="writeForm" method="post" enctype="multipart/form-data">
	       	
       	<input type="hidden" name="us_no" value="${ loginUser.usno }">
       	<input type="hidden" name="bus_category" value="H">
       	
        <div class="join-main">
			<div class="join-content">
	        	<div class="join-wrap">
                	<h3><label>사업장명</label></h3>
                    <span  class="box">
                        <input type="text" class="content" name="bus_name">
                    </span>
                </div>
	
		        <!-- 도로명주소 api -->
	           	<div class="join-wrap">
	                <h3><label>우편주소</label></h3>
					<span  class="box">
	                    <input type="text" id="address1" class="postcodify_postcode5" name="bus_address" readonly>
		                <button type="button" id="postcodify_search_button" style="height: 30px; float:right;">검색</button>
	                </span>
	           	</div>
	            <div class="join-wrap">
	                <h3><label>도로명주소</label></h3>
					<span  class="box">
	                    <input type="text" id="address2" name="bus_address" class="postcodify_address" readonly>                    
	                </span>
	            </div>
	            <div class="join-wrap">
					<h3><label>상세주소</label></h3>
					<span  class="box">
	                	<input type="text" id="address3" name="bus_address" class="postcodify_details">
	                </span>
	            </div>
	            
	            <!-- jQuery가 포함 된 상태에서 postcodify 스크립트 포함 -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<!-- 검색 버튼 클릭 시 팝업 레이어 열리도록 -->
				<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	            
		        <!-- 전화번호 -->
				<div class="join-wrap">
				    <h3><label>전화번호</label></h3>
				    <span class="box">
				        <input type="text" id="address" class="content" name="bus_phone">
				    </span>
				</div>
		        
				<!-- 카테고리 -->
				<div class="join-wrap">
				    <h3><label>숙박종류</label></h3>
				    <span class="box">
			        <select class="content" name="hotel_category">
			            <option value="select" selected>선택</option>
			            <option value="호텔">호텔</option>
			            <option value="민박">민박</option>
			            <option value="게스트하우스">게스트하우스</option>
			            <option value="기타">기타</option>
			        </select>
			        </span> 
				</div>
		
		        <!-- 편의시설 -->
		        <div class="join-wrap" >
		            <h3><label>편의시설</label></h3>           
	                <input type="checkbox" name="facility" value="주차">
	                <label for = "주차">주차</label>&nbsp;
	                <input type="checkbox" name="facility" value="편의점">
	                <label for = "편의점">편의점</label>&nbsp;
	                <input type="checkbox" name="facility" value="무료인터넷">
	                <label for = "무료인터넷">무료인터넷</label>&nbsp;
	                <input type="checkbox" name="facility" value="조식">
	                <label for = "조식">조식</label>&nbsp;
	                <input type="checkbox" name="facility" value="TV">
	                <label for = "TV">TV</label>&nbsp;
		        </div>
		        
		        <!-- 입실시간 -->
		        <div class="join-wrap">
		            <h3><label>입실시간</label></h3>
		            <span class="box">
		                <input type="time" id="check_in" class="content" name="bus_opening">
		            </span>
		        </div>   
		
				<!-- 퇴실시간 -->
		        <div class="join-wrap">
		            <h3><label>퇴실시간</label></h3>
		            <span class="box">
		                <input type="time" id="check_out" class="content" name="bus_opening">
		            </span>
		        </div> 
		
		        <!-- 매장사진 -->
		        <div class="join-wrap">
		            <h3><label>매장사진</label></h3>
		            <span class="box">
		                <input type="file" name="uploadFile" id="accomm" class="content">
		            </span>
		        </div>
		        
		        <!-- 소개글 -->
		        <div class="join-wrap">
		            <h3><label>소개글</label></h3>
		            <textarea id="intArea" class="textArea-con" name="bus_intro" rows="10" cols="64" style="resize:none;"></textarea>
		        </div>
			</div>
		</div>	
		
		<!-- 라인 -->
        <hr style="margin-top:5%;">
			
		<!-- 방추가 버튼 -->
        <div class="addBtn-area">
            <button type="button" class="addBtn" id="addBtn" onclick="addCar()">방추가</button>
        </div>
        
		<!-- 렌트카 추가 -->
        <div class="car-main" id="car-main">
			<div class="join-content" id="join-content">
			
		    	<!-- 객실명 -->
		        <div class="join-wrap">
		        	<h3><label>객실명</label></h3>
		            <span class="box">
		                <input type="text" id="room_name" class="content" name="room_name">
		            </span>
		        </div> 
	        
		        <!-- 가격 -->
		        <div class="join-wrap">
		            <h3><label>가격</label></h3>
		            <span class="box">
		                <input type="text" id="room_price" class="content" name="room_price">
		            </span>
		        </div>
		        
		        <!-- 인원 -->
		        <div class="join-wrap">
		            <h3><label>인원</label></h3>
		            <span class="box">
		            <select class="content" name="room_people">
		                <option value="select" selected>선택</option>
		                <option value="two">2~4명</option>
		                <option value="four">4~6명</option>
		                <option value="six">6~8명</option>
		                <option value="etc">기타</option>
		            </select>
		            </span>
		        </div>
		
		        <!-- 편의시설 -->
		        <div id="hotel_amenity" class="join-wrap">
		            <h3><label>내부시설</label></h3>           
	                <input type="checkbox" id="bacon" name="room_amenity" value="double">
	                <label>더블사이즈</label>&nbsp;
	                <input type="checkbox" id="sigle" name="room_amenity" value="sigle">
	                <label>싱글사이즈</label>&nbsp;
	                <input type="checkbox" id="shower" name="room_amenity" value="shower">
	                <label>샤워실</label>&nbsp;
	                <input type="checkbox" id="ref" name="room_amenity" value="ref">
	                <label>냉장고</label>&nbsp;
	                <input type="checkbox" id="aircon" name="room_amenity" value="aircon">
	                <label>에어컨</label>&nbsp;
	                <input type="checkbox" id="balcony" name="room_amenity" value="balcony">
	                <label>발코니</label>&nbsp;
	                <input type="checkbox" id="breakfast" name="room_amenity" value="breakfast">
	                <label>조식</label>&nbsp;
		        </div>
		        
		        <!-- 객실사진 -->
		        <div class="join-wrap">
		            <h3><label>객실사진</label></h3>
		            <span class="box int_mobile">
		                <input type="file"  name="room_file" id="mobile" class="content">
		            </span>
		        </div> 
			</div>
		</div>
	    <div class="btnArea">
            <button id="joinBtn">등록하기</button>
            <button type="button" id="joinBtn" onclick="javascript.historyback()">돌아가기</button>
        </div>
		</form>
	</div>
	<script>
	       function addCar(){
	           var div = document.createElement('div');
	
	           $(div).attr('class', 'join-content');
	
	           div.innerHTML = document.getElementById('join-content').innerHTML;
	
	           document.getElementById('car-main').appendChild(div);
	
	       }
	</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	<footer>
		<jsp:include page="../../common/footer.jsp"/>
	</footer>
</body>
</html>