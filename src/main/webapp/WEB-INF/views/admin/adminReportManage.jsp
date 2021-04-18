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
                        <th>신고자</th>
                        <th>신고 내용</th>
                        <th>첨부 파일</th>
                        <th>사업장 코드</th>
                        <th>신고 날짜</th>
                        <th>승인</th>
                        <th>반려</th>
                    </tr>
                </thead>
                
                <tbody>        
                <c:forEach var="rpl" items="${ reportList }" varStatus="status"> 
                   <tr>
                       <th id="report_no">${ rpl.report_no }</th>
                       <td>${ rpl.usname }</td>
                       <td><b>${ rpl.rep_cont }</b></td>                       
                       <td>
                       <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal${ status.count }">
			  				보기
					   </button>
                       </td>
                       <td id="bus_code">${ rpl.bus_code }</td>
                       <td><fmt:formatDate value='${ rpl.rdate }' type='both' pattern='yyyy-MM-dd' /></td>
                       <td><button class="btn btn-secondary" id="admitReportBtn">승인</button></td> <!-- db 상태 y -->
                       <td><button class="btn btn-success" id="rejectReport">반려</button></td> <!-- db 상태 r -->
                   </tr>
                   
                   <!-- 모달 -->
                   <div class="modal fade" id="exampleModal${ status.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">신고 파일 첨부내역</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
		                   <div>
		                   		<form>
								  <div class="mb-3">
								    <label for="report_num" class="form-label">신고 번호</label>
								    <input type="text" class="form-control" id="report_num" aria-describedby="emailHelp" value="${ status.current.report_no }" readonly>
								  </div>
								  <div class="mb-3">
								    <label for="report_user" class="form-label">신고자</label>
								    <input type="text" class="form-control" id="report_user" value="${ status.current.usname }" readonly>
								  </div>
								  <div class="mb-3">
								    <label for="report_content" class="form-label">신고 내용</label>
								    <textarea class="form-control" id="report_content" style="height: 100px; resize: none;" readonly>${ status.current.rep_cont }</textarea>
								  </div>
								  <div class="mb-3">
								    <label for="report_bus_code" class="form-label">사업장 코드</label>
								    <input type="text" class="form-control" id="report_bus_code" value="${ status.current.bus_code }" readonly>
								  </div>
								  <div class="mb-3">
								    <label for="report_date" class="form-label">신고 날짜</label>
								    <input type="text" class="form-control" id="report_date" value="<fmt:formatDate value='${ status.current.rdate }' type='both' pattern='yyyy-MM-dd' />" readonly>
								  </div>
								  <div class="mb-3">
								    <label for="report_atta" class="form-label">첨부파일</label> <br>
								    <div class="row row-cols-1 row-cols-md-2">
									  <div class="col">
									    <div class="card" style="width: 470px;">
									      <img src="${ contextPath }/resources/busUploadFiles/${ status.current.r_img_cname }" class="card-img-top" alt="...">
									    </div>
									  </div> 
									</div>
								  </div>
								</form>
		                   </div>
					      	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
					
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
	                  <li class="page-item disabled">
                          <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          </a>
                      </li>
	               </c:if>
	               <c:if test="${ pi.currentPage > 1 }">
	                  <c:url var="before" value="/admin/report">
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
	                     <c:url var="pagination" value="/admin/report">
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
	                  <c:url var="after" value="/admin/report">
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

             <br> <br>

               <div class="find_report">
                <h3>신고<span style="color: seagreen;"> 내역조회 </span>하기</h3>
                <br>
                
               <form id="search_report_form"> 
	                <div class="search_report_div">
	                    <select id="searchCondition" name="searchCondition" class="form-select" aria-label="Default select example">
	                        <option selected>-------</option>
	                        <option value="report_no" <c:if test="${ param.searchCondition == 'report_no' }">selected</c:if>>신고 번호</option>
		                    <option value="rep_cont" <c:if test="${ param.searchCondition == 'rep_cont' }">selected</c:if>>신고 내용</option>
		                    <option value="rdate" <c:if test="${ param.searchCondition == 'rdate' }">selected</c:if>>신고 날짜</option>
		                    <option value="rexdate" <c:if test="${ param.searchCondition == 'rexdate' }">selected</c:if>>신고 만기 날짜</option>
		                    <option value="usno" <c:if test="${ param.searchCondition == 'usno' }">selected</c:if>>회원 번호</option>
		                    <option value="usname" <c:if test="${ param.searchCondition == 'usname' }">selected</c:if>>회원 이름</option>
		                    <option value="bus_code" <c:if test="${ param.searchCondition == 'bus_code' }">selected</c:if>>사업장 코드</option>
		                    <option value="r_count" <c:if test="${ param.searchCondition == 'r_count' }">selected</c:if>>신고 누적 횟수</option>
		                    <option value="rstatus" <c:if test="${ param.searchCondition == 'rstatus' }">selected</c:if>>처리 상태(승인)</option>
		                    <option value="rstatus" <c:if test="${ param.searchCondition == 'rstatus' }">selected</c:if>>처리 상태(반려)</option>
	                    </select>
	                   <input type="text" name="searchValue" id="searchValue" value="${ param.searchValue }" class="form-control">
		               <button class="btn btn-secondary" type="button">검색하기</button>
	                </div>
                </form>
                
                <br>

                <table class="table table-borderless" id="resultSearchReportTable">
                    <thead>
                        <tr>
                            <th>신고 번호</th>
                            <th>신고 내용</th>
                            <th>신고 날짜</th>
                            <th>신고 만기 날짜</th>
                            <th>회원 번호</th>
                            <th>회원 이름</th>
                            <th>사업장 코드</th>
                            <th>신고 누적 횟수</th>
                            <th>처리 상태</th>
                            <th>첨부 파일</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
               </div>
               <br><hr>
               <button type='button' class='btn btn-secondary' data-bs-toggle='modal' data-bs-target='#searchModal' style="display:none;">보기</button>
            	   <!-- 모달 -->
	         <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">신고 파일 첨부내역</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
	                  <div>
	                  	<form>
						  <div class="mb-3">
						    <label for="report_num" class="form-label">신고 번호</label>
						    <input type="text" class="form-control" id="report_num" aria-describedby="emailHelp" readonly>
						  </div>
						  <div class="mb-3">
						    <label for="report_user" class="form-label">피신고자</label>
						    <input type="text" class="form-control" id="report_user" readonly>
						  </div>
						  <div class="mb-3">
						    <label for="report_content" class="form-label">신고 내용</label>
						    <textarea class="form-control" id="report_content" style="height: 100px; resize: none;" readonly></textarea>
						  </div>
						  <div class="mb-3">
						    <label for="report_bus_code" class="form-label">사업장 코드</label>
						    <input type="text" class="form-control" id="report_bus_code" readonly>
						  </div>
						  <div class="mb-3">
						    <label for="report_date" class="form-label">신고 날짜</label>
						    <input type="text" class="form-control" id="report_date" value="<fmt:formatDate value='${ data[i].rtodate }' type='both' pattern='yyyy-MM-dd' />" readonly>
						  </div>
						  <div class="mb-3">
						    <label for="report_atta" class="form-label">첨부파일</label> <br>
						    <div class="row row-cols-1 row-cols-md-2">
							  <div class="col">
							    <div class="card" style="width: 470px;">
							      <img src="${ contextPath }/resources/busUploadFiles/${ data[i].r_img_cname }" class="card-img-top" alt="...">
							    </div>
							  </div> 
							</div>
						  </div>
						</form>
	                  </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
            	
            
	
              <script>
              
				$(function() {
					$("#search_report_form button[type=button]").on("click", function() {
		         		
		         		var search = {};
		         		search.searchCondition =  $("#searchCondition").val();
		         		search.searchValue =  $("#searchValue").val();
		         		
						$.ajax({
							url : "${contextPath}/admin/searchReport",
							data : JSON.stringify(search),
							type : "post", 
							contentType : "application/json; charset=utf-8",
							dataType : "json",
							success : function(data) {
								console.log(data);
								
								tableBody = $("#resultSearchReportTable tbody");
								tableBody.html("");
								
								for (var i in data) {
									var tr = $("<tr>");
									
									var report_no = $("<th id='ajaxReportno'>").text(data[i].report_no);
									var rep_cont = $("<td id='ajaxReportcont'>").text(data[i].rep_cont);
									//var rdate = $("<td>").text(data[i].rdate);
									var rtodate = $("<td id='ajaxReportrtodate'>").text(data[i].rtodate);
									//var rexdate = $("<td>").text(data[i].rexdate);
									var retodate = $("<td id='ajaxReportretodate'>").text(data[i].retodate);
									var usno = $("<td id='ajaxReportusno'>").text(data[i].usno);
									var usname = $("<td id='ajaxReportusname'>").text(data[i].usname);
									var bus_code = $("<td id='ajaxReportbus_code'>").text(data[i].bus_code);
									var r_count = $("<td id='ajaxReportr_count'>").text(data[i].r_count);
									var rstatus = $("<td id='ajaxReportrstatus'>").text(data[i].rstatus);
									var showAtta = $("<td> <button type='button' class='btn btn-secondary' onclick='test(this);'>보기</button>");
	
									tr.append(report_no, rep_cont, rtodate, retodate, usno, usname, bus_code, r_count, rstatus, showAtta);
									tableBody.append(tr);
									
									
								}

							},
							error : function(e) {
								alert("error code : " + e.status + "\n"
										+ "message : " + e.responseText);
							}
						});
					});
				});
				
				function test(data){
					var $data1 = $(data);
					console.log($data1);
					
					 $(document).ready(function() {
				            $('#searchModal').modal("show");
				        });
					 
					var report_no = $("#ajaxReportno").text(data);
					var rep_cont = $("#ajaxReportcont").text();
					var rtodate = $("#ajaxReportrtodate").text();
					var retodate = $("#ajaxReportretodate").text();
					var usno = $("#ajaxReportusno").text();
					var usname = $("#ajaxReportusname").text();
					var bus_code = $("#ajaxReportbus_code").text();
					var r_count = $("#ajaxReportr_count").text();
					var rstatus = $("#ajaxReportrstatus").text();
						
					 
					$("#report_num").val(report_no);
		            $("#report_content").text(rep_cont);
		            $("#report_date").val(rtodate);
		            $("#report_bus_code").val(bus_code);
		            $("#report_user").val(usname);
		            $("#report_atta").val(report_atta);

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