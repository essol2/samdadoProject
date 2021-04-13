<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메뉴바는 어떤 페이지이든 포함하고 있으므로 contextPath 변수 선언 후 application에서 모두 사용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	 <section class="page-start">
        <div id="bottom">
            <div id="content">
                <br><br><br>
                
                <!-- 지혜 : 길만들러가기 전체 컨테이너-->
                <div class="container g-0">
                    <!--전체 1행 -->
                    <div class="row">
                      <!-- 왼쪽 텍스트 -->
                      <div class="col" id="left_side_text">
                        <div class="col" id="empty_up_div"></div>
                        <div class="col" id="center_text_div">
                            <h3>
                                <b>"여유가 있어 여행을 가는 게 아니라 <br>
                                여행을 가니까 여유가 생기는 것이다."</b>
                            </h3>  
                            <br>
                            <h6>
                                여행이란 우리가 사는 장소를 바꾸어 주는 것이 아니라 <br>
                                우리의 생각과 편견을 바꾸어 주는 것이다.
                            </h6>
                            <br>
                        </div>
                        <div class="col" id="make_root_down_div">
                            <!-- 길 만들러 가기-->
                            <div class="col-3">
                                <a href="${ contextPath }/route/m_route"><h5>길 만들러 가기</h5></a>
                            </div>
                            <!-- 화살표 -->
                            <div class="col-1">
                                <a href="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                      </div>
                      
                      <!-- 오른쪽 이미지 -->
                      <div class="col" id="right_side_img">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                              <div class="carousel-item active">
                                <img src="resources/images/image_main/formain1.png" class="d-block w-100" alt="...">
                              </div>
                              <div class="carousel-item">
                                <img src="resources/images/image_main/formain1.png" class="d-block w-100" alt="...">
                              </div>
                              <div class="carousel-item">
                                <img src="resources/images/image_main/formain1.png" class="d-block w-100" alt="...">
                              </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="prev">
                              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                              <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="next">
                              <span class="carousel-control-next-icon" aria-hidden="true"></span>
                              <span class="visually-hidden">Next</span>
                            </button>
                          </div>
                      </div>
                    </div>
                  </div>
            
                <br><br><br><br><br><br>
            
                <!-- 은솔 : 배너광고 구간 -->
                <h3 style="margin-left : 3%;"> 이제, 여행은 가까운 곳에서.</h3>
                <div class="tableArea">
					<table id="bannerAdImglistTable">
						<thead>
							<tr>
							</tr>
					    </thead>
						<tbody></tbody>
					</table>
				</div>
            </div>
        </div>
        </section>
        
        
     <!-- ajax -->
	<script>
		$(function() {
			selectBannerAdImgList();
			setInterval(selectBannerAdImgList, 10000);
		});
		
		function selectBannerAdImgList() {
			$.ajax({
				url : "${ contextPath }/business/selectBannerAdImgList",
				dataType : "json",
				success : function(data) {
					console.log(data);
					
					tableBody = $("#bannerAdImglistTable tbody");
					tableBody.html("");
					
					for (var i in data) {
						var tr = $("<tr onclick='selectBannerAdDetail(" + data[i].bus_code + ")'>");
						
						var alno = $("<td>").text(data[i].alno); 
						var bus_code = $("<td>").text(data[i].bus_code); 
						var aimgcname = $("<td>");
						aimgcname.html("<img src='${ contextPath }/resources/busUploadFiles/alliance/" + data[i].aimgcname + ">'");
						
						tr.append(alno, bus_code, aimgcname);
						tableBody.append(tr);
					}
				},
				error : function(e) {
					alert("code : " + e.status + "\n"
							+ "message : " + e.responseText);
				}
			});
		}
		
		// 해당 게시글 하나를 누르면 상세페이지가 보여지게 하는 컨트롤러 호출
		function selectBannerAdDetail(bus_code) {
			location.href='${ contextPath }/business/detail?bus_code=' + bus_code;
		}
	</script>
	
	
	<!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        
</body>
</html>