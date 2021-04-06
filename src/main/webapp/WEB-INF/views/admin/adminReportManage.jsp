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
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminReportManage.css" type="text/css">
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
            <!--신고 신규 내역 -->
            <h3>신고 <span style="color: red;">신규</span>  내역</h3>
            <br>
            <table class="table table-borderless" id="reportTable">
                <thead>
                    <tr>
                        <th>신고 번호</th>
                        <th>신고 사유</th>
                        <th>신고 내용</th>
                        <th>신고 날짜</th>
                        <th>첨부 파일</th>
                        <th>처리 상태</th>
                        <th>회원 이름</th> <!-- 회원 이름으로 바꾸기 -->
                        <th>사업장 코드</th>
                        <th>승인 버튼</th>
                        <th>반려 버튼</th>
                    </tr>
                </thead>
                
                <tbody>        
                <c:forEach var="rpl" items="${ reportList }">
                   <tr>
                       <th id="report_no">${ rpl.report_no }</th>
                       <td>${ rpl.rep_res }</td>
                       <td>${ rpl.rep_cont }</td>                       
                       <td><fmt:formatDate value='${ rpl.rdate }' type='both' pattern='yyyy-MM-dd' /></td>
                       <td><a class="btn btn-info" href="#">보기</a></td>
                       <c:if test="${ rpl.rstatus eq 'N' }">
                       <td>미처리</td>
                       </c:if>
                       <td>${ rpl.usname }</td>
                       <td id="bus_code">${ rpl.bus_code }</td>
                       <td><button class="btn btn-secondary" id="admitReportBtn">승인</button></td> <!-- db 상태 y -->
                       <td><button class="btn btn-success" id="rejectReport">반려</button></td> <!-- db 상태 r -->
                   </tr>
                  </c:forEach>   
                </tbody>
              </table>
              
              
             <script>
             $("#admitReportBtn").click(function(){

	         		var report_no = $("#report_no").text();
	         		var bus_code = $("#bus_code").text();
	         		
	         		location.href="${contextPath}/admin/admitReport?report_no=" + report_no + "&bus_code=" + bus_code;
             });
         	</script>
         	
         	<script>
         	 $("#rejectReport").click(function(){

	         		var report_no = $("#report_no").text();
	         		var bus_code = $("#bus_code").text();
	         		
	         		location.href="${contextPath}/admin/rejectReport?report_no=" + report_no + "&bus_code=" + bus_code;
         	 });
         	</script>
                 

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
	                  <c:url var="before" value="/admin/qna">
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
	                     <c:url var="pagination" value="/admin/qna">
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
	                  <c:url var="after" value="/admin/qna">
	                     <c:param name="page" value="${ pi.currentPage + 1 }" />
	                  </c:url>
	                  <a href="${ after }">[다음]</a>
	               </c:if>
	              </ul>
                </nav>
            </div>

             <br> <br>

               <div class="find_report">
                <h3>신고<span style="color: seagreen;"> 내역조회 </span>하기</h3>
                <br>
                
                <div class="search_report_div">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>-------</option>
                        <option value="report_no" <c:if test="${ param.searchCondition == 'report_no' }">selected</c:if>>신고 번호</option>
	                    <option value="rep_res" <c:if test="${ param.searchCondition == 'rep_res' }">selected</c:if>>신고 사유</option>
	                    <option value="rep_cont" <c:if test="${ param.searchCondition == 'rep_cont' }">selected</c:if>>신고 내용</option> <!-- like 조회 -->
	                    <option value="rdate" <c:if test="${ param.searchCondition == 'rdate' }">selected</c:if>>신고 날짜</option>
	                    <option value="rexdate" <c:if test="${ param.searchCondition == 'rexdate' }">selected</c:if>>신고 만기 날짜</option>
	                    <option value="usno" <c:if test="${ param.searchCondition == 'usno' }">selected</c:if>>회원 번호</option> <!-- 회원 이름으로 바꾸기 -->
	                    <option value="bus_code" <c:if test="${ param.searchCondition == 'bus_code' }">selected</c:if>>사업장 코드</option>
	                    <option value="r_count" <c:if test="${ param.searchCondition == 'r_count' }">selected</c:if>>신고 누적 횟수</option>
	                    <option value="rstatus" <c:if test="${ param.searchCondition == 'rstatus' }">selected</c:if>>처리 상태(승인)</option>
	                    <option value="rstatus" <c:if test="${ param.searchCondition == 'rstatus' }">selected</c:if>>처리 상태(반려)</option>
                    </select>
                    <input type="text" id="searchValue" class="form-control">
                    <button class="btn btn-secondary" onclick="searchReport();">검색하기</button>
                </div>
                
                <br>

                <table class="table table-borderless" id="resultSearchReportTable">
                    <thead>
                        <tr>
                            <th>신고 번호</th>
                            <th></th>
                            <th>신고 사유</th>
                            <th>신고 내용</th>
                            <th>신고 날짜</th>
                            <th>신고 만기 날짜</th>
                            <th>회원 이름</th>
                            <th>사업장 코드</th>
                            <th>신고 누적 횟수</th>
                            <th>처리 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="srl" items="${ searchReportList }">
                        	<tr>
			                     <th>${ srl.report_no }</th>
			                     <td>${ srl.rep_res }</td>
			                     <td>${ srl.rep_cont }</td>           
			                     <td><fmt:formatDate value='${ srl.rdate }' type='both' pattern='yyyy-MM-dd' /></td>
			                     <td><fmt:formatDate value='${ srl.rexdate }' type='both' pattern='yyyy-MM-dd' /></td>
			                     <td>${ srl.usname }</td>
			                     <td>${ srl.bus_code }</td>
			                     <td>${ srl.r_count }</td>
			                     <td>${ srl.rstatus }</td>
			                     <td>${ srl.usstatus }</td> <!-- 반려 or 승인 -->
			                 </tr>
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