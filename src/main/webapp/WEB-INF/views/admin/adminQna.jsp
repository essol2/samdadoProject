<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/QnA.css" type="text/css">
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
            <!--신규 Q&A 내역 -->
            <h3>신규 <span style="color: red;">Q&A</span>  내역</h3>
            <br>
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>회원명</th>
                        <th scope="row">문의내용</th>
                        <th>답변내용</th>
                        <th>처리</th>
                        <th>문의날짜</th>
                    </tr>
                </thead>
                <tbody>
                 <form action="${ contextPath }/admin/insertReplyQna" method="post">
          		  <c:forEach var="q" items="${ qnaList }">
                   <tr>
                       <th scope="row">${ q.qnano }</th>
                       <td>${ q.usname }</td>
                       <td>${ q.qcont }</td>
                       <input type="hidden" name="qnano" value="${ q.qnano }">
                       <td><input type="text" name="qreply" id="replyValue" class="form-control"></td>
                       <td><button type="submit" class="btn btn-secondary">답변</button></td>
                       <td>${ q.qdate }</td>
                   </tr>
                  </c:forEach>              
				</form>
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
	                  <c:url var="before" value="/admin/qna">
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
	                     <c:url var="pagination" value="/admin/qna">
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
	                  <c:url var="after" value="/admin/qna">
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

               <div class="find_qna">
                <h3>Q&A<span style="color: seagreen;"> 내역조회 </span>하기</h3>
                <br>
 
				<form id="search_qna_form">
					<div class="search_qna_div">
		               <select id="searchCondition" name="searchCondition" class="form-select" aria-label="Default select example">
		                   <option>--------</option>
		                   <option value="qnano" <c:if test="${ param.searchCondition == 'qnano' }">selected</c:if>>Q&A번호</option>
		                   <option value="usname" <c:if test="${ param.searchCondition == 'usname' }">selected</c:if>>회원명</option>
		                   <option value="usno" <c:if test="${ param.searchCondition == 'usno' }">selected</c:if>>회원 번호</option>
		                   <option value="qcont" <c:if test="${ param.searchCondition == 'qcont' }">selected</c:if>>문의내용</option> <!-- like 조회 -->
		                   <option value="qdate" <c:if test="${ param.searchCondition == 'qdoate' }">selected</c:if>>문의날짜</option>
		                   <option value="qreply" <c:if test="${ param.searchCondition == 'qreply' }">selected</c:if>>답변내용</option>
		                   <option value="qstatus" <c:if test="${ param.searchCondition == 'qstatus' }">selected</c:if>>답변 상태(Y/N)</option>
		               </select>
		               <input type="text" name="searchValue" id="searchValue" value="${ param.searchValue }" class="form-control">
		               <button class="btn btn-secondary" type="button">검색하기</button>
					</div>
				</form>
            
                <br>

                <table class="table table-borderless" id="resultSearchQnaTable">
                    <thead>
                        <tr>
                            <th>Q&A번호</th>
                            <th>회원명</th>
                            <th>회원 번호</th>
                            <th scope="row">문의내용</th>
                            <th>문의날짜</th>
                            <th>답변내용</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    </tbody>
                  </table>
               </div>
               
               <script>
					$(function() {
						$("#search_qna_form button[type=button]").on("click", function() {
			         		
			         		var search = {};
			         		search.searchCondition =  $("#searchCondition").val();
			         		search.searchValue =  $("#searchValue").val();

							$.ajax({
								url : "${contextPath}/admin/searchQna",
								data : JSON.stringify(search),
								type : "post", 
								contentType : "application/json; charset=utf-8",
								dataType : "json",
								success : function(data) {

									tableBody = $("#resultSearchQnaTable tbody");
									tableBody.html("");
									
									for (var i in data) {
										var tr = $("<tr>");
										
										var qnano = $("<th>").text(data[i].qnano);
										var usname = $("<td>").text(data[i].usname);
										var usno = $("<td>").text(data[i].usno);
										var qcont = $("<td>").text(data[i].qcont);
										//var qdate = $("<td>").text(data[i].qdate);
										var qtodate = $("<td>").text(data[i].qtodate);
										var qreply = $("<td>").text(data[i].qreply);
										var qstatus = $("<td>").text(data[i].qstatus);
										
										tr.append(qnano, usname, usno, qcont, qtodate, qreply, qstatus); // 테이블 행에 추가
										tableBody.append(tr); // 테이블에 추가
									}
									
									
								},
								error : function(e) {
									alert("error code : " + e.status + "\n"
											+ "message : " + e.responseText);
								}
							});
						});
					});
				</script>

               <br><hr>

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