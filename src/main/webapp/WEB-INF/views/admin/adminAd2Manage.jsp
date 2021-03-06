<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminAd2Manage.css" type="text/css">
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
            <!--신규 프리미엄 내역 -->
            <h3><span style="color: red;">프리미엄 진행</span>  내역</h3>
            <br>
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>회원번호</th>
                        <th>회원명</th>
                        <th>사업장 코드</th>
                        <th>카테고리</th>
                        <th>신청날짜</th>
                        <th>만기날짜</th>
                        <th>상세보기</th>
                    </tr>
                </thead>
                <tbody>
	                <c:forEach var="apane" items="${ adminPremiumAdnotEnd }">
	                   <tr>
	                       <th>${ apane.payno }</th>
	                       <td>${ apane.usno }</td>
	                       <td>${ apane.usname }</td>
	                       <td id="bus_code">${ apane.bus_code }</td>
	                       <c:choose>
			                  <c:when test="${ apane.bus_category eq 'R' }">
                            	<td>음식점</td>
                              </c:when>
                              <c:when test="${ apane.bus_category eq 'H' }">
                            	<td>숙박</td>
                              </c:when>
                              <c:when test="${ apane.bus_category eq 'T' }">
                            	<td>관광지</td>
                              </c:when>
                              <c:otherwise>
                              	<td>렌트</td>
                              </c:otherwise>
	                       </c:choose>
	                       <td>${ apane.pdate }</td>
	                       <td>${ apane.exdate }</td>
	                       <td><a class="btn btn-info" id="goDetailPre2Btn" onclick='goToPre2Detail("${ apane.bus_code }")'>보러가기</a></td>
	                   </tr>
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
	                  <li class="page-item disabled">
                          <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          </a>
                      </li>
	               </c:if>
	               <c:if test="${ pi.currentPage > 1 }">
	                  <c:url var="before" value="/admin/advertise2">
	                     <c:param name="page" value="${ pi.currentPage - 1 }"/>
	                  </c:url>
	                  <li class="page-item">
                          <a class="page-link" href="${ before }" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          </a>
                      </li>
	               </c:if>
	               
	               <!-- 페이지 숫자 -->
	               <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	          	      
	                  <c:if test="${ p eq pi.currentPage }">
	                     <li class="page-item active"><a class="page-link" href="#">${ p }</a></li>
	                  </c:if>
	                  <c:if test="${ p ne pi.currentPage }">
	                     <c:url var="pagination" value="/admin/advertise2">
	                        <c:param name="page" value="${ p }"/>
	                     </c:url>
	                     <li class="page-item"><a class="page-link" href="${ pagination }">${ p }</a></li>
	                  </c:if>
	                  
	               </c:forEach>
	               
	               <!-- [다음] -->
	               <c:if test="${ pi.currentPage >= pi.maxPage }">
	                  <li class="page-item disabled">
                          <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&raquo;</span>
                          </a>
                      </li>
	               </c:if>
	               <c:if test="${ pi.currentPage < pi.maxPage }">
	                  <c:url var="after" value="/admin/advertise2">
	                     <c:param name="page" value="${ pi.currentPage + 1 }" />
	                  </c:url>
	                  <li class="page-item">
                          <a class="page-link" href="${ after }" aria-label="Previous">
                          <span aria-hidden="true">&raquo;</span>
                          </a>
                      </li>
	               </c:if>
	              </ul>
                </nav>
            </div>

			<br><br>

               <div class="find_preAd">
                <h3>프리미엄<span style="color: red;"> 내역조회</span> 하기</h3>
                <br>
                
                <form id="search_preAd_form">
	                <div class="search_preAd_div">
	                    <select id="searchCondition" name="searchCondition" class="form-select" aria-label="Default select example">
	                        <option selected>-------</option>
	                        <option value="payno" <c:if test="${ param.searchCondition == 'payno' }">selected</c:if>>No</option>
		                    <option value="usno" <c:if test="${ param.searchCondition == 'usno' }">selected</c:if>>회원 번호</option>
		                    <option value="usname" <c:if test="${ param.searchCondition == 'usname' }">selected</c:if>>회원명</option> 
		                    <option value="bus_code" <c:if test="${ param.searchCondition == 'bus_code' }">selected</c:if>>사업장 코드</option> 
		                    <option value="bus_category" <c:if test="${ param.searchCondition == 'bus_category' }">selected</c:if>>카테고리</option>
		                    <!-- 
		                    <option value="pdate" <c:if test="${ param.searchCondition == 'pdate' }">selected</c:if>>신청날짜</option>
		                    <option value="exdate" <c:if test="${ param.searchCondition == 'exdate' }">selected</c:if>>만기날짜</option>
		                    -->
	                    </select>
	                    <input type="text" name="searchValue" id="searchValue" value="${ param.searchValue }" class="form-control">
		                <button class="btn btn-secondary" type="button">검색하기</button>
	                </div>
                </form>
                
                <br>

                <table class="table table-borderless" id="resultSearchpreAdTable">
                    <thead>
                        <tr>
                            <th>No</th>
	                        <th>회원번호</th>
	                        <th>회원명</th>
	                        <th>사업장 코드</th>
	                        <th>카테고리</th>
	                        <th>신청날짜</th>
	                        <th>만기날짜</th>
	                        <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                  </table>
               </div>

               <br><hr>

               <script>
					$(function() {
						$("#search_preAd_form button[type=button]").on("click", function() {
			         		
			         		var search = {};
			         		search.searchCondition =  $("#searchCondition").val();
			         		search.searchValue =  $("#searchValue").val();

							$.ajax({
								url : "${contextPath}/admin/searchpreAd",
								data : JSON.stringify(search),
								type : "post", 
								contentType : "application/json; charset=utf-8",
								dataType : "json",
								success : function(data) {

									tableBody = $("#resultSearchpreAdTable tbody");
									tableBody.html("");
									
									for (var i in data) {
										var tr = $("<tr>");
										
										var payno = $("<th>").text(data[i].payno);
										var usno = $("<td>").text(data[i].usno);
										var usname = $("<td>").text(data[i].usname);
										var bus_code = $("<td>").text(data[i].bus_code);
										var bus_category = $("<td>").text(data[i].bus_category);
										//var pdate = $("<td>").text(data[i].pdate);
										var ptodate = $("<td>").text(data[i].ptodate);
										//var exdate = $("<td>").text(data[i].exdate);
										var pextodate = $("<td>").text(data[i].pextodate);
										var goDetail = $("<td> <a class='btn btn-info' onclick='goToPre2Detail(" + data[i].bus_code + ")'>보러가기</a>");
										
										tr.append(payno, usno, usname, bus_code, bus_category, ptodate, pextodate, goDetail); // 테이블 행에 추가
										tableBody.append(tr); // 테이블에 추가
									}
									
									
								},
								error : function(e) {
									alert("일치하는 회원이 없습니다.");
								}
							});
						});
					});
					
	
					function goToPre2Detail(bus_code) {
						location.href='${ contextPath }/business/adminToDetail?bus_code=' + bus_code;
					}
				</script>
				
				
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