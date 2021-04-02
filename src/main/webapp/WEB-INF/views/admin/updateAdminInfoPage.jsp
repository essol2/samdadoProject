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
        
        <!-- admin-navi 인클루드 -->
         <jsp:include page="admin-navi.jsp"/>

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
		                <input type="text" id="business_no" aria-label="busno" name="busno" class="form-control" value="${ loginUser.busno }">
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
			var bizNum = $("#business_no").val();
			if(bizNum != "" && !(/\d{3}[-]\d{2}[-]\d{5}/).test(bizNum)){
				alert('사업자등록번호를 확인해주세요.');
				$("#business_no").select();
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
     	
         $("#business_no").change(function () {
             var busnoval = $("#bussiness_no").val();
             var regbusno = /\d{3}[-]\d{2}[-]\d{5}/;
             if (regbusno.test(busnoval)) {
                 $("#test_business_no_label").html("올바른 입력입니다.").css("color", "green");
             } else {
                 $("#test_business_no_label").html("올바른 형식이 아닙니다.").css("color", "red");
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