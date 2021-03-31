<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fmt 라이브러리 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- core 라이브러리 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴바는 어떤 페이지이든 포함하고 있으므로 contextPath 변수 선언 후 application에서 모두 사용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminMypage.css" type="text/css">
	
	<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

     <!--차트 api cdn-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-2" id="A">
          <div>
              <!-- 프로필사진 -------------------------------------------------------------------------------------------------------------------------------->
              <div class="card" style="width: 99%; border-style: none;">
                   <img src="${ contextPath }/resources/images/image_admin/logo_g.png" class="card-img-top" alt="...">
                  <div style="padding-top: 4%; padding-bottom: 2%; padding-right: 2%;">
                    <h5 style="text-align: center;"><b>${ loginUser.usid }</b></h5>
                  </div>
                </div>
                <br>
                
                <!-- 왼쪽 네비바 ------------------------------------------------------------------------------------------------------------------------------------->
                <div>
                  <li class="nav-item" style="text-decoration-style: none;">
                      <a class="nav-link active" aria-current="page" href="#">
                        <span data-feather="home">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-columns-gap" viewBox="0 0 16 16">
                            <path d="M6 1v3H1V1h5zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H1zm14 12v3h-5v-3h5zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5zM6 8v7H1V8h5zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H1zm14-6v7h-5V1h5zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1h-5z"/>
                          </svg>
                        </span>
                        대시 보드
                      </a>
                    </li>
                    <br>
                    <li class="nav-item">
                      <a class="nav-link" href="#">
                        <span data-feather="file">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
                            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
                          </svg>
                        </span>
                        광고 관리
                      </a>
                    </li>
                  <br>
                    <li class="nav-item">
                      <a class="nav-link" href="#">
                        <span data-feather="shopping-cart">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-diamond" viewBox="0 0 16 16">
                            <path d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                          </svg>
                        </span>
                        신고 관리
                      </a>
                    </li>
                    <br>
                    <li class="nav-item">
                      <a class="nav-link" href="#">
                        <span data-feather="users">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
                            <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                            <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                          </svg>
                        </span>
                        Q&A 관리
                      </a>
                    </li>
                  </ul>
                </div> 
  
                <br>
                <hr style="width: 98%;">
  
                <br>
                <span>settings</span>
                <a class="link-secondary" href="#" aria-label="Add a new report">
                  <span data-feather="plus-circle"></span>
                </a>
              </h6>
              <ul class="nav flex-column mb-2">
                <li class="nav-item">
                  <a class="nav-link" href="#">
                    <span data-feather="file-text">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                        <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                      </svg>
                    </span>
                    마이페이지
                  </a>
                </li>
              </ul>
          </div>
        </div>

        <!-- B영역 -->

        <div class="col-10" id="B">
            <br>
            <!-- 관리자 정보 select -->
            <h3>관리자 <span style="color: red;">정보 수정</span></h3>
            <br>
			<h6>* 아이디와 생년월일은 수정이 불가합니다.</h6>
			<h6>* 비밀번호는 '변경하기'를 클릭하시면 수정 페이지로 이동합니다.</h6>
			<form action="${ contextPath }/admin/updateAdminInfo" method="post" id="adminUpdateInfoForm" onsubmit="return submitValidate();">
				<div class="row">
	            	<div id="box-container" class="col">
		              <div class="input-group">
		                <span class="input-group-text">이름</span>
		                <input type="text" id="name" name="usname" aria-label="usname" class="form-control" value="${ loginUser.usname }">
		              </div>
		              <div class="input-group">
		                <span class="input-group-text">아이디</span>
		                <input type="text" aria-label="usid" name="usid" class="form-control" value="${ loginUser.usid }" readonly>
		              </div>
		              <div class="input-group">
		                <span class="input-group-text">생년월일</span>
		                <input type="text" aria-label="usbirth" class="form-control"  value="<fmt:formatDate value='${ loginUser.usbirth }' type='both' pattern='yyyy-MM-dd' />" readonly>
		              </div>
		              <div class="input-group">
		                <span class="input-group-text">이메일</span>
		                <input type="text" id="email" aria-label="usemail" name="usemail" class="form-control" value="${ loginUser.usemail }">
		              </div>
		              <div class="input-group">
		                <span class="input-group-text">사업자등록번호</span>
		                <input type="text" id="bussiness_no" aria-label="busno" name="busno" class="form-control" value="${ loginUser.busno }">
		              </div>
		              <div class="input-group">
		                <span class="input-group-text">휴대전화</span>
		                <input type="text" id="phone" aria-label="usphone" name="usphone" class="form-control" value="${ loginUser.usphone }">
		              </div>
		              <div class="input-group">
		                <span class="input-group-text">비밀번호</span>
		                <input type="text" id="findPwd" onclick="location.href='${ contextPath }/user/find'" class="form-control" value="변경하기" readonly>         
		              </div>       
	                </div>
	              
		              <div id="box-container-label" class="col">              
			                <label id="test_name_label" class="test_div"></label> <br><br><br><br><br>
			                <label id="test_email_label" class="test_div"></label> <br><br>          
			                <label id="test_bussiness_no_label" class="test_div"></label><br><br>
			                <label id="test_phone_label" class="test_div"></label>	                  
		              </div>
	             </div>
	             <input type="hidden" name="uspart" value="${ loginUser.uspart }">
              <button class="btn btn-secondary" id="updateInfoBtn" onclick="location.href='${ contextPath }/admin/updateAdminInfo'">수정하기</button>
          
			</form>
          
          </div>

   
    </div>
</div>

	 <!-- 수정폼 제출 전 유효성검사 -->
	<script>
		function submitValidate(){
			
			// 이름 유효성검사
			if(!(/^[가-힣]{2,5}$/).test($("#name").val())){
				alert('이름은 한글로 2~5글자 사이만 가능합니다.');
				$("#name").select();
				return false;
			}
			
			// 이메일 유효성검사
			if(!((/^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test($("#email").val()))){
				alert('이메일주소를 확인해주세요.');
				$("#email").select();
				return false;
			}
			
			// 이메일 중복검사
			if(/.중복된 이메일로 사용할 수 없습니다./.test($("#test_email_label").text())){
				console.log($("#test_email_label").text());
				alert('중복된 이메일입니다.');
				$("#email").select();
				return false;
			}
			
			// 사업자등록번호 유효성검사
			var bizNum = $("#bussiness_no").val();
			if(bizNum != "" && !(/\d{3}[-]\d{2}[-]\d{5}/).test(bizNum)){
				alert('사업자등록번호를 확인해주세요.');
				$("#bussiness_no").select();
				return false;
			}
			
			// 전화번호 유효성검사
			if(!(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/).test($("#phone").val())){
				alert('전화번호를 확인해주세요.');
				$("#phone").select();
				return false;
			}
			
			// 전화번호 중복검사
			if(/.중복 휴대전화로 사용할 수 없습니다./.test($("#test_phone_label").text())){
				console.log($("#test_phone_label").text());
				alert('중복된 전화번호입니다.');
				$("#phone").select();
				return false;
			}
			
			return true;
		}
	
	</script>
    
    
    <!-- 입력폼 유효성검사 -->
    <script>
    	$("#name").change(function () {
            var regname = /^[가-힣]{2,5}$/;
            
            if (regname.test($(this).val())) {
                $("#test_name_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_name_label").html("올바른 입력이 아닙니다.").css("color", "red");
            }
        });
    	
    	$("#email").change(function () {
     	   var emailVal = $("#email").val();
            var regemail = /^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

            if (regemail.test(emailVal)) {
                 $("#test_email_label").html("올바른 입력입니다.").css("color", "green");
               	$.ajax({
       				url: "${ contextPath }/user/emailCheck",
       				data: { usemail : emailVal },
       				type: "post",
       			}).done(function(data){
       				console.log(data);
       				if (data == "fail") {  // 중복일때
       					console.log("이메일 중복!");
   						$("#test_email_label").html("중복된 이메일로 사용할 수 없습니다.").css("color", "red");
       				} else { // 중복이 아닐때
       					console.log("이메일 사용가능!");
   						$("#test_email_label").html("사용할 수 있는 이메일입니다.").css("color", "green");
       				}
       			}).fail(function(){
       				console.log("ajax response fail..");
       			}).always(function(){
       				console.log("always is done..!");
       			});
            } else {
                $("#test_email_label").html("이메일을 다시 입력해주세요.").css("color", "red");
            }
  
        });
     	
         $("#bussiness_no").change(function () {
             var busnoval = $("#bussiness_no").val();
             var regbusno = /\d{3}[-]\d{2}[-]\d{5}/;
             if (regbusno.test(busnoval)) {
                 $("#test_bussiness_no_label").html("올바른 입력입니다.").css("color", "green");
             } else {
                 $("#test_bussiness_no_label").html("올바른 형식이 아닙니다.").css("color", "red");
             }
         });
    	
    	$("#phone").change(function () {
			var phoneVal = $("#phone").val();
			var regphone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})?[0-9]{3,4}?[0-9]{4}$/;

            if (regphone.test(phoneVal)) {
                $("#test_phone_label").html("올바른 입력입니다.").css("color", "green");
               	$.ajax({
       				url: "${ contextPath }/user/phoneCheck",
       				data: { usphone : phoneVal },
       				type: "post",
       			}).done(function(data){
       				console.log(data);
       				if (data == "fail") {  // 중복일때
       					console.log("휴대전화 중복!");
   						$("#test_phone_label").html("중복 휴대전화로 사용할 수 없습니다.").css("color", "red");
       				} else { // 중복이 아닐때
       					console.log("휴대전화 사용가능!");
   						$("#test_phone_label").html("사용할 수 있는 휴대전화입니다.").css("color", "green");
       				}
       			}).fail(function(){
       				console.log("ajax response fail..");
       			}).always(function(){
       				console.log("always is done..!");
       			});
            } else {
                $("#test_phone_label").html("휴대전화를 다시 입력해주세요.").css("color", "red");
            }
  
        });
    	
    </script>






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