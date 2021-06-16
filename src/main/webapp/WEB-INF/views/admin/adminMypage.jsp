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
      <link rel="icon" type="image/png" sizes="16x16" href="${contextPath }/resources/images/image_main/logo_g.png">
  
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminMypage.css" type="text/css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminHome.css" type="text/css">

     <!--차트 api cdn-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
  </head>
  <body>
  
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
   
    <div class="container-fluid">
      <div class="row">
        
        <!-- admin-navi 인클루드 -->
         <jsp:include page="admin-navi.jsp"/>

        <!-- B영역 -->

        <div class="col-10" id="B">
            <br>
            <!-- 관리자 정보 select -->
            <h3>관리자 <span style="color: red;">정보</span></h3>
            <br>
			<h6>* 아이디와 생년월일은 수정이 불가합니다.</h6>
			<h6>* 비밀번호는 <b>'변경하기'</b>를 클릭하시면 수정 페이지에서 수정하실 수 있습니다.</h6>
            <div class="row">
            	<div id="box-container" class="col">
	              <div class="input-group">
	                <span class="input-group-text">이름</span>
	                <input type="text" aria-label="usname" name="usname" class="form-control" value="${ loginUser.usname }" readonly>
	              </div>
	              <div class="input-group">
	                <span class="input-group-text">아이디</span>
	                <input type="text" aria-label="usid" name="usid" class="form-control" value="${ loginUser.usid }" readonly>
	              </div>
	              <div class="input-group">            	
	                <span class="input-group-text">생년월일</span>
		                <input type="text" aria-label="usbirth" name="usbirth" class="form-control"  value="<fmt:formatDate value='${ loginUser.usbirth }' type='both' pattern='yyyy-MM-dd' />" readonly>
	              </div>
	              <div class="input-group">
	                <span class="input-group-text">이메일</span>
	                <input type="text" aria-label="usemail" name="usemail" class="form-control" value="${ loginUser.usemail }" readonly>
	              </div>
	              <div class="input-group">
	                <span class="input-group-text">사업자등록번호</span>
	                <input type="text" aria-label="busno" name="busno" class="form-control" value="${ loginUser.busno }" readonly>
	              </div>
	              <div class="input-group">
	                <span class="input-group-text">휴대전화</span>
	                <input type="text" aria-label="usphone" name="usphone" class="form-control" value="${ loginUser.usphone }" readonly>
	              </div>
              </div>
              <div id="box-container-label" class="col">              
	               <label id="test_name_label" class="test_div"></label> <br><br><br><br><br>
	               <label id="test_email_label" class="test_div"></label> <br><br>          
	               <label id="test_bussiness_no_label" class="test_div"></label><br><br>
	               <label id="test_phone_label" class="test_div"></label>	                  
		     </div>
            </div>
              <br>
              <button class="btn btn-secondary" style="margin-left : 43.5%; margin-top: -1%;" id="updateInfoBtn" onclick="location.href='${ contextPath }/admin/updateAdminInfoPage'">수정하기</button>  	
          	
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