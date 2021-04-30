<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- fmt 라이브러리 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
  <head>
      <link rel="icon" type="image/png" sizes="16x16" href="${contextPath }/resources/images/image_main/logo_g.png">
  
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
                        <th>포인트</th>
                    </tr>
                </thead>
                <tbody>
        		 <c:forEach var="aul" items="${ allUserList }" varStatus="status">
        		  <c:if test="${ aul.uspart ne '관리자' }">
	                 <tr>
	                     <th>${ aul.usno }</th>
	                     <td>${ aul.usname }</td>
	                     <td>${ aul.usid }</td>           
	                     <td><fmt:formatDate value='${ aul.usbirth }' type='both' pattern='yyyy-MM-dd' /></td>
	                     <td>${ aul.usemail }</td>
	                     <td>
	                     <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal${ status.count }">
			  				${ aul.usphone }
					    </button>			
	                     </td>
	                     <td>${ aul.uspart }</td>
	                     <td>${ aul.busno }</td>
	                     <td>${ aul.usstatus }</td>
	                     <td>${ aul.pbalance }</td>
	                 </tr>
	                 
	               <!-- 모달 -->
                   <div class="modal fade" id="exampleModal${ status.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">SMS 발송</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
		                   <div>
		                   		<form method="post" name="smsForm" action="${ contextPath }/admin/sendSMS">
			                       <div class="mb-3">
									    <label for="message_content" class="form-label">메세지 내용  <span id="counter">0</span>/45</label>
									    <textarea class="form-control" maxlength="45" style="resize: none;" name="msg" placeholder="최대 45자 이내" id="message_content" aria-describedby="emailHelp">[삼다도]</textarea>
								   </div>
								   <div class="mb-3">
									    <label for="userPhone" class="form-label">발신번호</label>
									    <input type="text" class="form-control" id="userPhone" name="rphone" value="${ status.current.usphone }" aria-describedby="emailHelp" readonly>
								   </div>
			                       <div class="mb-3">
			                       <input type="submit" class="btn btn-secondary" value="전송" style="margin-left: 88%;">
			                            <input type="hidden" name="returnurl" maxlength="64" value="http://localhost:8896/samdado/admin/userList" >
		                              	<input type="hidden" name="action" value="go">
				  						<input type="hidden" name="sphone1" value="010">
								        <input type="hidden" name="sphone2" value="8234">
								        <input type="hidden" name="sphone3" value="2105">
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
	                  <li class="page-item disabled">
                          <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          </a>
                      </li>
	               </c:if>
	               <c:if test="${ pi.currentPage > 1 }">
	                  <c:url var="before" value="/admin/userList">
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
	                     <c:url var="pagination" value="/admin/userList">
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
	                  <c:url var="after" value="/admin/userList">
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
              
           <!-- 검색 추가 -->
           
            <br> <br>
            
           		 <!-- 모달 -->
                   <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">SMS 발송</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
		                   <div>
		                   		<form method="post" name="smsForm" action="${ contextPath }/admin/sendSMS">
			                       <div class="mb-3">
									    <label for="message_content" class="form-label">메세지 내용  <span id="counter">0</span>/45</label>
									    <textarea class="form-control" maxlength="45" style="resize: none;" name="msg" placeholder="최대 45자 이내" id="message_content" aria-describedby="emailHelp">[삼다도]</textarea>
								   </div>
								   <div class="mb-3">
									    <label for="userPhone" class="form-label">발신번호</label>
									    <input type="text" class="form-control" id="SearchuserPhone" name="rphone" aria-describedby="emailHelp" readonly>
								   </div>
			                       <div class="mb-3">
			                       <input type="submit" class="btn btn-secondary" value="전송" style="margin-left: 88%;">
		                              	<input type="hidden" name="action" value="go">
				  						<input type="hidden" name="sphone1" value="010">
								        <input type="hidden" name="sphone2" value="8234">
								        <input type="hidden" name="sphone3" value="2105">
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
            

               <div class="find_user">
                <h3>회원<span style="color: seagreen;"> 조회 </span>하기</h3>
                <br>
                
                <form id="search_user_form">
	                <div class="search_user_div">
	                    <select id="searchCondition" name="searchCondition" class="form-select" aria-label="Default select example">
	                        <option selected>-------</option>
	                        <option value="usno" <c:if test="${ param.searchCondition == 'usno' }">selected</c:if>>회원 번호</option>
		                    <option value="usname" <c:if test="${ param.searchCondition == 'usname' }">selected</c:if>>회원 이름</option>
		                    <option value="usid" <c:if test="${ param.searchCondition == 'usid' }">selected</c:if>>회원 아이디</option> 
		                    <!--  
		                    <option value="usbirth" <c:if test="${ param.searchCondition == 'usbirth' }">selected</c:if>>생년 월일</option>
		                    -->
		                    <option value="usemail" <c:if test="${ param.searchCondition == 'usemail' }">selected</c:if>>이메일</option>
		                    <option value="usphone" <c:if test="${ param.searchCondition == 'usphone' }">selected</c:if>>휴대전화</option>
		                    <option value="uspart" <c:if test="${ param.searchCondition == 'uspart' }">selected</c:if>>회원 구분</option>
		                    <option value="busno" <c:if test="${ param.searchCondition == 'busno' }">selected</c:if>>사업자등록번호</option>
		                    <option value="usstatus" <c:if test="${ param.searchCondition == 'usstatus' }">selected</c:if>>회원 상태</option>	                  
	                    </select>
	                    <input type="text" name="searchValue" id="searchValue" value="${ param.searchValue }" class="form-control">
		                <button class="btn btn-secondary" type="button">검색하기</button>
	                </div>
                </form>
                
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
                            <th>포인트</th>
                        </tr>
                    </thead>
                    <tbody>
                        
	              </tbody>
                  </table>
               </div>
               
               <script>
					$(function() {
						$("#search_user_form button[type=button]").on("click", function() {
			         		
			         		var search = {};
			         		search.searchCondition =  $("#searchCondition").val();
			         		search.searchValue =  $("#searchValue").val();

							$.ajax({
								url : "${contextPath}/admin/searchUser",
								data : JSON.stringify(search),
								type : "post", 
								contentType : "application/json; charset=utf-8",
								dataType : "json",
								success : function(data) {

									tableBody = $("#resultSearchUserTable tbody");
									tableBody.html("");
									
									for (var i in data) {
										var tr = $("<tr>");
										
										var usno = $("<th>").text(data[i].usno);
										var usname = $("<td>").text(data[i].usname);
										var usid = $("<td>").text(data[i].usid);
										//var usbirth = $("<td>").text(data[i].usbirth);
										var utodate = $("<td>").text(data[i].utodate);
										var usemail = $("<td>").text(data[i].usemail);
										var usphone = $("<td><button type='button' class='btn btn-secondary' onclick='test(this);'>" + data[i].usphone + "</button>");
										var uspart = $("<td>").text(data[i].uspart);
										var busno = $("<td>").text(data[i].busno);
										var usstatus = $("<td>").text(data[i].usstatus);
										var pbalance = $("<td>").text(data[i].pbalance);
										
										tr.append(usno, usname, usid, utodate, usemail, usphone, uspart, busno, usstatus, pbalance); // 테이블 행에 추가
										tableBody.append(tr); // 테이블에 추가
									}
									
									
								},
								error : function(e) {
									alert("정보를 찾을 수 없습니다.");
								}
							});
						});
					});
					
					function test(data){
						
						 $(document).ready(function() {
					            $('#searchModal').modal("show");
					        });
						 
						 //console.log($(data).parent().parent().children('td').eq(4).text());
						 $("#SearchuserPhone").val($(data).parent().parent().children('td').eq(4).text());

					}
					
				</script>
				
				<script>
						$(document).ready(function() {
							//textarea에서 keyup 이벤트 발생했을 경우
							$("#message_content").keyup(function() {
								//textarea의 길이 값 저장
								var inputLength = $(this).val().length;
								//카운터 안에 inputLength가 들어갈 수 있도록 지정
								$("#counter").html(inputLength);

								var remain = 45 - inputLength;

								if (remain > 0) 
									$("#counter").css("color", "black");
								else
									$("#counter").css("color", "red"); // 45자가 되었을 때 빨간색
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