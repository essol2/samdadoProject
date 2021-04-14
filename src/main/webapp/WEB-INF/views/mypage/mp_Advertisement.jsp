<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_adver</title>

    <!-- 차트 링크 --> 
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<style>

    /* 폰트 */
    * {
         font-family: 'Jeju Myeongjo', serif;
    }

    /* 마이페이지 css */
    
     #back {
        width: 1440px;
        height: 100%;
        /* margin: auto; */
        top: 0;
    }
    body{
        background-image: url('../resources/images/image_mp/backgroundImg.png');
        background-size: 100%;
    }
    #topMenu{
      align-items: center;
      width : 98%;
      height : 150px;
      /* border : 1px solid black; */
      position : absolute;
    }

    .menuBox{
        width : 95%;
        height : 150px;
        /* border : 1px solid blue; */
        display : inline-block;
        position:relative;
        top : 3%;
        left : 3%;
        margin-left : 1%;
        align-items: center;
    }
    .menuButton{
        width : 170px;
        height : 150px;
        border : 1px solid white;
        background-color: white;
        color : #bfbfbf;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 3%;
        border-radius: 2px;
        align-items: center;
    }

    .menuButton:hover{
        box-shadow: 6px 6px gray;
        cursor: pointer;
    }

    .menuBoxEle{
        /* border : 1px solid red; */
        width : 110px;
        height : 110px;
        text-align: center;
        margin-left :14%;
    }

    .btnImg{
        width: 60px;
        height : 60px;
        margin-bottom: 8px;
        /* border : 1px solid yellow; */
    }

    .clickedBtn{
        box-shadow: 3px 3px gray;
        width : 170px;
        height : 150px;
        border : 1px solid #467355;
        background-color:#467355;
        color : white;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 3%;
        border-radius: 2px;
        align-items: center;
    }

    .clickedBtn:hover{
        box-shadow: 6px 6px gray;
        cursor: pointer;
    }
    
    /* mainBox */
    #mainBox{
        position : absolute;
        top : 20%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : fit-content;
         margin-top : 5%;
        margin-left : 3%;
    }
    #adverBox{
        display: flex;
        width : 100%;
        margin-top : 4%;
    }

    #leftAdverBox{
        order : 1;
        width : 35%;
        margin-left : 5%;
        margin-top : 10px;
        margin-bottom: 10px;
        margin-right : 10px;
    }

    #adverContainer{
        background-color: white;
        height : 815px;
        width : 100%;
        /* border : 1px solid red; */
    }

    #bannerAdverBox{
        border : 1px solid #463755;
        border-radius: 3px;
        width : 100%;
        height : 70%;
        padding-top : 5%;
        padding-left : 3%;
        /* margin-left : 10%; */
        font-size : 100px;
    }
    
    #bannerAdverBox1{
    	border : 1px solid #463755;
        border-radius: 3px;
        width : 100%;
        height : fit-content;
        padding-top : 5%;
        padding-left : 3%;
        /* margin-left : 10%; */
        font-size : 100px;
        margin-top : 3%;
    }

    #primeumAdverBox{
        border : 1px solid #463755;
        border-radius: 3px;
        width : 80%;
        margin-left : 10%;
        margin-right : 10%;
        margin-bottom: 5%;
    }

    #rightAdverBox{
        order : 2;
        width : 53%;
        margin : 10px;
        hight : 300px;
        /* border:1px solid blue; */
    }

    #topAdverBox{
        background-color: white;
        text-align: center;
        /* margin-top : 3%; */
        margin-bottom: 3%;
        /* padding : 5%; */
        height : 10%;
        padding-top : 1%;
        padding-bottom : 5%
    }

    #topAdverBox h2{
        /* border : 1px solid red; */
        height : 100%;
    }

    #topAdverBox b{
        font-size: 70px;
        margin-bottom : 10%;
        /* border : 1px solid blue; */
        margin-top : 5%;
        padding-bottom: 5%;
    }

    #bottomAdverBox, #ingBox{
        background-color: white;
        text-align: center;
        margin-bottom:5%;
        margin-top : 3%;
        
    }
    
    #bottomAdverBox { 
    	padding : 5%;
    	height: fit-content;
    }
    
    #ingBox{
    	padding : 0px;
    	height : 310px;
    	display : flex;
    	align-items : center;
    }
    
    .previous, .next, .content{
    	/* border : 1px solid green; */
    	display : inline-block;
    }
    
    .content{
    	order : 2;
    	width : 80%;
    	height : 250px;
    	align-items : center;
    }
    
    .previous, .next{
    	width : 8%;
    	height : 250px;
    	cursor : pointer;
    	padding-top : 25%;
    	text-align : center;
    	
    }
    
    .previous{
    	order : 1;
    	margin-left : auto;
    }
    .next {
    	order : 3;
    	padding-top : 25%;
    	margin-right : auto;
    }
</style>
<body>
    <!--부트스트랩-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <div id="back">
        <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/buserinfo'"> <div class="menuBoxEle" ><br><img src="../resources/images/image_mp/mp_userB.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle" ><br><img src="../resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToBuss();"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="clickedBtn" id="myInfo" onclick="goToAdvert();"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/adverW.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToPoint();"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/gotoqna'"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="adverBox">
                    <div id="leftAdverBox">
                        <div id="adverContainer">
                            <br>
                            <h3 style="color: #467355; margin-left : 10%; padding-top : 2%;"> 진행중인 광고</h3>
                            <br>
                            <hr>
                            <div style="overflow:auto">
                            <h3 style="color: #467355; text-align:center;"> 메인페이지 배너광고</h3> 
                            
                            <c:forEach items="${ allList }" var="al" varStatus="alStatus">
                            
                            <c:if test="${allList} == null">
                            	<div id="bannerAdverBox">
                            		<p style="color: #467355; text-align:center;">광고중인 사업장이 없어요!</p>
                            	</div>
                            </c:if>
	                            <div id="bannerAdverBox1">
	                                <p style="text-align: center; font-size: small;"> 사업장 이름 : ${ al.bus_name }</p>
	                                <p style="text-align: center; font-size: small;"> 신청일 : <fmt:formatDate value="${ al.alsubdate }" type="date" pattern="yyyy-MM-dd"/></p>
	                                <p style="text-align: center; font-size: small;"> 승인일 : <fmt:formatDate value="${ al.startdate }" type="date" pattern="yyyy-MM-dd"/></p>
	                               
	                            </div>
                            </c:forEach>
                            </div>
                            <br>
                            <hr>
                            <br>
                            <div style="overflow:auto">
                            <h3 style="color: #467355; text-align:center;"> 프리미엄 광고</h3> 
                            <c:forEach items="${ pbusList }" var="pb" varStatus="pbStatus">
                            
                            <c:if test="${ pbList } == null">
                            	<div id="bannerAdverBox">
                            		<p style="color: #467355; text-align:center;">광고중인 사업장이 없어요!</p>
                            	</div>
                            </c:if>
	                            <div id="bannerAdverBox1">
	                                <p style="text-align: center; font-size: small;"> 사업장 이름 : ${ pb.bus_name }</p>
	                                <p style="text-align: center; font-size: small;"> 등록일 : <fmt:formatDate value="${ pb.bus_date }" type="date" pattern="yyyy-MM-dd"/></p>	                               
	                            </div>
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div id="rightAdverBox">
                        <div id="topAdverBox">
                            <h2 style="color: #467355;">실시간 누적 클릭 수 : &nbsp; <b id="boldText">덧셈식 만들어야지!</b> 회</h2>
                        </div>
                        <div id="bottomAdverBox">
                            <div class="container"> 
                                <canvas id="myChart"></canvas> 
                            </div>
						    <script>
						    data = { 
						    		datasets: [{ 
						    			label: 'My First Dataset',
						    			borderColor: '#467355',
			 			    			data: [10, 20, 30, 40, 50],
			 							
						    		}], 
						    		labels: ["1월", "2월", "3월", "4월","5월"] 
						    	};
						    	
						    	var ctx2 = document.getElementById("myChart"); 
						    	var myDoughnutChart = new Chart(ctx2, { 
						    		type: 'line', 
						    		data: data, 
						    		options: {
						    			cutoutPercentage: 30
						    		} 
						    	}); 
						    </script>
    
                        </div>
                        <div id='ingBox'>
                        	<br>
                        	<div class="previous">
                        	<c:if test="${ api.currentPage <= 1 }">
                        		<h1 style="color : #467355;, text-align : center; font-size:20px;"> &lt; </h1>
                        	</c:if>
                        	<c:if test="${ api.currentPage > 1 }">
                        		<c:url var="before" value="/mypage/advert" >
                        			<c:param name="page" value="${ api.currentPage -1 }"/>
                        			<c:param name="usno" value="${ loginUser.usno }"/>
                        		</c:url>
                        		<a href="${ before }" style="color : #467355;, text-align : center; font-size:20px;"> &lt; </a>
                        	</c:if>
                        	</div>
                        	<div class="content">
                        	<br>
	                            <h3 style="color: #467355; text-align : center;">배너광고 신청 사업장</h3>
	                            <br>
	                             <c:forEach items="${ applyList }" var="ap" varStatus="apStatus">
		                            <div id="bannerAdverBox">
		                                <p style="text-align: center; font-size: 20px;">사업장 이름 : ${ ap.bus_name }</p>
		                                <p style="text-align: center; font-size: 20px;">신청일 : <fmt:formatDate value="${ ap.alsubdate }" type="date" pattern="yyyy-MM-dd"/> </p>
		                                <p style="text-align: center; font-size: 20px;;">상태 : 승인 검토중</p>
		                            </div>
                            	</c:forEach>
                            </div>
                            <div class="next">
                            <c:if test="${ api.currentPage >= api.maxPage }">
                            	<h1 style="color : #467355;, text-align : center; font-size:20px;" > &gt; </h1>
                            </c:if>
                            <c:if test="${ api.currentPage < api.maxPage }">
                            	<c:url var="after" value="/mypage/advert">
                            		<c:param name="page" value="${ api.currentPage + 1}"/>
                            		<c:param name="usno" value="${ loginUser.usno }"/>
                            	</c:url>
                            	<a href="${ after }" style="color : #467355;, text-align : center; font-size:20px;"> &gt; </a>
                            </c:if>
                            </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
   
     <script>
	function goToPoint(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/point?usno='+${loginUser.usno};
	};
	
	function goToBuss(){
		location.href='${contextPath}/mypage/buss?usno='+${loginUser.usno};
	}
	
	function goToAdver(){
		location.href="${contextPath}/mypage/advert?usno="+${loginUser.usno};
	}
	</script>
</body>
</html>