<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <title>samdado</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed8f27ec110d0e26833182650945f3b6&libraries=services,clusterer,drawing"></script>
    <style>
        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

        footer {
            background-color: rgb(70, 115, 85);
            height: 190px;
        }

        .leftImg {
            margin-left: 6%;
            margin-top: 20px;
        }

        #footer_center {
            margin-left: 30%;
            margin-top: -130px;
            color: white;
        }

        #footer_right {
            margin-left: 60%;
            margin-top: -120px;
            color: white;
        }

        .rightImg {
            padding-right: 15px;
        }

        #copyRight {
            color: white;
            margin-left: 40%;
            margin-right: 40%;
            margin-top: 10px;
            margin-bottom: 0px;
            opacity: 0.5;
        }

        hr {
            color: white;
        }

        /* 컨테이너 */
        #main-container {
            height: 100%;
            width: 85%;
            display: flex;
            flex-direction: column;
            padding-top: 5%;
            padding-left: 6.3%;

        }

        /* 메인사진 위 정보div들 */

        #ho_header div {
            margin-bottom: 1%;
        }

        #ho_title {
		    font-size: 50px;
		    color: #343a40;
		}
		
		.infoLabel {
		    font-size: 20px;
		    /* font-weight: bold; */
		    color: #495740;
		}

        #ho_grade {
            font-size: 19px;
            color: rgb(212, 71, 46);
        }

        .title_tag {
            margin-bottom: 1%;
        }

        .jjim_img {
            width: 20px;
            height: 20px;
        }

        .report_img {
		    width: 35px;
		    height: 35px;
		}

        /* 메인사진 위 정보div들 끝 */

        .col {
            float: left;
            display: inline;
            width: 55%;
            height: 100%;
        }

        .col2 {
            width: 555px;
            height: 330px;
            margin-left: 10%;
            margin-bottom: 5%;

        }

        .small_view {
            margin: 3%;
            margin-top: 0;
        }

		.small_view label{
			line-height: 20px;
		}

        .small_view_btn {
            border: 0;
            outline: 0;
            background: none;
            margin: 3%;
            padding: 0;
            font-size: 25px;
        }

        .small_view_con {
            font-weight: normal;
            margin-left: 3%;
            margin-top: 2px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 90%;
        }

        #small_view_morebtn {
            float: right;
            color:black;
            margin-right: 3%;
            border: 0;
            outline: 0;
            background: none;
        }

        .col3 {
            height: 100%;
            float: left;
            display: inline;
        }

        .mainimage{
            width: 100%;
            /* height: 100%; */
            height: 550px;
            border: 1px solid black;
        }

        .other {
		    margin-top: 1%;
		    display: flex;
		    height: 120px;
		}

        .otherimage{
            width: 20%;
            border: 1.2px solid black;
        }

        /* 지도보기 */

        .map {
            width: 100%;
            height: 100%;
        }

        #mapBtn {
            position: relative;
		    background-color: #ffffff;
		    border-radius: 6px;
		    border: 1px solid rgb(70, 115, 85);
		    cursor: pointer;
		    color: skyblue;
		    /* font-family: Arial; */
		    font-size: 15px;
		    font-weight: bold;
		    padding: 5px 20px;
		    text-decoration: none;
		    z-index: 2;
        }
        
        .beneImgs {
		    width: 100%;
		    height: 325px;
		    border-radius: 8px;
		}

        /* 편의시설 체크div 및 소개 div */

        .checktable{
            margin-top: 5%;
        }

        .introduce {
            width: 80%;
            font-size: 18px;
        }

        .boundary{
            color: black;
        }

        /* 메뉴 리스트 */         

        #firstlist {            
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;

        }

        #secondlist {            
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;

        }
        #thirdlist {
           
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .profile {

            display: flex;
            flex-direction: column;
            /* align-items: center; */
            justify-content: center;
            /* flex: 1; */
            
            width: 500px;
            height: 500px;
            box-sizing: border-box;
        }

        .image {
            width: 350px;
            height: 300px;
        }

        /* 메뉴 리스트끝 */

        .btnArea{
            text-align: center;
        }

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .moreBtn {
            background-color: rgb(70, 115, 85);
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 75px;
            text-decoration: none;
            margin-bottom: 50px;
            font-family: 'GmarketSansBold' !important;

        }
        
        #report_btn, #jjim_btn{
        	cursor: pointer;
        }

        /* 후기 */

        .review_writer {
            display: flex;
            margin: 1%;
        }

        .review_writer label {
            margin-right: 1%;
        }

        .reivew {
            border: 1px solid black;
            width: 70%;
            border-radius: 6px;
        }

        .review_img {
            width: 300px;
            height: 200px;
        }

        .review_img_area {
            width: max-content;
            margin-left: 20%;
            margin-top: 2%;
        }

        .review_date_label {
            float: right;
            margin: 1%;
            margin-bottom: 0;
        }
        

        #map {
            margin: auto;
            border-radius: 6px;
        }
		
		#exampleModalLabel{
			font-size: 30px;
			font-weight: bold;
			
		}

        /* 부트스트랩 모달*/

        .cal_top {
            text-align: center;
            font-size: 30px;
        }

        .cal {
            text-align: center;
        }

        table.calendar {
            border: 1px solid black;
            display: inline-table;
            text-align: left;
        }

        table.calendar td {
            vertical-align: top;
            border: 1px solid skyblue;
            width: 100px;
        }

        #closeBtn, #reportBtn {
            border-style: none;
            background-color: white;
        }

        .modal-header {
            padding: 5%;
            margin: auto;
        }

        .modal-header img {
            width: 100px;
            height: 100px;
        }

        .modal-body {
            padding: 10%;
        }
        
        .modal-content {
            margin: 0;
            width: 100%;
            display: flex;
        }

        .modal-body input {
            width: 100%;
        }

        .modal-content div label {
            line-height: 50px;
        }       

        .modal-body div {
            margin-bottom: 10%;
        }

        .error {
            color: red;
        }

	/* 작은 리뷰박스 클릭 */
    .review-main{
        width: 100%;
        
    }

    .modal-dialog {
        max-width: 60%;
    }

    .review-title{
        justify-content:space-between;
        display: flex;
    }

    .reivew-name{
        margin-top: 25px;
    }

    .review-avg{
        width: 25%;
    }

    .avg-con{
        display: flex;
        float: right;
        width: 100%;
        
    }

    .avg-img{
        position: relative;
    }

    .avg-text{
        position: relative;
        width: 70%;
    }

    .avg-con p{
        margin-top: 10px;
        margin-bottom: 0;
    }

    .review-box{
        display: flex;
        border: 1px solid gray;
        border-radius: 8px;
        padding: 10px 0px;
        margin: 10px 0 10px 0;
    }

    .review-user{
        width: 10%;
        text-align: center;
        margin: auto;
        margin-left: 3%;
    }

    .review-con{
        width: 90%;
        padding-left: 10px;
        margin-left: 5%;
        margin-bottom: 5px;
    }

    p {
        margin: 1rem 0 0 0;
    }
    
    #reportImage_container img{
    	width:455px;
    	height:420px;
    }
    
    .reviewTitle {
	    font-size: 30px;
	    font-weight: bold;
	}
    </style>

</head>

<body>
    <!-- navi.jsp include -->
    <jsp:include page="../../common/navi.jsp"/>
    
    <section id="main-container">
        <!-- 상세페이지 헤더 -->
        <div id="ho_header">
            <div class="title_area">
                <div class="title_area">
                    <c:if test="${ res.bus_classify eq 'P' }">
                    <img src="../resources/images/image_listpage/premiumicon.png"><br>
                    </c:if>
                    <label id="ho_title" class="title_tag">${ res.bus_name }</label>
                    <br>
                </div>
                <label id="ho_address" class="infoLabel">${ res.bus_address.substring(6) }</label><br>
                <label class="infoLabel">영업시간 : 오픈  ${ res.bus_opening.substring(0, 5) } ~ 마감  ${ res.bus_opening.substring(6) }</label>&nbsp;
            </div>

            <div id="ho_info">
            <c:if test="${ loginUser.usno != null }">
                <label id="jjim_btn" class="infoLabel">
			        <c:choose>
					    <c:when test="${jjimcheck eq '0' or empty jjimcheck}"> <!-- jjimcheck가 0이면 빈하트-->
					        <img src="../resources/images/image_listpage/noheart.png" 
					             id="btn_like">
					    </c:when>
					    <c:otherwise> <!-- jjimcheck가 1면 빨간 하트-->
					        <img src="../resources/images/image_listpage/heart.png" 
					              id="btn_like">
					    </c:otherwise>
					</c:choose>찜하기</label>
					</c:if>
                <label id="report_btn" class="infoLabel" data-bs-toggle="modal" data-bs-target="#reportModal"><img id="report" class="report_img" src="../resources/images/image_listpage/siren.png">신고하기</label>
                <label class="infoLabel"><img id="report" class="report_img"
                        src="../resources/images/image_listpage/phone.png">${ res.bus_phone }</label>
            </div>
        </div>
        
        <!-- 찜하기 -->
        <script>
        var bbsidx = ${res.bus_code};
        var useridx = ${loginUser.usno};
         
        var btn_like = document.getElementById("btn_like");
         btn_like.onclick = function(){ changeHeart(); }
         
        /* 찜하기 버튼 눌렀을때 */
         function changeHeart(){ 
             $.ajax({
                    type : "POST",  
                    url : "${ contextPath }/business/jjim",
                    dataType : "json",
                    data : "bbsidx="+bbsidx+"&useridx="+useridx,
                    error : function(){
                        Rnd.alert("통신 에러","error","확인",function(){});
                    },
                    success : function(jdata) {
                        if(jdata.resultCode == -1){
                            Rnd.alert("찜하기 오류","error","확인",function(){});
                        }
                        else{
                            if(jdata.jjimcheck == 1){
                                $("#btn_like").attr("src","../resources/images/image_listpage/heart.png");
                                
                               
                            }
                            else if (jdata.jjimcheck == 0){
                                $("#btn_like").attr("src","../resources/images/image_listpage/noheart.png");
                                
                                
                            }
                        }
                    }
                });
         }
        </script>

		<!-- 매장사진 -->
        <div class="colsmom">
            <div class="col">
            	<c:forEach var="a" items="${ att }">
            	<c:if test="${ a.file_lv eq '0' }">
                <img id="bigPic" class="mainimage" src="${ contextPath }/resources/busUploadFiles/${ a.file_rename }">
              </c:if>
              </c:forEach>
                <div class="other">
					<c:forEach var="a" items="${ att }">
					<c:if test="${ a.file_lv ne '1' }">
                    <img id="smallPic" class="otherimage" src="${ contextPath }/resources/busUploadFiles/${ a.file_rename }">
	                </c:if>
	                </c:forEach>
                </div>
            </div>
         	   
            <!-- 매장 사진 클릭 시 변경 스크립트 -->
			<script>
                var bigPic = document.querySelector("#bigPic");
                var smallPic = document.querySelectorAll("#smallPic")

                for(var i = 0; i < smallPic.length; i++){
                    smallPic[i].addEventListener("click", changepic);
                    
                }
                function changepic(){
                    var smallPicAttribute = this.getAttribute("src");
                    bigPic.setAttribute("src", smallPicAttribute);

                }
            </script>
            
            <div class="col3">
	            <!-- 구글지도 -->
                <div class="col2">
                    <div id="map" style="width: 555px; height:330px;">
                    <button type="button" id="mapBtn" 
                    onclick="window.open('https://map.kakao.com/link/to/${res.bus_address.substring(6)}','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');">길찾기</button>
                    </div>
                </div>
                
                <!-- 구글지도 api -->
                <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  

	            // 지도를 생성합니다    
	            var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	            // 주소-좌표 변환 객체를 생성합니다
	            var geocoder = new kakao.maps.services.Geocoder();
	            
	            var add = "<c:out value='${ res.bus_address}'/>";
	            var splitadd = add.split(',');
	            

	            
	            // 주소로 좌표를 검색합니다
	            geocoder.addressSearch(splitadd[1], function(result, status) {
	            	
						console.log(add);
						console.log(splitadd[1]);
	                // 정상적으로 검색이 완료됐으면 
	                 if (status === kakao.maps.services.Status.OK) {
			
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	                    // 결과값으로 받은 위치를 마커로 표시합니다
	                    var marker = new kakao.maps.Marker({
	                        map: map,
	                        position: coords
	                    });
	
	                    // 인포윈도우로 장소에 대한 설명을 표시합니다
	                    var infowindow = new kakao.maps.InfoWindow({
	                        content: '<div style="width:150px;text-align:center;padding:6px 0;">${ res.bus_name }</div>'
	                    });
	                    infowindow.open(map, marker);
	
	                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                    map.setCenter(coords);
	                } 
	            });    
				</script>
				
                <!-- 작은 리뷰 -->
                <div class="col2" id="small_view_area">
	                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	                  <div class="carousel-inner">
	                  	<div class="carousel-item active">
	                  	<c:forEach var="a" items="${ all }" varStatus="i">
	                  		<c:if test="${ i.first }">
								<img class="beneImgs"src="${ contextPath }/resources/busUploadFiles/alliance/${ a.aimgcname }" class="d-block w-100" alt="...">
							</c:if>
						</c:forEach>
	                    </div>
						<c:forEach var="a" items="${ all }">
							<div class="carousel-item">
								<img class="beneImgs"src="${ contextPath }/resources/busUploadFiles/alliance/${ a.aimgcname }" class="d-block w-100" alt="...">
	                    	</div>
						</c:forEach>
	                  </div>
	                </div>
                </div>
            </div>
        </div>
            <hr class="boundary">

			<!-- 매장소개 -->
            <div class="introduce">
                <h2>소개</h2><br>
                <p>${ res.bus_intro }</p>
            </div>

            <hr class="boundary">

            <div class="list">
            	<h2>메뉴판</h2>
                <div id="firstlist">
                <c:forEach var="m" items="${ att }">
                <c:if test="${ m.file_lv eq '1' }">
                    <div class='profile'>
                        <img class="image" src="../resources/busUploadFiles/${ m.file_rename }">
                    </div>
                </c:if>
                </c:forEach>    
                </div>
            </div>
            
            <hr class="boundary">
            
        <!-- 후기 -->
        <div id="review_area">
            <label class="reviewTitle">후기</label>&nbsp;&nbsp;<label id="starLabel"style="font-size: 30px;"><a style="color:#ffd700;">★</a><b></b>(후기 ${ review.size() }개)</label><br>
            <c:if test="${ empty review }">
            <div class="reviewBox">
            <p style="font-size:60px">등록 된 리뷰가 없습니다</p>
            </div>
            </c:if>
            <c:forEach var="r" items="${ review }">
            <div class="reviewBox">
	            <div class="review_img_area">
	            	<c:if test="${ r.img_rename1 ne '미입력'  }">
	                <img src="${ contextPath }/resources/muploadFiles/${ r.img_rename1 }" class="review_img">
	                </c:if>
					<c:if test="${ r.img_rename2 ne '미입력'  }">
	                <img src="${ contextPath }/resources/muploadFiles/${ r.img_rename2 }" class="review_img">
	                </c:if>
	                <c:if test="${ r.img_rename3 ne '미입력'  }"> 	
	                <img src="${ contextPath }/resources/muploadFiles/${ r.img_rename3 }" class="review_img">
	                </c:if>
	            </div>
	            <div class="review_writer">
	                <label  class="reviewTitle" style="font-size:15px;">${ r.us_name }</label>
	                <div class="review">
	                    <a>${ r.rev_comment }</a>
	                    <label class="review_date_label">${ r.rev_date }</label>
	                    <label class="review_date_label"><a style="color:#ffd700;">★</a> ${r.re_star }</label>
	                </div>
	            </div>
            </div>
            </c:forEach>
        </div>
        
    </section>
    
    <!-- 신고Modal -->
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <img src="../resources/images/image_main/logo_g.png"> <!-- 이미지 경로 이동하기 -->
            <h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2>
            <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
            </div>
            <form action="${ contextPath }/business/report" id="writeForm" method="post" enctype="multipart/form-data">
            <div class="modal-body">
            
            <input type="hidden" name="rep_res" value="허위매물">            
             <input type="hidden" name="bus_code" value="${ res.bus_code }">
                      
                <!--신고대상-->
                <div class="name_div">
                    <label for="id">신고대상</label>                   
                    <input type="text" id="name" name="bus_name" value="${ res.bus_name }" readonly>
                </div>
                <!--신고사유-->
                <div class="reason_div">
                    <label for="reason">신고사유</label>                    
                    <input type="text" id="reason" name="rep_cont" placeholder="50자 이내로 작성해주세요" required>
                </div>
                <!--파일첨부-->
                <div class="reportimg_div">
                    <label for="reportimg">파일첨부</label>                    
                    <input type="file" id="reportimg" name="uploadFile" onchange="setThumbnail(event);">
                    <div id="reportImage_container" style="width:500px; hegiht:500px;"></div>
                </div>
                
            </div>
            <div class="modal-footer">                
                <button type="submit" id="reportBtn" onclick="reportAlert()">신고하기</button>
                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
            </div>
            </form>
        </div>
        </div>
    </div>
    
    <script>
    $(function(){
    	var reviews = '<c:out value="${review.size()}"/>'
    	if(reviews == '0'){
    		$(".reviewBox").css({
    			"text-align": "center",
    	    	"color": "#495975",
    	    	"margin-bottom": "40px"
    		});
    	}
    });
    
    	function reportAlert(){ 
    		alert('신고가 완료되었습니다.'); 
    	}
    	
    	function setThumbnail(event) { 
    		var reader = new FileReader(); 
    		reader.onload = function(event) { 
    			var img = document.createElement("img"); 
    			img.setAttribute("src", event.target.result); 
    			document.querySelector("div#reportImage_container").appendChild(img); 
    		}; 
    		reader.readAsDataURL(event.target.files[0]); 
    	}
    	
    </script>



     <footer>
           <jsp:include page="../../common/footer.jsp"/>
     </footer>




    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
    -->

</body>

</html>