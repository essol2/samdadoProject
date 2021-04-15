<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.samdado.admin.model.vo.SMS" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminHome.css" type="text/css">

     <!--차트 api cdn-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>

	<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
          
          <div class="col-10" id="B">
            <div class="row"  id="C">
                <div class="col-8" id="E">
                    <div class="container">

                        <!--- 상단 알림바 ------------------------------------------------------------------------------------------------------------------------->
                          <!-- admin-navi-up 인클루드 -->
         				  <jsp:include page="admin-navi-up.jsp"/>
                 		   <br><br>
                           <div class="row" style="padding-top: 4%;">
                           <h1>광고별 매출</h1>
                	       <h6>데일리 배너광고 | 프리미엄 광고 | 커미션 매출 내역이 보여집니다.</h6>
                	       <br><br>
                            <div>
                                <canvas id="myLineChart"></canvas>
                            </div>
                                    	
		                  	<script>
		                  	      var ctx = document.getElementById('myLineChart').getContext('2d');
			                  	  var chart = new Chart(ctx, {
			                  	    // The type of chart we want to create
			                  	    type: 'line',
	
			                  	    // The data for our dataset
			                  	    data: {
			                  	        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			                  	        datasets: [{
			                  	            label: '매출',
			                  	            backgroundColor: 'rgb(255, 99, 132)',
			                  	            borderColor: 'rgb(255, 99, 132)',
			                  	            data: [0, 10, 5, 2, 20, 30, 45]
			                  	        }]
			                  	    },
	
			                  	    // Configuration options go here
			                  	    options: {}
			                  	});
		                  	</script>
                  	
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="col-4" id="F">

                    <!-- SMS -->
                    <div class="row" style="padding-top: 4%; padding-right: 7%;">
                    <h1>SMS</h1>
                	 <h6>삼다도 회원들에게 메세지를 보낼 수 있습니다.</h6>
                	 <br><br>
                        <form method="post" name="smsForm" action="${ contextPath }/admin/sendSMS">
	                        <table class="table table-hover">
	                           <tbody>
		                          <tr>
		                              <td>
		                              	<textarea class="form-control" maxlength="45" name="msg" style="resize: none;" placeholder="보낼 내용을 입력하세요."></textarea>
		                              </td>
		                          </tr>
		                          <tr>
		                          	<td>
		                              	<input class="form-control" type="text" name="rphone" value="" placeholder="받는 번호를 입력하세요.(010-0000-0000)">
		                             </td>
		                          </tr>
	                              <tr>
	                              <td>
		                              	<input type="submit" class="btn btn-secondary" value="전송" style="margin-left: 88%;">
		                              	<input type="hidden" name="action" value="go">
				  						<input type="hidden" name="sphone1" value="010">
								        <input type="hidden" name="sphone2" value="8234">
								        <input type="hidden" name="sphone3" value="2105">
	                              </td>
	                              </tr>
	                          </tbody>
	                      </table>
                       </form>
                  </div>
					<br><br>
                    <!--막대 그래프(총 매출)-->
                     <div class="row" style="padding-top: 4%; padding-right: 7%; padding-bottom: 5%;">
                     <h1>최근 6개월 매출</h1>
                	 <h6>최근 날짜 기준으로 6개월 간의 매출 내역이 보여집니다.</h6>
                	 <br><br>
                        <!--차트 그려지는 영역-->
                        <canvas id="myBarChart" width="400" height="300"></canvas>

                        <!-- 막대그래프 create chart-->
                        <script>
                        
                        function getProfit() {
                        	
                        	var profits = [0, 0, 0, 0, 0, 0];
                        	
                        	$.ajax({
                				url : "${ contextPath }/admin/selectGetProfit",
                				dataType : "json",
                				async: false, // 비동기가 아니도록 처리
                				success : function(data) {
                					//alert(JSON.stringify(data));
                					profits = data;
                				},
                				error : function(e) {
                					alert("code : " + e.status + "\n"
                							+ "message : " + e.responseText);
                				}
                			});
                        	
                			//alert(JSON.stringify(profits));
                        	return profits;
                        }
                        
                        
                        var ctx = document.getElementById('myBarChart').getContext('2d');
                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: ['11월', '12월', '1월', '2월', '3월', '4월'],
                                datasets: [{
                                    label: '최근 6개월간 매출',
                                    data: getProfit(),
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(255, 159, 64, 0.2)'
                                    ],
                                    borderColor: [
                                        'rgba(255, 99, 132, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(75, 192, 192, 1)',
                                        'rgba(153, 102, 255, 1)',
                                        'rgba(255, 159, 64, 1)'
                                    ],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                                }
                            }
                        });
                        </script>
                    </div>
                </div>
            </div>
		<br><br>
            <!--Q&A-->
            <div class="row" id="D">
                <div class="col-5" id="G">
                <h1>Q&A</h1>
                <h6>미답변 Q&A기준으로 최대 10개의 Q&A만 보여집니다.</h6>
                <br>
                    <table class="table table-hover" id="qnaTable" style="table-layout: fixed;">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>작성자</th>
                            <th>내용</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="q" items="${ qnaList }">
	                        <tr onclick='showQnA();' style="cursor: pointer;">
	                            <th>${ q.qnano }</th>
	                            <td>${ q.usname }</td>
	                            <td style="overflow: hidden; white-space : nowrap; text-overflow: ellipsis;">${ q.qcont }</td>
	                        </tr>
                        </c:forEach>                     
                        </tbody>
                    </table>
                </div>
           <br><br>
                <div class="col-7" id="H">
                <h1>신규 사업장</h1>
                <h6>최근 날짜 기준으로 최대 10개의 신규 등록된 사업장만 보여집니다.</h6>
                <br>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">사업장 No</th>
                            <th scope="col">회원명</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">사업장명</th>
                            <th scope="col">사업장주소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="bl" items="${ businessList }">
	                        <tr onclick='showBusiness(${ bl.bus_code });' style="cursor: pointer;">
	                            <th>${ bl.bus_code }</th>
	                            <td>${ bl.usname }</td>
	                            <c:choose>
				                  <c:when test="${ bl.bus_category eq 'R' }">
	                            	<td>음식점</td>
	                              </c:when>
	                              <c:when test="${ bl.bus_category eq 'H' }">
	                            	<td>숙박</td>
	                              </c:when>
	                              <c:when test="${ bl.bus_category eq 'T' }">
	                            	<td>관광지</td>
	                              </c:when>
	                              <c:otherwise>
	                              	<td>렌트</td>
	                              </c:otherwise>
	                            </c:choose>
	                            <td>${ bl.bus_name }</td>
	                            <td>${ bl.bus_address }</td>
	                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
          </div>
        </div>
    </div>
    
    <script>
		function showQnA() {
			location.href='${ contextPath }/admin/qna';
		}
		
		function showBusiness(bus_code) {
			location.href="${ contextPath }/business/adminToDetail?bus_code=" + bus_code;
		}
	</script>
	
    
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