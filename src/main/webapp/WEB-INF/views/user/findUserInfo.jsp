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
    <link rel="stylesheet" href="${ contextPath }/resources/css/user/findUserInfo.css">
    <!-- css 파일 경로 이동하기 -->

    <title>아이디/비밀번호 찾기</title>
  </head>
  <body>
  
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
   
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty findUser }">
   		<script>alert('회원님의 아이디는 ${ findUser.usid } 입니다.')</script>
   		<c:remove var="msg" />
   </c:if>

    <div class="container">
        
          <div class="py-5 text-center">
            <a href="${ contextPath }/main"><img class="d-block mx-auto mb-4" src="${ contextPath }/resources/images/image_main/logo_g.png" alt="" width="72" height="57"></a>
            <h1>개인정보 찾기</h1>
            <!-- <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p> -->
          </div>
          
          <br>

          <div class="row">
              <!--아이디 찾기-->
              <div class="col">
                <div>
                    <h4>- 아이디 찾기</h4>

                    <form action="${ contextPath }/user/findId" method="POST">
                      <div class="row g-3">
                        <div class="col-sm-12">
                          <label for="name" class="form-label">이름</label>
                          <input type="text" class="form-control" name="usname" id="name1" placeholder="이름" required>                    
                        </div>
            
                        <div class="col-12">
                          <label for="email" class="form-label">이메일</label>
                          <input type="email" class="form-control" name="usemail" id="usemail" placeholder="you@example.com" required>                          
                        </div>

                        <div class="col-12">
                            <label for="phone" class="form-label">전화번호</label>
                            <input type="text" class="form-control" name="usphone" id="usphone" placeholder="01012345678" required>                            
                        </div> 
                        
                        <div class="empty_div" style="margin-bottom : 71px;"> <!-- 비밀번호  hr 과 동일하게 맞추기 위해 빈 여백 줌--></div> 
                      
                      </div>

                      <hr class="my-4">
            
                      <button type="submit" id="go_find_id_btn" style="background-color: white; border: none; font-size: 20px; font-weight: bold; color: green; margin-left: 80%;">아이디 찾기</button>
                    </form>
                  </div>
              </div>
              <!--비밀번호 찾기-->
              <div class="col">
                <div>
                    <h4>- 비밀번호 찾기</h4>

                    <form action="${ contextPath }/user/findPwd" method="POST">
                      <div class="row g-3">
                        <div class="col-sm-12">
                          <label for="name2" class="form-label">이름</label>
                          <input type="text" class="form-control" name="usname" id="usname2" placeholder="이름" required>                      
                        </div>

                        <div class="col-12">
                            <label for="_id" class="form-label">아이디</label>
                            <input type="text" class="form-control" name="usid" id="usid2" placeholder="아이디" required>                           
                        </div>            
                        <div class="col-12">
                          <label for="email" class="form-label">이메일</label>
                          <input type="email" class="form-control" name="usemail" id="usemail2" placeholder="you@example.com" required>                          
                        </div>

                        <div class="col-12">
                            <label for="phone" class="form-label">전화번호</label>
                            <input type="text" class="form-control" name="usphone" id="usphone2" placeholder="01012345678" required>                           
                        </div>                    
                      </div>
            
                      <hr class="my-4">
            
                      <button type="submit" style="background-color: white; border: none; font-size: 20px; font-weight: bold; color: green; margin-left: 76%;">비밀번호 찾기</button>
                    </form>
                  </div>
              </div>
           
          </div>
      </div>
      

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