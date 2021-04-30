<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/user/updatepwd.css">
    <!-- css 파일 경로 이동하기 -->

    <title>비밀번호 변경</title>
    <link rel="icon" type="image/png" sizes="16x16" href="${contextPath }/resources/images/image_main/logo_g.png">
  </head>
  <body>
  
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
  
    <div class="container">
        
          <div class="py-5 text-center">
            <a href="${ contextPath }/main"><img class="d-block mx-auto mb-4" src="${ contextPath }/resources/images/image_main/logo_g.png" alt="" width="72" height="57"></a>
            <h1>비밀번호 재설정</h1>
            <!-- <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
          </div>
          
          <br>

          <div class="row">
              
              <!--비밀번호 찾기-->
              <div class="col">
                <div>
                    <h4>- 비밀번호 재설정</h4>

                    <form action="${ contextPath }/user/email/changePwdForm" method="POST" onsubmit="return submitValidate();">
                      <div class="row g-3">
                        <div class="col-sm-12">
                          <label for="name2" class="form-label">이름</label>
                          <input type="text" class="form-control" name="usname" id="usname" placeholder="이름" required>                      
                        </div>

                        <div class="col-12">
                            <label for="_id" class="form-label">아이디</label>
                            <input type="text" class="form-control" name="usid" id="usid" placeholder="아이디" required>                           
                        </div>
                        
                        <div class="col-12">
                            <label for="_pwd" class="form-label">수정할 비밀번호</label>
                            <label id="test_pwd_label" class="test_div"></label>
                            <input type="password" class="form-control" name="uspwd" id="uspwd" placeholder="영어대소문자/숫자/특수문자를 포함한 8~16자" required>                           
                        </div>
                        
                        <div class="col-12">
                            <label for="_pwd" class="form-label">비밀번호 확인</label>
                            <label id="test_pwd2_label" class="test_div"></label>
                            <input type="password" class="form-control" name="uspwd2" id="uspwd2" placeholder="비밀번호 확인" required>                           
                        </div>
                                    
                      </div>
            
                      <hr class="my-4">
            
                      <button type="submit" style="background-color: white; border: none; font-size: 20px; font-weight: bold; color: green; margin-left: 88.5%;">비밀번호 변경</button>
                    </form>
                  </div>
              </div>
           
          </div>
      </div>
      
      
      <!-- 회원가입 제출 전 유효성검사 -->
	<script>
		function submitValidate(){

			// 비밀번호 유효성검사
			if(!(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/.test($("#uspwd").val()))){
				alert('영어대소문자/숫자/특수문자를 포함한 8~16자리 입력');
				$("#uspwd").select();
				return false;
			}
			
            // 비밀번호일치 검사
			if($("#uspwd2").val() != $("#uspwd").val()){
				alert('비밀번호가 일치하지 않습니다.');
				$("#uspwd2").select();
				return false;
			}
            
			return true;
		}
	
	</script>
    
    
    <!-- 비밀번호 유효성검사 -->
    <script>
    	$("#uspwd").change(function () { 
            var regpwd = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/;
            if (!regpwd.test($(this).val())) {
                $("#test_pwd_label").html("영어대소문자/숫자/특수문자를 포함한 8~16자").css("color", "red");
            } else {
                $("#test_pwd_label").html("사용 가능한 비밀번호입니다.").css("color", "green");
            }
            
        });

        $("#uspwd2").change(function () {
            if ($("#uspwd2").val() != $("#uspwd").val()) {
                $("#test_pwd2_label").html("비밀번호가 일치하지 않습니다.").css("color", "red");
            } else {
                $("#test_pwd2_label").html("비밀번호가 일치합니다.").css("color", "green");
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