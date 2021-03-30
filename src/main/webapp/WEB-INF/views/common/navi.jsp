<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

<!-- css 외부 파일 첨부 -->
<link rel="stylesheet" href="${ contextPath }/resources/css/common/navi.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/user/addMember.css" type="text/css">

</head>
<body>
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
   
   <!-- 회원가입 제휴회원 버튼 js -->
   <script>
       function display() {
           var control = document.getElementById("bussiness_no_div");    
           
           <%--alert(control.style.display);--%>
           
           if (control.style.display == 'block') {
               control.style.display = 'none';
           } else {
               control.style.display = 'block';
           }
       }
   </script>
   
    <header>
     <div class="navi" id="buss-navi-id">
         <br><br>
         <p class="center" id="navi-title">삼다도</p>
         <a href="#" ><p class="center" id="navi-menu">나만의 길 만들기</p></a>
         <a href="#" ><p class="center" id="navi-menu">전체 제주 관광지 보기</p></a>
         
         <c:if test="${!empty sessionScope.loginUser && loginUser.uspart eq '제휴' && loginUser.uspart ne '관리자' }">
         <li class="naviforB-li-class"><a href="#" class="center" id="navi-menu-buss"><p>삼다도에서 사업하기</p></a>
             <ul class="ul-class">
                 <li><a href="#" class="center" id="navi-menu-buss-hotel"><p>호텔 등록하기</p></a></li>
                 <li><a href="#" class="center" id="navi-menu-buss-rent"><p>렌트카 등록하기</p></a></li>
                 <li><a href="#" class="center" id="navi-menu-buss-restau"><p>음식점 등록하기</p></a></li>
                 <li><a href="#" class="center" id="navi-menu-buss-attrac"><p>관광지 등록하기</p></a></li>
                 <li><a href="${ contextPath }/bussiness/submit/bannerAd" class="center" id="navi-menu-buss-banner"><p>배너(리스팅)광고</p></a></li>
             </ul>
         </li>
         </c:if>
     </div>
       
    <div>
	   	<img class="img" width="50px" height="50px" src="${ contextPath }/resources/images/image_main/logo_g.png"></img>
	   	
	   	<h5 class="helloName">${ loginUser.usname }님 <br>
	   	혼저옵서예</h5> 
	    <!-- 관리자 일때만 보이는 관리자 홈 버튼 -->
	    <c:if test="${!empty sessionScope.loginUser && loginUser.uspart eq '관리자'}">
	    	<a href="${ contextPath }/admin/home" ><p class="right" id="adminHomeBtn">관리자 홈</p></a>
	    	<a href="${ contextPath }/user/logout" ><p class="right" id="logOutBtn">일상으로</p></a>
	    </c:if>
	    
	    <!-- 일반유저 혹은 제휴회원 일때만 보이는 내정보 버튼 -->
	    <c:if test="${ !empty sessionScope.loginUser && loginUser.uspart eq '제휴' || loginUser.uspart eq '일반' && loginUser.uspart ne '관리자' }">
	    	<a href="${ contextPath }/user/myPage" ><p class="right" id="myPage">내 정보</p></a>
	    	<a href="${ contextPath }/user/logout" ><p class="right" id="logOutBtn">일상으로</p></a>
	    </c:if>
	   		
	   	<!-- 로그인 유저가 없다면 -->
	   	<c:if test="${ empty sessionScope.loginUser }">
	   		<p class="right" data-bs-toggle="modal" data-bs-target="#loginModal" id="navi-menu">들어가기</p>
		    <p class="right" data-bs-toggle="modal" data-bs-target="#addUserModal" id="navi-menu">회원가입</p>
	   	</c:if>
   </div>       

  </header>
    
    <!-- 회원가입 Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <img src="resources/images/image_main/logo_g.png"> <!-- 이미지 경로 이동하기 -->
            <h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2>
            <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
            </div>
            
           <form action="${ contextPath }/user/join" method="post" id="joinForm" onsubmit="return joinValidate();">
             <div class="modal-body">
                <!--이름-->
	                <div class="name_div">
	                    <label for="id">* 이름</label>
	                    <label id="test_name_label" class="test_div"></label>
	                    <input type="text" id="name" name="usname" placeholder="홍길동" required>
	                </div>
	                <!--아이디-->
	                <div class="id_div">
	                    <label for="id">* 아이디</label>

	                    <label id="test_id_label" class="test_div"></label>

	                    <input type="text" id="id" name="usid" placeholder="영어숫자포함" required>
	                </div>	
	                <!--비밀번호-->
	                <div class="pwd_div">
	                    <label for="pwd">* 비밀번호</label>
	                    <label id="test_pwd_label" class="test_div"></label>
	                    <input type="password" id="pwd" name="uspwd" placeholder="대소문자 포함 8글자 이상" required>
	                </div>
	                <!--비밀번호 확인-->
	                <div class="pwd_div2">
	                    <label for="pwd2">* 비밀번호 확인</label>
	                    <label id="test_pwd2_label" class="test_div"></label>
	                    <input type="password" id="pwd2" name="uspwd2" placeholder="비밀번호 확인" required>
	                </div>
	                <!--이메일-->
	                <div class="email_div">
	                    <label for="email">* 이메일</label>
	                    <label id="test_email_label" class="test_div"></label>
	                    <input type="email" id="email" name="usemail" placeholder="you@example.com" required>
	                </div>
	                <!--생년월일-->
	                <div class="birth_div">
	                    <label for="birth">* 생년월일</label>
	                    <label id="test_birth_label" class="test_div"></label>
	                    <input type="date" id="birth" max="9999-12-31" name="usbirth" placeholder="1994-09-28" required>
	                </div>
	                <!--생년월일-->
	                <div class="phone_div">
	                    <label for="phone">* 휴대전화</label>
	                    <label id="test_phone_label" class="test_div"></label>
	                    <input type="text" id="phone" name="usphone" placeholder="01012345678" required>
	                </div>
	                <!--사업자등록번호-->
	                <a href="javascript:display();"><h5 id="bussiness_text"><b>&gt;&gt; 제휴회원 이세요?</b></h5></a>
	                <div id="bussiness_no_div">
	                    <label for="bussiness_no">* 사업자등록번호</label>
	                    <label id="test_bussiness_no_label" class="test_div"></label>
	                    <input type="text" id="bussiness_no" name="busno" placeholder="000-00-00000">
	                </div>            
		            </div>
		            <div class="modal-footer">
		                <label><input type="checkbox" name="agreement" id="agreement_checkbox" value="개인정보수집동의" required>개인정보수집 동의</label>
		                <input type="submit" id="goaddMemberBtn" value="가입하기">
		                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
		            </div>
		         </form>
	        </div>
        </div>	
    </div>
    
     <!-- 로그인 Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <img src="resources/images/image_main/logo_g.png"> <!-- 이미지 경로 이동하기 -->
            <h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2>
            <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
            </div>
           
             <form action="${ contextPath }/user/login" method="post" id="loginForm"> 
	            <div class="modal-body">
	                <!--아이디-->
	                <div class="id_div">
	                    <label for="id">* 아이디</label>
	                    <label id="test_id_label" class="test_div"></label>
	                    <input type="text" id="id" name="usid" placeholder="영소문자로 시작하는 4~16글자 입력(숫자 포함 가능)" required>
	                </div>
	                <!--비밀번호-->
	                <div class="pwd_div">
	                    <label for="pwd">* 비밀번호</label>
	                    <label id="test_pwd_label" class="test_div"></label>
	                    <input type="password" id="pwd" name="uspwd" placeholder="영어대소문자/숫자/특수문자를 포함한 8~16자" required>
	                </div> 
	
	                <br><br>
	
	                <!--간편 로그인-->
	                <div class="easy_login_div">
	                    <label for="pwd">간편 로그인</label> <br>
	                    <div class="easy_login_imgs">
	                        <div class="container">
	                            <div class="row">
	                            <div class="col-sm">
	                                <a href="#"><img src="resources/images/image_user/google.png" id="google_img" alt="">  구글</a>
	                            </div>
	                              <div class="col-sm">
	                               <a href="#"><img src="resources/images/image_user/naver.png" alt=""> 네이버</a>
	                              </div>
	                              <div class="col-sm">
	                                <a href="#"><img src="resources/images/image_user/kakao.png" alt=""> 카카오</a>
	                              </div>
	                            </div>
	                          </div>
	                    </div>
	                </div> 
	            </div>
	            <div class="modal-footer">
	                <a href="${ contextPath }/user/find" id="find_id_pwd">아이디/비밀번호 찾기</a> <!-- 새 창 띄우기-->
	
	                <input type="submit" id="gologinBtn" value="로그인">
	                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
	            </div>
	         </form>   
        </div>
        </div>
    </div>
    
     <!-- 회원가입 제출 전 유효성검사 -->
	<script>
		function joinValidate(){
			
			// 이름 유효성검사
			if(!(/^[가-힣]{2,5}$/).test($("#name").val())){
				alert('이름은 한글로 2~5글자 사이만 가능합니다.');
				$("#name").select();
				return false;
			}
			
            // 아이디 유효성검사
			if(!(/^[a-z][a-z0-9]{3,15}$/.test($("#id").val()))){
				alert('영소문자로 시작하는 4~16글자 입력(숫자 포함 가능)');
				$("#id").select();		
				return false;
			}
            // 아이디 중복검사
			if(/.중복 아이디로 사용할 수 없습니다./.test($("#test_id_label").text())){
				console.log($("#test_id_label").text());
				alert('중복된 아이디입니다.');
				$("#id").select();
				return false;
			}

			// 비밀번호 유효성검사
			if(!(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/.test($("#pwd").val()))){
				alert('영어대소문자/숫자/특수문자를 포함한 8~16자리 입력');
				$("#pwd").select();
				return false;
			}
			
            // 비밀번호일치 검사
			if($("#pwd2").val() != $("#pwd").val()){
				alert('비밀번호가 일치하지 않습니다.');
				$("#pwd2").select();
				return false;
			}
			
			var date = new Date;
			var inputbirth = new Date($("#birth").val());
			
            // 생년월일 형식 검사
			if(inputbirth > date){
				alert('생년월일을 정확하게 입력하세요.');
				$("#birth").select();
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
			
			// 사업자등록번호 유효성검사
			var bizNum = $("#bussiness_no").val();
			if(bizNum != "" && !(/\d{3}[-]\d{2}[-]\d{5}/).test(bizNum)){
				alert('사업자등록번호를 확인해주세요.');
				$("#bussiness_no").select();
				return false;
			}

			return true;
		}
	
	</script>
    
    
    <!-- 회원가입폼 유효성검사 -->
    <script>
    	$("#name").change(function () {
            var regname = /^[가-힣]{2,5}$/;
            
            if (regname.test($(this).val())) {
                $("#test_name_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_name_label").html("올바른 입력이 아닙니다.").css("color", "red");
            }
        });
    	
    	$("#id").change(function () {
			var idVal = $("#id").val(); // 사용자가 입력한 id 값 추출
			
			var regengid = /^[a-z](?=.*\d)[a-z0-9]{3,15}$/; // 영어로시작, 영, 숫 4~16글자
            //console.log(idVal);
            
            if (regengid.test(idVal)) {
                $("#test_id_label").html("올바른 입력입니다.").css("color", "green");
               	$.ajax({
       				url: "${ contextPath }/user/idCheck",
       				data: { usid : idVal }, // 키(vo 필드명 동일) : 밸류
       				type: "post",
       			}).done(function(data){
       				console.log(data);
       				if (data == "fail") {  // 중복일때
       					console.log("아이디 중복!");
   						$("#test_id_label").html("중복 아이디로 사용할 수 없습니다.").css("color", "red");
       				} else { // 중복이 아닐때
       					console.log("아이디 사용가능!");
   						$("#test_id_label").html("사용할 수 있는 아이디입니다.").css("color", "green");
       				}
       			}).fail(function(){
       				console.log("ajax response fail..");
       			}).always(function(){
       				console.log("always is done..!");
       			});
            } else {
                $("#test_id_label").html("아이디를 다시 입력해주세요.").css("color", "red");
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
    	
    	
    	<%--
    	$("#phone").change(function() {
           var phoneVal = $("#phone").val();
           var regphone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})?[0-9]{3,4}?[0-9]{4}$/;


           if (regphone.test(phoneVal)){
               $("#test_phone_label").html("올바른 입력입니다.").css("color","green");
           } else {
               $("#test_phone_label").html("올바른 형식이 아닙니다.").css("color","red");
           }
       });
       --%>
       
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
    	
    	$("#birth").change(function () {
            var date = new Date;
            var inputbirth = new Date($("#birth").val());

            if (inputbirth < date) {
                $("#test_birth_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_birth_label").html("올바른 형식이 아닙니다.").css("color", "red");
            }
        });
    	
    	<%--
    	$("#email").change(function () {
            var emailVal = $("#email").val();
            var regemail = /^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            if (emailVal.match(regemail) != null) {
                $("#test_email_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_email_label").html("올바른 형식이 아닙니다.").css("color", "red");
            }
        });
    	--%>
    	
    	$("#pwd").change(function () { 
            var regpwd = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/;
            if (!regpwd.test($(this).val())) {
                $("#test_pwd_label").html("영어대소문자/숫자/특수문자를 포함한 8~16자").css("color", "red");
            } else {
                $("#test_pwd_label").html("사용 가능한 비밀번호입니다.").css("color", "green");
            }
            
        });

        $("#pwd2").change(function () {
            if ($("#pwd2").val() != $("#pwd").val()) {
                $("#test_pwd2_label").html("비밀번호가 일치하지 않습니다.").css("color", "red");
            } else {
                $("#test_pwd2_label").html("비밀번호가 일치합니다.").css("color", "green");
            }
        });
        
        $("#bussiness_no").change(function () {
            var busnoval = $("#bussiness_no").val();
            var regbusno = /\d{3}[-]\d{2}[-]\d{5}/; // 258-41-00747 형식 
            if (regbusno.test(busnoval)) {
                $("#test_bussiness_no_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_bussiness_no_label").html("올바른 형식이 아닙니다.").css("color", "red");
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