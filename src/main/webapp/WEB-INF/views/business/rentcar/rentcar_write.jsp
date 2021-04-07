<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트카 등록</title>
	
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
</head>
<body>
	<!-- 네비 -->
	<jsp:include page="../../common/navi.jsp"/>
	
	<!-- 메인 -->
	<div class="main-container">
		<!-- 로고헤더 -->
        <div class="logo-div">
            <div class="logo-wrap">
                <img src="${ contextPath }/resources/images/image_main/logo_w.png" style="width: 100px; height: 100px;">
            </div>
            <div class="title-wrap">
                <h3 style="margin: 0;">음식점 등록페이지</h3>
            </div>        
        </div>
        
        <form action="${ contextPath }/business/rentcar_insert" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="us_no" value="${ loginUser.usno }">
		<input type="hidden" name="bus_category" value="C">
		<input type="hidden" name="res_category" value="">
		
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
			
				<!-- 운영시간 -->
				<div class="join-wrap">
				    <h3><label>운영시간</label></h3>
				    <span class="box">
				        <input type="text" id="address" class="content" name="bus_opening">
				    </span>
				</div>
			
				<!-- 전화번호 -->
				<div class="join-wrap">
				    <h3><label>전화번호</label></h3>
				    <span class="box">
				        <input type="text" id="address" class="content" name="bus_phone">
				    </span>
				</div>    
			
				<!-- 매장사진 -->
				<div class="join-wrap">
				    <h3><label>매장사진</label></h3>
				    <span class="box">
				        <input type="file" name="uploadFile" class="content">
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
			
		<!-- 차량추가 버튼 -->
        <div class="addBtn-area">
            <button type="button" class="addBtn" id="addBtn" onclick="addCar()">차량추가(몇개추가)</button>
        </div>
		
		<!-- 렌트카 추가 -->
        <div class="car-main" id="car-main">
			<div class="join-content" id="join-content">
			
				<div class="join-wrap">
					<h3><label>제작사</label></h3>
				    <span class="box">
				        <input type="text" id="address" class="content" name="car_producer">
				    </span>
				</div> 
				
				<!-- 차량 -->
				<div class="join-wrap">
				    <h3><label>차량</label></h3>
				    <span class="box">
				        <input type="text" id="address" class="content" name="car_name">
				    </span>
				</div> 
				
				<!-- 가격 -->
				<div class="join-wrap">
				    <h3><label>가격</label></h3>
				    <span class="box">
				        <input type="text" id="mobile" class="content" name="car_price">
				    </span>
				</div>
				
				<!-- 차종 -->
				<div class="join-wrap">
				    <h3><label>차종</label></h3>
				    <span class="box">
			        <select class="content" name="car_type">
			            <option value="select" selected>선택</option>
			            <option value="소형">소형</option>
			            <option value="중형">중형</option>
			            <option value="대형">대형</option>
			            <option value="스포츠">스포츠</option>
			        </select>
			        </span> 
				</div>
				
				<!-- 연료 -->
				<div class="join-wrap">
				    <h3><label>연료</label></h3>
				    <span class="box">
			        <select class="content" name="car_fuel">
			            <option value="select" selected>선택</option>
			            <option value="디젤">디젤</option>
			            <option value="가솔린">가솔린</option>
			        </select>
			        </span>                
				</div>
				
				<!-- 차량사진 -->
				<div class="join-wrap">
				    <h3><label>추가사진</label></h3>
				    <span class="box">
				        <input type="file" name="car" class="content">
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