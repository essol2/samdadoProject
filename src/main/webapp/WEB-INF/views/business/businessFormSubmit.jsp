<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>삼다도 배너광고 신청</title>
<link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<!-- css 외부 파일 첨부 -->

<link rel="stylesheet" href="${ contextPath }/resources/css/Business/businessFormSubmit.css">

<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

</head>
<body>

  <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
    
    <!-- 중간영역 -->
    <div class="container-fluid">
     <div class="row">
        
        <div id="content_div">
        	<!-- 네비 -->
     	<div class="col">
     		<jsp:include page="../common/navi.jsp"/>
     	</div>
            <!--삼다도 광고 신청-->
            <div class="row" id="include_img_div">
                <div class="row">
                      <div class="col-1">
                      	<br>
                        <a href="${ contextPath }/main"><img class="d-block mx-auto mb-4" src="${ contextPath }/resources/images/image_main/logo_w.png" alt="" width="72" height="57"></a> 
                      </div>
                      <div class="col-11">
                      	<br>
                        <h4 id="page_title">삼다도 제휴회원 배너 광고 신청</h4>
                      </div>
                </div>  
            </div>
            <br><br>
            <!-- 제휴 신청 페이지 -->
            <div class="row" id="center_content_div">      
         
                <div class="modal fade" id="myModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content" style=" padding : 7%;">
                        <div class="modal-header">
                        <h4 class="modal-title" id="staticBackdropLabel">신청 전 주의사항</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5 id="mymodal_caution_text">배너 광고에 대해 숙지 부탁드립니다.</h5> <br>
                            <h6 id="modal_inner_text">
				                                삼다도 배너 광고는 <b>관리자의 승인</b>이 필수이며 관리자 승인
				                                여부에 따라 <b>삼다도 메인페이지 하단에 리스팅 형식으로 노출</b>됩니다.
				                                자세한 사항은 <a href="${ contextPath }/user/goToAboutUs"><b>‘삼다도에 대해서’</b></a>페이지에서 확인 해 주세요! <!-- 페이지 링크 연결-->
				                
				                <br><br>              
				                                배너 광고는 <b style="color: red;">포인트 충전</b>이 필요한 서비스입니다. <br>
				                                포인트 충전은 잊지 않으셨죠?
                             </h6>             
                        <br><br>
                        <div class="goToPayBtn_div">
                            <p id="goMyPageBtn" onclick="goToPoint();" class="btn btn-secondary" style="color: white; text-decoration: none;">동의 후 포인트 충전하러 가기</p> 
                        </div>    
                        </div>
                        <div class="modal-footer">
                        <button type="button" data-bs-dismiss="modal" id="myModal_closeBtn">닫기</button>
                        </div>
                    </div>
                    </div>
                </div> 

            <form action="${ contextPath }/business/insert/bannerAd" method="post" enctype="multipart/form-data" onsubmit="return submitValidate();">
			<c:choose>
				<c:when test="${ !empty selectMyBusinessCategory }">
	                <div class="inner_content">
	                    <h4>1. 신청하실 사업장을 선택하세요.</h4>
	                    <br>
	                   <div class="card text-dark bg-light mb-3" style="max-width: 100rem;">
								  <div class="card-header">사업장 신청 주의사항</div>
								  <div class="card-body">
								    <p class="card-text">* <b>신청 대기중</b> 또는 현재 <b>배너 광고가 진행중인 사업장</b>은 목록에 리스트되지 않습니다.</p>
								  </div>
								</div>
	                    <select class="form-select" aria-label="Default select example" name="bus_code">
	                        <option>선택</option>
	                        <c:forEach var="smbc" items="${ selectMyBusinessCategory }">
								<option value="${ smbc.bus_code }">No : ${ smbc.bus_code } | 사업장명 : ${ smbc.bus_name } | 주소 : ${ smbc.bus_address }</option>
							</c:forEach>
	                     </select>
	                </div>
	            </c:when>
	            <c:otherwise>
	            <div class="nonSelectCategory" style="margin-right: 10%;">
	            	<div class="card">
					  <h5 class="card-header">알려드립니다.</h5>
					  <div class="card-body">
					    <h5 class="card-title">${ loginUser.usname }님께서 배너 광고로 등록할 수 있는 사업장이 없습니다.</h5>
					    <p class="card-text"><b>현재 배너 광고 중인 사업장은 목록에 리스트되지 않습니다.</b></p>
					     <a style="font-size: 15px; color: white;" class="btn btn-secondary" href="${ contextPath }/mypage/buserinfo">마이페이지 가기</a>
					  </div>
					</div> 
	            </div>   	
	            </c:otherwise>
            </c:choose>
            	<c:if test="${ !empty selectMyBusinessCategory }">
                <div class="inner_content">
                    <h4>2. 배너 이미지를 등록해주세요.</h4> 
					 <br>
                    <div class="mb-3">
                    	
                    	<div class="img_div_part">
			  					<div class="card text-dark bg-light mb-3" style="max-width: 100rem;" id="imgCautionText">
								  <div class="card-header">이미지 업로드 주의사항</div>
								  <div class="card-body">
								    <p class="card-text">* 정해진 픽셀은 없으나, 노출시 가로 규격은 일정한 사이즈 (700px)를 기준으로 노출되므로 제출시 <b>최대한 가로 사이즈가 넓은 이미지</b>로 업로드 하시는 것을 권유 드립니다.
									                            <br>&nbsp;<font style="color: red;">(지나치게 사이즈가 작은 이미지나 큰 사진은 반려될 수 있음)</font></p>
									<p class="card-text">* 등록하시는 사업장 카테고리 및 배너 이벤트 내용과 <b>이미지가 일치하지 않으면 반려처리</b> 될 수 있으니 이 점 유의 바랍니다.
									    					    <br>&nbsp;<font style="color: red;">(허위광고 및 욕설/음란 이미지는 반려됨)</font></p>
								  </div>
								</div>
		  				</div>
                    	
                        <input class="form-control" type="file" id="formFile" name="uploadFile" required>
                        <br>
                        <!-- 업로드한 이미지가 노출되는 부분 -->   	
					    <div class="img_div_part">
							<img id="exp_img_part">
					    </div>
						    
                    </div>
                </div>
                </c:if>
                
                <c:if test="${ !empty selectMyBusinessCategory }">
                <div class="inner_content">
                    <h4>3. 배너 신청 이유를 기재해주세요.</h4> <br>
                    <div class="card text-dark bg-light mb-3" style="max-width: 100rem;">
					  <div class="card-header">신청 이유 기재시 주의사항</div>
					  <div class="card-body">
					    <p class="card-text">* 고객에게 노출되는 문구가 아닌, <b>관리자가 해당 광고에 대한 심사를 진행할 때 고려</b>하는 사항입니다.</p>
					    <p class="card-text">* 이벤트를 진행 예정이라면 어떤 이벤트인지 기재 <b>(ex.삼다도에서 예약한 회원에게 3000쿠폰 지급 등)</b></p>
					  </div>
					</div>
                    <div class="form-floating">
                        <textarea class="form-control" name="alintro" placeholder="해당 사업장에 대한 간단한 소개를 해주세요." id="floatingTextarea" required></textarea>
                    </div>  
                </div>
                </c:if>
                
              	<input type="hidden" name="usno" value="${ loginUser.usno }">
              	
              	<c:if test="${ !empty selectMyBusinessCategory }">
                <div class="inner_content">               
                    <button type="submit" class="btn btn-secondary" id="submit_bannerBtn" style="margin-left: 50%;">신청하기</button> 
                </div>
                </c:if>
                
            </form>
        
        </div>
    </div>
 </div>
 	<br><br>
 	<!-- 푸터 -->
 	<div class="row" style="width: 88.2%;">             
 		<jsp:include page="../common/footer.jsp"/>
    </div> 
 
 </div>
 
 <script>
		function submitValidate(){

			if (confirm("제출시 수정할 수 없습니다. 제출하시겠습니까?") == true){
				return true;
			} else {
			    return false;
			}
			
			return true;
		}
		
		function goToPoint(){
			location.href='${contextPath}/mypage/point?usno='+${loginUser.usno};
		};
		
		
	
	</script>

 <!-- 모달창 자동 onload -->
 <script>
      $(document).ready(function() {
            $('#myModal').modal("show");
        });
      
      $('#imgCaution').mouseover(function() {
    	  ('#imgCautionText').display("block")
      });
 </script>
 
 <!-- 업로드한 첨부파일 아래에 출력되도록 -->
 <script>
	$(function () {
		$("[type=file]").change(function() { 
			loadImg(this);
		});
	});
	
	function loadImg(element) { 
		if (element.files && element.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				
				var selector;
				var size;

				switch(element.name) {
				case "uploadFile" :
					selector = "#exp_img_part";
					size = {width:"700px"};
					break;
				}
				
				$(selector).attr("src", e.target.result).css(size); 

			}

			reader.readAsDataURL(element.files[0]);
		}
	}	
</script>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
-->
   
</body>
</html>


