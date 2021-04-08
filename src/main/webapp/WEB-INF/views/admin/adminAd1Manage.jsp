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
	<link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminAd1Manage.css" type="text/css">
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
            <!--배너 신규 내역 -->
            <h3>배너 <span style="color: red;">신규</span>  내역</h3>
            <br>
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>신청자</th>
                        <th>카테고리</th>
                        <th>사업장코드</th>
                        <th>포인트</th> <!-- point 테이블 조인 -->
                        <th>신청폼</th>
                        <th>신청날짜</th>
                        <th>승인</th>
                        <th>반려</th>
                    </tr>
                </thead>
                <tbody>
       
                	<c:forEach var="bal" items="${ bannerAdList }" varStatus="status">
		                   <tr>
		                       <th id="al_no">${ bal.alno }</th>
		                       <th>${ bal.usname }</th>
		                       <c:choose>
				                  <c:when test="${ bal.bus_category eq 'R' }">
	                            	<td>음식점</td>
	                              </c:when>
	                              <c:when test="${ bal.bus_category eq 'H' }">
	                            	<td>숙박</td>
	                              </c:when>
	                              <c:when test="${ bal.bus_category eq 'T' }">
	                            	<td>관광지</td>
	                              </c:when>
	                              <c:otherwise>
	                              	<td>렌트</td>
	                              </c:otherwise>
	                            </c:choose>
		                       <td id="bus_code">${ bal.bus_code }</td>
		                       <td>${ bal.pbalance }</td>
		                	   <td>
		                       <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal${ status.count }">
					  				보기
							   </button>
		                       </td>
		                       <td><fmt:formatDate value='${ bal.alsubdate }' type='both' pattern='yyyy-MM-dd' /></td>
                    		   <td><button type="submit" class="btn btn-secondary" id="admitBannerAdBtn">승인</button></td>
		                	   <td>
			                    <div class="banner_ad_reject_choose">
			                        <select class="form-select" aria-label="Default select example" name="amassage" id="amassage">
			                            <option selected>--- 반려사유 ---</option>
			                            <option value="이미지 불일치">이미지 불일치</option>
			                            <option value="포인트 미충전">포인트 부족</option>
			                        </select>
			                        <button type="submit" class="btn btn-success" id="rejectBannerAdBtn">반려</button> 
			                    </div>
                    		   </td>
		                   </tr>
		                   
		                   <!-- 모달 -->
		                   <div class="modal fade" id="exampleModal${ status.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">제출 첨부내역</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      	
									  <div class="row">
					                    <div class="col">
					                         <img src="${ contextPath }/resources/images/image_admin/logo_g.png" class="card-img-top" alt="...">
					                    </div>
					                    <div class="col">
					                        <h3 id="page_title">삼다도</h3>
					                    </div>
					                  </div>
					                  
					                  <div>
					                  	No : ${ status.current.alno } <br>
								     	신청자 : ${ status.current.usname } <br>
								     	카테고리 : ${ status.current.bus_category } <br>
								     	기업 소개 : ${ status.current.alintro } <br>
								     	사업장 코드 : ${ status.current.bus_code } <br>
								     	신청 날짜 : <fmt:formatDate value='${ status.current.alsubdate }' type='both' pattern='yyyy-MM-dd' /> <br>
								     	첨부파일 : <img src="${ contextPath }/resources/busUploadFiles/alliance/${ status.current.aimgcname }"> <br>
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
             $("#admitBannerAdBtn").click(function(){

	         		var alno = $("#al_no").text();
	         		var bus_code = $("#bus_code").text();
	         
	         		
	         		location.href="${contextPath}/admin/admitBannerAd?alno=" + alno + "&bus_code=" + bus_code;
             });
         	</script>
         	
         	<script>
         	 $("#rejectBannerAdBtn").click(function(){

	         		var alno = $("#al_no").text();
	         		var bus_code = $("#bus_code").text();
	         		var amassage = $("#amassage").val();
	         		
	         		location.href="${contextPath}/admin/rejectBannerAd?alno=" + alno + "&bus_code=" + bus_code + "&amassage=" + amassage;
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
	                  <c:url var="before" value="/admin/advertise1">
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
	                     <c:url var="pagination" value="/admin/advertise1">
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
	                  <c:url var="after" value="/admin/advertise1">
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

             <!--배너 승인 및 광고 진행 내역 -->
             <h3>배너 <span style="color: red;">승인 & 광고 진행</span> 내역</h3>
             <br>
             <table class="table table-borderless">
                 <thead>
                     <tr>
                        <th>No</th>
                        <th>신청자</th>
                        <th>카테고리</th>
                        <th>사업장코드</th>
                        <th>포인트</th> <!-- point 테이블 조인 -->
                        <th>신청폼</th>
                        <th>신청날짜</th>
                     </tr>
                 </thead>
                 <tbody>
                 
                 	<c:forEach var="abal" items="${ admitbannerAdList }" varStatus="Astatus">
		                   <tr>
		                       <th>${ abal.alno }</th>
		                       <th>${ abal.usname }</th>
		                       <c:choose>
				                  <c:when test="${ abal.bus_category eq 'R' }">
	                            	<td>음식점</td>
	                              </c:when>
	                              <c:when test="${ abal.bus_category eq 'H' }">
	                            	<td>숙박</td>
	                              </c:when>
	                              <c:when test="${ abal.bus_category eq 'T' }">
	                            	<td>관광지</td>
	                              </c:when>
	                              <c:otherwise>
	                              	<td>렌트</td>
	                              </c:otherwise>
	                            </c:choose>
		                       <td>${ abal.bus_code }</td>
		                       <td>${ abal.pbalance }</td>
		                	   <td>
		                       <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#abalexampleModal${ Astatus.count }">
					  				보기
							   </button>
		                       </td>
		                       <td><fmt:formatDate value='${ abal.alsubdate }' type='both' pattern='yyyy-MM-dd' /></td>
		                   </tr>
		                   
		                   <!-- 모달 -->
		                   <div class="modal fade" id="abalexampleModal${ Astatus.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">제출 첨부내역</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							     	No : ${ Astatus.current.alno } <br>
							     	신청자 : ${ Astatus.current.usname } <br>
							     	기업 소개 : ${ Astatus.current.alintro } <br>
							     	사업장 코드 : ${ Astatus.current.bus_code } <br>
							     	신청 날짜 : <fmt:formatDate value='${ Astatus.current.alsubdate }' type='both' pattern='yyyy-MM-dd' /> <br>
							     	첨부파일 : <img src="${ contextPath }/resources/busUploadFiles/alliance/${ Astatus.current.aimgcname }"> <br>
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

              <br><hr>

              <!-- 페이지네이션 추가 -->

              <br><br>
              
                <div class="find_banner">
                <h3>배너<span style="color: seagreen;"> 내역조회 </span>하기</h3>
                <br>
 
				<form id="search_bannerAd_form">
					<div class="search_bannerAd_div">
		               <select id="searchCondition" name="searchCondition" class="form-select" aria-label="Default select example">
		                   <option>--------</option>
		                   <option value="alno" <c:if test="${ param.searchCondition == 'alno' }">selected</c:if>>No</option>
		                   <option value="usname" <c:if test="${ param.searchCondition == 'usname' }">selected</c:if>>신청자 회원명</option>
		                   <option value="bus_category" <c:if test="${ param.searchCondition == 'bus_category' }">selected</c:if>>카테고리</option> 
		                   <option value="bus_code" <c:if test="${ param.searchCondition == 'bus_code' }">selected</c:if>>사업장 코드</option> 
		                   <option value="pbalance" <c:if test="${ param.searchCondition == 'pbalance' }">selected</c:if>>포인트</option>
		                   <option value="alsubdate" <c:if test="${ param.searchCondition == 'alsubdate' }">selected</c:if>>신청날짜</option>
		                   <option value="alstatus" <c:if test="${ param.searchCondition == 'alstatus' }">selected</c:if>>처리 상태</option>
		                   
		               </select>
		               <input type="text" name="searchValue" id="searchValue" value="${ param.searchValue }" class="form-control">
		               <button class="btn btn-secondary" type="button">검색하기</button>
					</div>
				</form>
            
                <br>

                <table class="table table-borderless" id="resultSearchbannerAdTable">
                    <thead>
                        <tr>
                            <th>No</th>
	                        <th>신청자</th>
	                        <th>카테고리</th>
	                        <th>사업장코드</th>
	                        <th>포인트</th> 
	                        <th>신청날짜</th>
	                        <th>처리 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	
                    </tbody>
                  </table>
               </div>
               
               <script>
					$(function() {
						$("#search_bannerAd_form button[type=button]").on("click", function() {
			         		
			         		var search = {};
			         		search.searchCondition =  $("#searchCondition").val();
			         		search.searchValue =  $("#searchValue").val();

							$.ajax({
								url : "${contextPath}/admin/searchbannerAd",
								data : JSON.stringify(search),
								type : "post", 
								contentType : "application/json; charset=utf-8",
								dataType : "json",
								success : function(data) {

									tableBody = $("#resultSearchbannerAdTable tbody");
									tableBody.html("");
									
									for (var i in data) {
										var tr = $("<tr>");
										
										var alno = $("<th>").text(data[i].alno);
										var usname = $("<td>").text(data[i].usname);
										var bus_category = $("<td>").text(data[i].bus_category);
										var bus_code = $("<td>").text(data[i].bus_code);
										var pbalance = $("<td>").text(data[i].pbalance);
										var alsubdate = $("<td>").text(data[i].alsubdate);
										var alstatus = $("<td>").text(data[i].alstatus);
										
										tr.append(alno, usname, bus_category, bus_code, pbalance, alsubdate, alstatus); // 테이블 행에 추가
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