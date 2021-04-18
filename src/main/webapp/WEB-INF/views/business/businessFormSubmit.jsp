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

<title>Insert title here</title>

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
                    <div class="modal-content">
                        <div class="modal-header">
                        <h4 class="modal-title" id="staticBackdropLabel">잠깐! 먼저 읽어주세요.</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5 id="mymodal_caution_text">배너 광고에 대해 숙지 부탁드립니다.</h5> <br>
                            <h6 id="modal_inner_text">
				                                삼다도 배너 광고는 <b>관리자에 의해 승인</b>이 이루어지면 <br>
				                                신청 순서에 따라 삼다도 메인페이지에 순서대로 노출됩니다. <br>
				                                자세한 사항은 <a href="${ contextPath }/mypage/userinfo"><b>‘삼다도에 대해서’</b></a> 페이지에서 확인 해 주세요! <!-- 페이지 링크 연결-->
				                                <br><br>
				                                배너 광고는 <b style="color: red;">포인트 충전</b>이 필요한 서비스입니다. <br>
				                                포인트 충전은 잊지 않으셨죠?
                             </h6>             
                        <br>
                        <div class="goToPayBtn_div">
                            <a href="${ contextPath }/mypage/userinfo" id="goMyPageBtn" class="btn btn-secondary" style="color: white; text-decoration: none;">동의 후 포인트 충전하러 가기</a> 
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
	                    <h4>1. 신청하실 사업장을 선택하세요.</h4> <br>
	                    <select class="form-select" aria-label="Default select example" name="bus_code">
	                        <option>--- 선택 ---</option>
	                        <c:forEach var="smbc" items="${ selectMyBusinessCategory }">
								<option value="${ smbc.bus_code }">No : ${ smbc.bus_code } | 사업장명 : ${ smbc.bus_name } | 주소 : ${ smbc.bus_address }</option>
							</c:forEach>
	                     </select>
	                </div>
	            </c:when>
	            <c:otherwise>
	            <div class="nonSelectCategory" style="text-align: center; padding: 20%;">
	            	<h3>--- ${ loginUser.usname }님께서 배너 광고로 등록할 수 있는 사업장이 없습니다. ---</h3>
	            	<br>
	            	<h5>* 관리자 승인 대기중인 사업장 또는 이미 배너 광고 중인 사업장은 목록에서 불러올 수 없습니다.</h5>
	            	<h5><a href="${ contextPath }/mypage/buserinfo">[마이페이지 가기]</a></h5>
	            	<h5>[사업장 등록하러 가기]</h5>  
	                <br>
                    <a href='${ contextPath }/business/hotel_write'>호텔 등록</a> | 
	                <a href='${ contextPath }/business/rentcar_write'>렌트카 등록</a> | 
	                <a href='${ contextPath }/business/restaurant_write'>음식점 등록</a> | 
	                <a href='${ contextPath }/business/tour_write'>관광지 등록</a>
	            </div>   	
	            </c:otherwise>
            </c:choose>
            	<c:if test="${ !empty selectMyBusinessCategory }">
                <div class="inner_content">
                    <h4>2. 배너 이미지를 등록해주세요.</h4> <br>
                    <div class="mb-3">
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
                    <h4>3. 해당 사업장에 대한 간단한 소개를 해주세요.</h4> <br>
                    <div class="form-floating">
                        <textarea class="form-control" name="alintro" placeholder="해당 사업장에 대한 간단한 소개를 해주세요." id="floatingTextarea" required></textarea>
                    </div>  
                </div>
                </c:if>
                
              	<input type="hidden" name="usno" value="${ loginUser.usno }">
              	
              	<c:if test="${ !empty selectMyBusinessCategory }">
                <div class="inner_content">               
                    <button type="submit" class="btn btn-secondary" id="submit_bannerBtn">신청하기</button> 
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
	
	</script>

 <!-- 모달창 자동 onload -->
 <script>
      $(document).ready(function() {
            $('#myModal').modal("show");
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
					size = {width:"800px", height:"1000px"};
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


