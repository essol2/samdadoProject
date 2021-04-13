<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 등록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- css 외부 파일 첨부 -->
<script type="stylesheet" src="${ contextPath }/resources/scripts/samdado-insert.js" type="text/css"></script>

<!-- 결제 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script type="text/javascript">

</script>


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

    .joinBtn{
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
    .joinBtn1{
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
    
    .opening-div{
    	border: 1px solid black;
	    border-radius: 8px;
	    width: 108%;
	    padding: 10px;
    }
    
    h3 label{
    	margin-top: 5px;
    }
    
    .guideBox{
    	margin-top: 20px;
    }
    
    .textbtn{
    	font-size:20px; 
    	cursor:pointer;
    }
</style>

</head>
<body>
	<!-- 네비  -->
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
        
			<form action="${ contextPath }/business/restaurant_insert" id="writeForm" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="us_no" value="${ loginUser.usno }">
        	<input type="hidden" name="bus_category" value="R">
            
			<div class="join-main">
				<div class="join-content">
				
					<div class="join-wrap">
	                    <h3><label>함께하기</label></h3>
	                    <span  class="box">
	                        <input type="radio" id="gen" name="bus_classify" value="G">
			                <label for = "일반">일반</label>&nbsp;&nbsp;&nbsp;
			                <input type="radio" id="pri" name="bus_classify" value="P">
			                <label for = "프리미엄">프리미엄</label>&nbsp;
	                    </span>
	                </div>
	                
					<div id="hidenDiv">
	                <div class="join-wrap" id="dateBox">
	                    <h3><label>개월</label></h3>
	                    <span  class="box">
	                        <select class="content" id="payCategory" name="primonth">
		                    <option value="0" selected>선택</option>
		                    <option value="30">1개월 : 10억</option>
		                    <option value="90">3개월 : 27억</option>
		                    <option value="180">6개월 : 58억</option>
		                </select>
	                    </span>
	                </div>

	                
	                
	                <div class="guideBox">
				        <h3>프리미엄 약관&nbsp;&nbsp;<span class="textbtn">[열기]</span></h3>
				        <div style="display:none">
				            <div class="join-wrap">
				                <div id="pricont" class="box" style="height:300px">
				                   <textarea style="width: 100%; height:100%; text-align:left;">① “공급사업자”라 함은 본 서비스를 제공하는 사업자를 말한다.
				                   ② “이용사업자”라 함은 본 서비스를 무료로 이용하는 자 및 공급사업자와 본 서비스 이용계약을 체결한 자로서 본 서비스를 이용하는 개인, 법인 또는 개인사업자 혹은 개인을 말한다.
				                   ③ “신청사업자"라 함은 본 서비스를 유료로 이용하기 위해 이용신청을 하는 자를 말한다.
								④ "이용계약"이라 함은 이용사업자가 본 서비스 이용을 개시하며 공급사업자와 상호 동의한 요금제 및 개별 계약을 말한다.
								⑤ “최종이용자”라 함은 클라우드 컴퓨팅서비스를 통해 이용사업자가 제공하는 서비스를 이용하는 자를 말한다.
								⑥ “이용사업자 데이터”라 함은 이용사업자 및 최종이용자가 공급사업자의 정보통신자원에 제출, 기록, 업로드 등의 형식으로 저장하는 정보로서 이용사업자가 소유 또는 관리하는 정보를 말한다.
				                   </textarea>
				                </div>
				            </div>
				        </div>
				    </div>
					</div>				    
				
		         	<div class="join-wrap">
	                    <h3><label>사업장명</label></h3>
	                    <span  class="box">
	                        <input type="text" class="content" name="bus_name" required>
	                    </span>
	                </div>
	
	            	<!-- 도로명주소 api -->
	            	<div class="join-wrap">
		                <h3><label>우편주소</label></h3>
						<span  class="box">
		                    <input type="text" id="address1" class="postcodify_postcode5" name="bus_address" style="width: 80%;"readonly>
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
					        <input type="text" id="address" class="content" name="bus_phone" required>
					    </span>
					</div>
	             
		            <!-- 카테고리 -->
		            <div class="join-wrap">
		            	<h3><label>카테고리</label></h3>
		            	<span class="box">
		                <select class="content" id="category" name="res_category">
		                    <option value="select" selected>선택</option>
		                    <option value="한식">한식</option>
		                    <option value="중식">중식</option>
		                    <option value="양식">양식</option>
		                    <option value="일식">일식</option>
		                    <option value="기타">기타</option>
		                </select>
		                </span>
		            </div>
		            
		            <!-- 영업시간 -->
		            <div class="join-wrap">
		                <h3><label for="opening">영업시간</label></h3>
		                <div class="opening-div"> 
		                    <input type="time" id="opening" name="bus_opening" class="content" required>
		                    ~
		                    <input type="time" id="opening" name="bus_opening" class="content" required>
		                </div>
		            </div>          
		           
		
		            <!-- 매장사진 -->
					<div class="join-wrap">
					    <h3><label>매장사진</label></h3>
					    <span class="box">
					        <input multiple="multiple" type="file" name="uploadFile" class="content" required>
					    </span>   
					</div>
					
					<!-- 매장사진 -->
					<div class="join-wrap">
					    <h3><label>매장사진</label></h3>
					    <span class="box">
					        <input type="file" name="uploadFile" class="content" required>
					    </span>   
					</div>
					
					<!-- 매장사진 -->
					<div class="join-wrap">
					    <h3><label>매장사진</label></h3>
					    <span class="box">
					        <input type="file" name="uploadFile" class="content" required>
					    </span>   
					</div>
		
		             <!-- 소개글 -->
					<div class="join-wrap">
					    <h3><label>소개글</label></h3>
					    <textarea id="intArea" class="textArea-con" name="bus_intro" rows="10" cols="64" style="resize:none;"></textarea>
					</div>
				</div>
			</div>
	            <div class="btnArea">
	            	<button type="submit" class="joinBtn1" id="submitBtn" style="display:none;"><a>등록하기</a></button>
	            	
		            <button class="joinBtn1" id="payBtn" type="button"><a>결제하기</a></button>
		            <button type="button" class="joinBtn" onclick="javascript.historyback()">돌아가기</button>
		        </div>
			</form>
		</div>
		
<script>	
$("#gen").change(function() {
    $("#hidenDiv").hide();
});

$("#pri").change(function(){
	$("#hidenDiv").show();
});

$(document).on("click",".guideBox > h3",function(){
    if($(this).next().css("display")=="none"){
        $(this).next().show();
        $(this).children("span").text("[닫기]");
    }else{
        $(this).next().hide();
        $(this).children("span").text("[열기]");
    }
});

$("#pri").change(function() {
    if(this.checked) {
        $("#payBtn").show();
        $("#submitBtn").hide();
    }
});

$("#gen").change(function(){
	if(this.checked){
		$("#submitBtn").show();
		$("#payBtn").hide();
	}
});



$("#payBtn").on("click",function() {
	
var name = $("#payCategory option:selected").val();

console.log(name);
var amount = 0;
if(name == '30'){
	amount = 100;
} else if(name == '90'){
	amount = 200;
} else{
	amount = 300;
}
console.log(name);

    var IMP = window.IMP;
    IMP.init('imp34313892');
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : name,
        amount : amount,
        buyer_email : "${loginUser.usemail}",
        buyer_name : "${loginUser.usname}",
        buyer_tel : "${loginUser.usphone}",
        buyer_addr : '',
        buyer_postcode : ''
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다!';
           	$("#payBtn").hide();
           	$("#submitBtn").show();
            msg += '결제 금액 : ' + rsp.paid_amount;
        } else {
            var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
        }
    
        alert(msg);
    });
});

</script>





	 <footer>
           <jsp:include page="../../common/footer.jsp"/>
     </footer>

	
</body>
</html>
