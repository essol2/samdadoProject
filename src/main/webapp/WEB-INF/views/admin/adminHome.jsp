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
                                <canvas id="myAllChart"></canvas>
                            </div>
                            
                            <script>
	                            function getAllProfit(profitType) {
	                            	
	                            	var allprofits = [];
	                            	obj = { item: profitType }; // 키값 vo 필드명이랑 일치
	                            	
	                            	$.ajax({
	                    				url : "${ contextPath }/admin/selectGetAllProfit",
	                    				dataType : "json",
	                    				data: JSON.stringify(obj),
	                    				contentType: "application/json",
	                    				method: "post", 
	                    				async: false, // 비동기가 아니도록 처리
	                    				success : function(data) {
	                    					console.log("AJAX SUCCESS!");
                    			            //console.log(data);
                    			            
                    			            for (var i in data) {
                    			            	
                    			            	//var pamount = $(data[i].pamount);
                    			            	
                    			            	//console.log(pamount);
                    			            	
                    			            	allprofits.push(data[i].pamount);
                    			            	
                    			            	
                    			            }

	                    				},
	                    				error : function(e) {
	                    					 console.log("AJAX FAILED..");

	                    				}
	                    			});
	                            	
	                            	console.log(allprofits);
	                            	return allprofits;
	                            }
                            </script>
                                    	
		                  	<script>
				                  	const DATA_COUNT = 6;
				                  	const NUMBER_CFG = {count: DATA_COUNT, min: 0};
		
				                  	const labels = ["11월", "12월", "1월", "2월", "3월", "4월"];
				                  	
				                  	const data = {
				                  	  labels: labels,
				                  	  datasets: [
				                  	    {
				                  	      label: '커미션',
				                  	      data: getAllProfit("수수료"),
				                  	      backgroundColor: "rgb(54, 162, 235)",
				                  	    },
				                  	    {
				                  	      label: '프리미엄',
				                  	      data: getAllProfit("프리미엄"),
				                  	      backgroundColor: "rgb(75, 192, 192)",
				                  	    },
				                  	    {
				                  	      label: '배너',
				                  	      data: getAllProfit("충전"),
				                  	      backgroundColor: "rgb(255, 99, 132)",
				                  	    },
				                  	  ]
				                  	};
				                   
		                  	       const config = {
		                  	    	  type: 'bar',
		                  	    	  data,
		                  	    	  options: {
		                  	    	    plugins: {
		                  	    	      title: {
		                  	    	        display: true,
		                  	    	        text: 'Chart.js Bar Chart - Stacked'
		                  	    	      },
		                  	    	    },
		                  	    	    responsive: true,
		                  	    	    scales: {
		                  	    	      x: {
		                  	    	        stacked: true,
		                  	    	      },
		                  	    	      y: {
		                  	    	        stacked: true
		                  	    	      }
		                  	    	    }
		                  	    	  }
		                  	    	};
		                  	       
				                   var myAllChart = new Chart(document.getElementById('myAllChart'), config);
		                  	</script>
                  	
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="col-4" id="F">

                    <!-- SMS -->
                    <div class="row" style="padding-top: 4%; padding-right: 7%;">
                    	<div class="col" id="G">
			                <h1>Board</h1>
			                <h6>최근 등록한 날짜순으로 노출됩니다.</h6>
			                <!-- Button trigger modal -->
							<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left: 85%; margin-top: -15%;">
							  등록
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">공지사항 등록</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							        <div class="modal-body">
								      <form action="${ contextPath }/admin/sendAboard" method="post">
								      	<div class="form-floating">
										  <select class="form-select" id="floatingSelect" aria-label="Floating label select example" name="uspart">
										    <option selected>회원 카테고리를 선택하세요.</option>
										    <option value="전체">전체(일반+제휴)</option>
										    <option value="일반">일반회원</option>
										    <option value="제휴">제휴회원</option>
										  </select>
										  <label for="floatingSelect">회원 카테고리 선택</label>
										</div>
										<br>
										<div class="form-floating">
										  <input type="text" class="form-control" placeholder="Leave a comment here" name="btitle" id="floatingTextarea">
										  <label for="floatingTextarea">제목을 입력하세요.</label>
										</div>
										<br>
										<div class="form-floating">
										  <textarea class="form-control" placeholder="Leave a comment here" name="bcontent" id="floatingTextarea" style="resize: none; height: 100px;"></textarea>
										  <label for="floatingTextarea">내용을 입력하세요.</label>
										</div>
										<div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									        <button type="submit" class="btn btn-primary">등록</button>
								        </div>
									  </form>
							        </div>
							    </div>
							  </div>
							</div>
			                
			                <br>
				                <div style="overflow:auto; table-layout: fixed; height: 300px;">
				                	
				                	    <table class="table table-hover" id="aBoardTable" style="table-layout: fixed;">
									        <thead>
						                        <tr>
						                            <th style="width: 10%;">No</th>
						                            <th>제목</th>
						                            <th style="width: 25%;">작성일</th>
						                        </tr>
					                        </thead>
					                        <tbody>
					                        <c:choose>
												<c:when test="${ !empty selectAboardList }">
						                            <c:forEach var="aboardList" items="${ selectAboardList }" varStatus="status">
						                            
							                        <tr>
							                            <th>${ aboardList.bno }</th>
							                            <td style="overflow: hidden; white-space : nowrap; text-overflow: ellipsis;">
								                            <button type="button" style="background: none; border: none;" data-bs-toggle="modal" data-bs-target="#exampleModal${ status.count }">
					  										   <b>${ aboardList.btitle }</b>
							                                </button>
							                            </td>
							                            <td>${ aboardList.bdate }</td>
							                        </tr>
							                        
							                        <!-- 모달 -->
									                   <div class="modal fade" id="exampleModal${ status.count }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														  <div class="modal-dialog">
														    <div class="modal-content">
															      <div class="modal-header">
															        <h5 class="modal-title" id="exampleModalLabel">공지사항 등록</h5>
															        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															      </div>
															        <div class="modal-body">
																      <form action="${ contextPath }/admin/sendAboard" method="post">
																      	<div class="form-floating">
																		  <select class="form-select" id="floatingSelect" aria-label="Floating label select example" name="uspart" disabled>
																		    <option selected>${ status.current.uspart }</option>
																		  </select>
																		  <label for="floatingSelect">회원 카테고리</label>
																		</div>
																		<br>
																		<div class="form-floating">
																		  <input type="text" class="form-control" placeholder="Leave a comment here" value="${ status.current.btitle }" name="btitle" id="floatingTextarea" disabled>
																		  <label for="floatingTextarea">공지글 제목</label>
																		</div>
																		<br>
																		<div class="form-floating">
																		  <textarea class="form-control" placeholder="Leave a comment here" name="bcontent" id="floatingTextarea" style="resize: none; height: 100px" disabled>${ status.current.bcontent }</textarea>
																		  <label for="floatingTextarea">공지글 내용</label>
																		</div>
																		<br>
																		<div class="form-floating">
																		  <input type="text" class="form-control" placeholder="Leave a comment here" value="${ status.current.bdate }" name="bdate" id="floatingTextarea" disabled>
																		  <label for="floatingTextarea">작성일</label>
																		</div>
																		<div class="modal-footer">
																	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
																        </div>
																	  </form>
															        </div>
															    </div>
														  </div>
														</div>
							                        
	                                     		   </c:forEach>  
                                     		      </c:when>
                                     		      <c:otherwise>
                                     		      	<tr>
                                     		      		<td colspan="3" style="text-align: center;">작성된 공지사항이 없습니다.</td>
                                     		      	</tr>
                                     		      </c:otherwise>
                                     		   </c:choose>
					                        </tbody>
				                        </table>
								</div>
								
			            </div>
                     </div>
					<br><br>
                    <!--막대 그래프(총 매출)-->
                     <div class="row" style="padding-top: 4%; padding-right: 7%; padding-bottom: 5%;">
                     <h1>최근 6개월 총 매출</h1>
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
                            <th style="width: 10%;">No</th>
                            <th style="width: 15%;">작성자</th>
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