<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- fmt 라이브러리 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminuserList.css" type="text/css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminHome.css" type="text/css">
	
	<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
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

            <h3>삼다도  <span style="color: red;">회원</span>  리스트</h3>
            <br>
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>회원번호</th>
                        <th>회원명</th>
                        <th>회원 아이디</th>
                        <th>생년월일</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>구분(일반|제휴)</th>
                        <th>사업자등록번호</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
        		 <c:forEach var="aul" items="${ allUserList }">
        		  <c:if test="${ aul.uspart ne '관리자' }">
	                 <tr>
	                     <th>${ aul.usno }</th>
	                     <td>${ aul.usname }</td>
	                     <td>${ aul.usid }</td>           
	                     <td><fmt:formatDate value='${ aul.usbirth }' type='both' pattern='yyyy-MM-dd' /></td>
	                     <td>${ aul.usemail }</td>
	                     <td>${ aul.usphone }</td>
	                     <td>${ aul.uspart }</td>
	                     <td>${ aul.busno }</td>
	                     <td>${ aul.usstatus }</td>
	                 </tr>
	              </c:if>
                </c:forEach>              
                </tbody>
              </table>

             <br><hr>

              <!-- 페이지네이션 -->
              <div class="row-page">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                    <!-- [이전] -->
	               <c:if test="${ pi.currentPage <= 1 }">
	                  [이전] &nbsp;
	               </c:if>
	               <c:if test="${ pi.currentPage > 1 }">
	                  <c:url var="before" value="/admin/userList">
	                     <c:param name="page" value="${ pi.currentPage - 1 }"/>
	                  </c:url>
	                  <a href="${ before }">[이전]</a> &nbsp;
	               </c:if>
	               <!-- 페이지 숫자 -->
	               <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                  <c:if test="${ p eq pi.currentPage }">
	                     <font color="red" size="4"><b>[${ p }]</b></font>
	                  </c:if>
	                  <c:if test="${ p ne pi.currentPage }">
	                     <c:url var="pagination" value="/admin/userList">
	                        <c:param name="page" value="${ p }"/>
	                     </c:url>
	                     <a href="${ pagination }">${ p }</a> &nbsp;
	                  </c:if>
	               </c:forEach>
	               <!-- [다음] -->
	               <c:if test="${ pi.currentPage >= pi.maxPage }">
	                  [다음]
	               </c:if>
	               <c:if test="${ pi.currentPage < pi.maxPage }">
	                  <c:url var="after" value="/admin/userList">
	                     <c:param name="page" value="${ pi.currentPage + 1 }" />
	                  </c:url>
	                  <a href="${ after }">[다음]</a>
	               </c:if>
	              </ul>
                </nav>
            </div>
              
           <!-- 검색 추가 -->
           
            <br> <br>

               <div class="find_user">
                <h3>회원<span style="color: seagreen;"> 조회 </span>하기</h3>
                <br>
                
                <div class="search_user_div">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>-------</option>
                        <option value="usno" <c:if test="${ param.searchCondition == 'usno' }">selected</c:if>>회원 번호</option>
	                    <option value="usname" <c:if test="${ param.searchCondition == 'usname' }">selected</c:if>>회원 이름</option>
	                    <option value="usid" <c:if test="${ param.searchCondition == 'usid' }">selected</c:if>>회원 아이디</option> 
	                    <option value="usbirth" <c:if test="${ param.searchCondition == 'usbirth' }">selected</c:if>>생년 월일</option>
	                    <option value="usemail" <c:if test="${ param.searchCondition == 'usemail' }">selected</c:if>>이메일</option>
	                    <option value="usphone" <c:if test="${ param.searchCondition == 'usphone' }">selected</c:if>>휴대전화</option>
	                    <option value="uspart" <c:if test="${ param.searchCondition == 'uspart' }">selected</c:if>>회원 구분</option>
	                    <option value="busno" <c:if test="${ param.searchCondition == 'busno' }">selected</c:if>>사업자등록번호</option>
	                    <option value="usstatus" <c:if test="${ param.searchCondition == 'usstatus' }">selected</c:if>>회원 상태</option>	                  
                    </select>
                    <input type="text" id="searchValue" class="form-control">
                    <button class="btn btn-secondary" onclick="searchUser();">검색하기</button>
                </div>
                
                <br>

                <table class="table table-borderless" id="resultSearchUserTable">
                    <thead>
                        <tr>
                            <th>회원 번호</th>
                            <th>회원 이름</th>
                            <th>회원 아이디</th>
                            <th>생년 월일</th>
                            <th>이메일</th>
                            <th>휴대 전화</th>
                            <th>회원 구분</th>
                            <th>사업자등록번호</th>
                            <th>회원 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="aul" items="${ searchUserList }">
		        		  <c:if test="${ sul.uspart ne '관리자' }">
			                 <tr>
			                     <th>${ sul.usno }</th>
			                     <td>${ sul.usname }</td>
			                     <td>${ sul.usid }</td>           
			                     <td><fmt:formatDate value='${ sul.usbirth }' type='both' pattern='yyyy-MM-dd' /></td>
			                     <td>${ sul.usemail }</td>
			                     <td>${ sul.usphone }</td>
			                     <td>${ sul.uspart }</td>
			                     <td>${ sul.busno }</td>
			                     <td>${ sul.usstatus }</td>
			                 </tr>
			               </c:if>
	               		</c:forEach>  
	              </tbody>
                  </table>
               </div>
               <br><hr>
               
                <!-- 검색 페이지네이션 -->
                <div class="row-page">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>                       
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        </ul>
                    </nav>
                </div>
               
               <br><br>

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