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
                        <th>포인트</th> <!-- income 테이블 조인 -->
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
		                       <c:choose>
				                  <c:when test="${ empty bal.amount }">
	                            	<td><font color="red">0</font></td>
	                              </c:when>
	                              <c:otherwise>
	                              	<td><font color="blue">${ bal.amount }</font></td>
	                              </c:otherwise>
	                            </c:choose>
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
			                            <option value="포인트 미충전">포인트 미충전</option>
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
							     	No : ${ status.current.alno } <br>
							     	신청자 : ${ status.current.usname } <br>
							     	카테고리 : ${ status.current.bus_category } <br>
							     	기업 소개 : ${ status.current.alintro } <br>
							     	사업장 코드 : ${ status.current.bus_code } <br>
							     	신청 날짜 : <fmt:formatDate value='${ status.current.alsubdate }' type='both' pattern='yyyy-MM-dd' /> <br>
							     	첨부파일 : <img src="${ contextPath }/resources/busUploadFiles/alliance/${ status.current.aimgcname }"> <br>
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

	         		var al_no = $("#al_no").text();
	         		var bus_code = $("#bus_code").text();
	         		
	         		alert(al_no);
	         		alert(bus_code);
	         		
	         		location.href="${contextPath}/admin/admitBannerAd?al_no=" + al_no + "&bus_code=" + bus_code;
             });
         	</script>
         	
         	<script>
         	 $("#rejectBannerAdBtn").click(function(){

	         		var al_no = $("#al_no").text();
	         		var bus_code = $("#bus_code").text();
	         		var amassage = $("#amassage").val();
	         		
	         		alert(al_no);
	         		alert(bus_code);
	         		alert(amassage);
	         		
	         		location.href="${contextPath}/admin/rejectBannerAd?al_no=" + al_no + "&bus_code=" + "&amassage=" + amassage;
         	 });
         	</script>

             <br><hr>

              <!-- 페이지네이션 -->
              <div class="row-page">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </ul>
                </nav>
            </div>

            <br>

             <!--배너 승인 및 광고 진행 내역 -->
             <h3>배너 <span style="color: red;">승인 & 광고 진행</span> 내역</h3>
             <br>
             <table class="table table-borderless">
                 <thead>
                     <tr>
                        <th>No</th>
                        <th>신청자</th>
                        <th>카테고리</th>
                        <th>포인트</th>
                        <th>신청폼</th>
                        <th>신청날짜</th>
                        <th>잔여 포인트</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                     <!--반복문 -->
                   <tr>
                    <th>1</th>
                    <td>김춘추</td>
                    <td>숙박</td>
                    <td>500000</td>
                    <td><a class="btn btn-info">신청폼</a></td>
                    <td>2021-03-17</td>
                    <td style="color: blue;">399000</td>
                   </tr>
                   <tr>
                    <th>2</th>
                    <td>강제주</td>
                    <td>렌트카</td>
                    <td>1000000</td>
                    <td><a class="btn btn-info">신청폼</a></td>
                    <td>2021-03-17</td>
                    <td style="color: blue;">787900</td>
                   </tr>
                 </tbody>
               </table>

              <br><hr>

                <!-- 페이지네이션 -->
                <div class="row-page">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </ul>
                </nav>
              </div>

               <div class="find_banner_ad">
                <h3>배너 광고<span style="color: seagreen;"> 내역조회</span></h3>
                <br>
                
                <div class="search_banner_ad_div">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>-------</option>
                        <option value="1" name="no">번호</option>
                        <option value="2" name="name">신청자</option>
                        <option value="3" name="category">카테고리</option>
                        <option value="4" name="point">포인트</option>
                        <option value="5" name="date" >신청날짜</option>
                        <option value="6" name="reseon">반려사유</option>
                    </select>
                    <input type="text" id="searchValue" class="form-control">
                    <button class="btn btn-secondary" onclick="searchBannerAd();">검색하기</button>
                </div>
                
                <br>

                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>신청자</th>
                            <th>카테고리</th>
                            <th>포인트</th>
                            <th>신청폼</th>
                            <th>신청날짜</th>
                            <th>반려사유</th>
                            <th>처리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td>김춘추</td>
                            <td>숙박</td>
                            <td>0</td>
                            <td><a class="btn btn-info">신청폼</a></td>
                            <td>2021-03-17</td>
                            <th style="color: crimson;">포인트 미충전</th>
                            <td>반려</td>
                          </tr>
                    </tbody>
                  </table>
               </div>

               <br> <hr>

                <!-- 페이지네이션 -->
                <div class="row-page">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </ul>
                </nav>
              </div>

               <br><br><br><br><br><br><br><br><br><br><br><br>
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