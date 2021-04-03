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
          
          <div class="col-10" id="B">
            <div class="row"  id="C">
                <div class="col-8" id="E">
                    <div class="container">

                        <!--- 상단 알림바 ------------------------------------------------------------------------------------------------------------------------->
                          <!-- admin-navi-up 인클루드 -->
         				  <jsp:include page="admin-navi-up.jsp"/>
                  
                           <div class="row" style="padding-top: 4%;">
                           <h1>광고별 매출</h1>
                	       <h6>최근 날짜 기준으로 5개의 Q&A만 보여집니다.</h6>
                	       <br>
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

                    <!-- 달력-->
                    <div class="row" style="padding-top: 4%; padding-right: 7%;">
                    <h1>달력</h1>
                	 <h6>최근 날짜 기준으로 5개의 Q&A만 보여집니다.</h6>
                	 <br>
                        <table class="table table-hover">
                          <thead>
                          <tr>
                              <th scope="col">구글달력좀 넣고싶은데</th>
                              <th scope="col">First</th>
                              <th scope="col">Last</th>
                              <th scope="col">Handle</th>
                          </tr>
                          </thead>
                          <tbody>
                          <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
                          </tr>
                          <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>@fat</td>
                          </tr>
                          <tr>
                              <th scope="row">3</th>
                              <td colspan="2">Larry the Bird</td>
                              <td>@twitter</td>
                          </tr>
                          <tr>
                              <th scope="row">3</th>
                              <td colspan="2">Larry the Bird</td>
                              <td>@twitter</td>
                          </tr>
                          <tr>
                              <th scope="row">3</th>
                              <td colspan="2">Larry the Bird</td>
                              <td>@twitter</td>
                          </tr>
                          <tr>
                              <th scope="row">3</th>
                              <td colspan="2">Larry the Bird</td>
                              <td>@twitter</td>
                          </tr>
                          <tr>
                              <th scope="row">3</th>
                              <td colspan="2">Larry the Bird</td>
                              <td>@twitter</td>
                          </tr>
                       
                          </tbody>
                      </table>
                  </div>

                    <!--막대 그래프(총 매출)-->
                     <div class="row" style="padding-top: 4%; padding-right: 7%; padding-bottom: 5%;">
                     <h1>최근 6개월 매출</h1>
                	 <h6>최근 날짜 기준으로 5개의 Q&A만 보여집니다.</h6>
                	 <br>
                        <!--차트 그려지는 영역-->
                        <canvas id="myBarChart" width="400" height="300"></canvas>

                        <!-- 막대그래프 create chart-->
                        <script>
                        var ctx = document.getElementById('myBarChart').getContext('2d');
                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: ['12월', '1월', '2월', '3월', '4월', '5월'],
                                datasets: [{
                                    label: '최근 6개월간 매출',
                                    data: [12, 19, 3, 5, 2, 3],
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

            <!--Q&A-->
            <div class="row" id="D">
                <div class="col-4" id="G">
                <h1>Q&A</h1>
                <h6>최근 날짜 기준으로 5개의 Q&A만 보여집니다.</h6>
                <br>
                    <table class="table table-hover" id="qnaTable" style="table-layout: fixed;">
                        <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">작성자</th>
                            <th scope="col">내용</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="q" items="${ qnaList }">
	                        <tr>
	                            <th scope="row">${ q.qnano }</th>
	                            <td>${ q.usname }</td>
	                            <td style="overflow: hidden; white-space : nowrap; text-overflow: ellipsis;">${ q.qcont }</td>
	                        </tr>
                        </c:forEach>                     
                        </tbody>
                    </table>
                </div>
                
                <div class="col-8" id="H">
                <h1>다른거</h1>
                <h6>최근 날짜 기준으로 5개의 Q&A만 보여집니다.</h6>
                <br>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">회원명 또는 회원번호</th>
                            <th scope="col">구분</th>
                            <th scope="col">제목</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
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