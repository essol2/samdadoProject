<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- css 외부 파일 첨부 -->
<link rel="stylesheet" href="${ contextPath }/resources/css/common/navi.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/user/addMember.css" type="text/css">
<style>
		/* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }
        
        /* 혜윤 : 네비 css */
        header {
            position:fixed;
            width: 240px;
            top: 0;
            left:1200px;
            height:100%;
            border-left: 3px solid black;
            z-index: 1;
        }

        #content {
            width: 80%;
            height: auto;
            /* background-color: rgb(255, 181, 181); */
        }
        
        .center {
            text-align: center;
        }

        .right {
            text-align: right;
            position: relative;
            right: 10%;
            margin: auto;
            /* color : white; */
        }

        #navi-title {
            font-size: 40px;
            font-weight: bold;
        }

        .center {
        	font-size: 15px;
            font-weight: 500;
        }
        
        .navi {
            height: 600px;
            /* border : 1px solid pink; */
            margin-left: 2%;
            width : 100%;
        }

        .navi_logoimg {
            position: relative;
            top : 92%;
            left: 70%;
        }

		.helloName{
			/* float : left; */
			text-align : right;
			font-size : x-large;
			/* border : 1px solid red; */
  			margin-left : 36%;
			width : fit-content;
			margin-right : 1%;
			
		}
		
		 /* 반응형 */
        @media (max-width:1920px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:87%;
                height:100%;
                z-index: 1;
        
            }

	        #addMemberBtn, #myPageBtn, #loginBtn, #logOutBtn, #adminHomeBtn{
				/* color: white; */
				background-color: rgba( 255, 255, 255, 0 );
				border: none;
				float: right;
				margin-right: 5%;
				font-size: 15px;
				border : 1px solid red;

			}
	 

            #bannerBoxLeft{
                width : 43%;
                height : auto;
                display : inline-block;
                margin-left : 5%;
                margin-right : 6%;
            }

            #bannerBoxRight{
                width : 43%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 100%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
                
            }

            #bottom {
                width: 1640px;
                height: auto;
                display: flex;
            }

        }

        @media (max-width:1650px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:85%;
                height:100%;
                border-left: 3px solid black;
                z-index: 1;
            }
            
	           #addMemberBtn, #myPageBtn, #loginBtn, #logOutBtn, #adminHomeBtn{
					color: white;
					background-color: rgba( 255, 255, 255, 0 );
					border: none;
					float: right;
					margin-right: 5%;
					font-size: 15px;
					border : 1px solid blue;
				}
	 

            #bannerBoxLeft{
                width : 40%;
                height : auto;
                display : inline-block;
                margin-left : 10%;
                margin-right : 4%;
            }

            #bannerBoxRight{
                width : 40%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 95%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
            }
            #bottom {
                width: 1440px;
                height: auto;
                display: flex;
            }

        }

        @media (max-width:1440px){
            header {
                position:fixed;
                width: 240px;
                top: 0;
                left:83%;
                height:100%;
                border-left: 3px solid black;
                z-index: 1;
            }
            
           #addMemberBtn, #myPageBtn, #loginBtn, #logOutBtn, #adminHomeBtn{
				color: white;
				background-color: rgba( 255, 255, 255, 0 );
				border: none;
				float: right;
				margin-right: 5%;
				font-size: 15px;
				border : 1px solid pink;
			}
	 
            #left_side_text {
                max-width: 48%;
                max-height: 800px;
                /* border : 1px solid red; */
                margin-left : 3%;
            }

            /* 오른쪽 이미지 영역 전체 */
            #right_side_img {
                max-width: 48%;
                max-height: 800px;
                /* border : 1px solid blue; */
            }

            #bannerBoxLeft{
                width : 46%;
                height : auto;
                display : inline-block;
                margin-left : 3%;
                margin-right : 2%;
            }

            #bannerBoxRight{
                width : 46%;
                height : auto;
                display:inline-block;
                /* margin-right : 2%; */
            }

            #content {
                width: 80%;
                height: auto;
                /* background-color: rgb(255, 181, 181); */
            }

            #bottom {
                width: 1440px;
                height: auto;
                display: flex;
            }

        }
        
        /* 회원가입 버튼 + 모달 */

		#goaddMemberBtn {
		    border-style: none;
		    background-color: white;
		    outline: none;
		}
		
		#closeBtn {
		    border-style: none;
		    background-color: white;
		}
		
		
		.modal-header {
		    padding: 5%;
		    /* margin: auto; */
		}
		
		.modal-header img {
		    width:100px;
		    height: 100px;
		}
		
		/* .modal-body {
		    padding: 10%;
		} */
		
		.modal-content{
		    margin: 0;
		    width: 100%;
		}
		
		.modal-body input {
		    width: 100%;
		}
		
		
		#name ,#id, #pwd, #pwd2, #email, #birth, #phone {
		    border: none;
		    border-bottom: 1px solid;
		    line-height: 30px;
		    display: block;
		}
		
		label {
		    line-height: 50px;
		}
		
		#name:focus, #id:focus, #pwd:focus, #pwd2:focus, #email:focus, #birth:focus, #business_no:focus, #phone:focus {
		    outline: none;
		}
		
		.modal-body div {
		    margin-bottom: 10%;
		}
		
		.test_div {
		    color: red;
		}
		
		#agreement_label{
		    margin-right: 35%;
		}
		
		#agreement_checkbox {
		    margin-left: -118%;
		}
		
		#business_text{
		    color: darkred;
		}
		
		#business_no{
		    border: none;
		    border-bottom: 1px solid;
		    line-height: 30px;
		}
		
		a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover { color: black; text-decoration: none;}
		
		#addMemberBtn, #myPageBtn, #loginBtn, #logOutBtn, #adminHomeBtn {
			color: white;
			background-color: rgba( 255, 255, 255, 0 );
			border: none;
			float: right;
			margin-right: 5%;
			font-size: 15px;
		}
		
		#gologinBtn{
			border: none;
			background-color: white;
		}
		
		#find_id_pwd{
		    margin-right: 40%;
		}
		
		#business_no_div{
			display : none;
		}
		
		.ul-class{
			list-style:none;
		    padding: 0;
		    margin: 0;
		}
		
		.bus-li-class {
		    list-style:none;
		    color: white;
		}
		
	    /* 제휴회원 네비 css */
	    li > ul {
	    /* 평소에는 보이지 않게 */
	    opacity: 0;
	    visibility: hidden;
	
	    /* 트랜지션 */
	    transition: all 0.6s;
	}
	
		li:hover ul {
	    /* 메인 메뉴에 마우스 오버 시 서브 메뉴 보이게 */
	    opacity: 1;
	    visibility: visible;
	}
	
	#navi-menu-bus-banner:hover {
		color : red;
	}

	#navi-menu, #navi-title, p:hover, #navi-menu{
		cursor: pointer;
	}
	.newAlert{
 	 width : 28px;
 	height  : 28px; 
 	display : none;
 	/* display : inline-block; */
 	margin-right : 8px;
 	float : inherit;
 	/* float : right; */
 	
 }
 
 #naviNew{
 
	border : 1px solid black;
 	padding : 2px; 
 	border-radius : 3px;
 }
</style>
</head>
<body>

  
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
   
   <!-- 회원가입 제휴회원 버튼 js -->
   <script>
       function display() {
           var control = document.getElementById("business_no_div");    

           if (control.style.display == 'block') {
               control.style.display = 'none';
           } else {
               control.style.display = 'block';
           }
       }
   </script>
   
    <header>
            <div> 
                <!-- 1. 로그인 유저가 없을 때 -->
                <c:if test="${ empty sessionScope.loginUser }">
                <div class="navi">

                <a href="${contextPath}/user/aboutus"><img class="navi_logoimg" width="50px" height="50px" src="${ contextPath }/resources/images/image_main/logo_g.png"></img></a>

	                <br><br>
	                <p class="center" id="navi-title" onclick="location.href='${ contextPath }/main'">삼다도</p>

	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/route/m_route'">나만의 길 만들기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/tour_list'">전체 제주 관광지 보기</p>

	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/hotel_list'">제주도 필수 예약</p>
            	</div>
                
                <div>
				    <p class="right" data-bs-toggle="modal" data-bs-target="#loginModal" id="navi-menu">들어가기</p>
				    <p class="right" data-bs-toggle="modal" data-bs-target="#addUserModal" id="navi-menu">회원가입</p>

				</div>
                </c:if>
                
                <!-- 2. 로그인 유저가 있을 때(일반회원)-->
                <c:if test="${ !empty sessionScope.loginUser && loginUser.uspart eq '일반' }">
                <div class="navi">

                <a href="${contextPath}/user/aboutus"><img class="navi_logoimg" width="50px" height="50px" src="${ contextPath }/resources/images/image_main/logo_g.png"></img></a>

	                <br><br>
	                <p class="center" id="navi-title" onclick="location.href='${ contextPath }/main'">삼다도</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/route/m_route'">나만의 길 만들기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/tour_list'">전체 제주 관광지 보기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/hotel_list'">제주도 필수 예약</p>
            	</div>
                
                <div>
                <h5 class="helloName">${ loginUser.usname }님 <br> 혼저옵서예</h5> 
                <!-- <h5 class="helloName"> 혼저옵서예.</h5> -->
 					<p class="right" id="navi-menu" onclick="goToInfo();">
				    <img src="${contextPath}/resources/images/image_main/newGif.gif" class="newAlert" id="naviNew" onclick="goToInfo(${loginUser.uspart});">내 정보</p>
				    <p class="right" id="navi-menu" onclick="location.href='${ contextPath }/user/logout'">일상으로</p>
				</div>				    
                </c:if>
                
                <!-- 3. 로그인 유저가 있을 때(제휴회원) 및 로그인 유저가 관리자가 아닐 때 -->
                <c:if test="${ !empty sessionScope.loginUser && loginUser.uspart eq '제휴' && loginUser.usid ne 'samdado' }">
                <div class="navi">

                <a href="${contextPath}/user/aboutus"><img class="navi_logoimg" width="50px" height="50px" src="${ contextPath }/resources/images/image_main/logo_g.png"></img></a>

	                <br><br>
	                <p class="center" id="navi-title" onclick="location.href='${ contextPath }/main'">삼다도</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/route/m_route'">나만의 길 만들기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/tour_list'">전체 제주 관광지 보기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/hotel_list'">제주도 필수 예약</p>
	                
	                <li class="bus-li-class"><p class="center" id="navi-menu-bus">삼다도에서 사업하기</p>
		                <ul class="ul-class">                
			                <li><p class="center" id="navi-menu-bus-hotel" onclick="location.href='${ contextPath }/business/hotel_write'">호텔 등록하기</p></li>
			                <li><p class="center" id="navi-menu-bus-rent" onclick="location.href='${ contextPath }/business/rentcar_write'">렌트카 등록하기</p></li>
			                <li><p class="center" id="navi-menu-bus-restau" onclick="location.href='${ contextPath }/business/restaurant_write'">음식점 등록하기</p></li>
			                <li><p class="center" id="navi-menu-bus-attrac" onclick="location.href='${ contextPath }/business/tour_write'">관광지 등록하기</p></li>
			                <li><p class="center" id="navi-menu-bus-banner" onclick="location.href='${ contextPath }/business/bannerAd'">배너(리스팅)광고</p><li>
		                </ul>
            		</li>
            	</div>
                
                <div>
                <h5 class="helloName">${ loginUser.usname }님 <br> 혼저옵서예</h5>
					 <p class="right" id="navi-menu" onclick="location.href='${ contextPath }/mypage/buserinfo'">
		                <img src="${contextPath}/resources/images/image_main/newGif.gif" class="newAlert" id="naviNew" onclick="location.href='${contextPath}/mypage/buserinfo'">내 정보</p>
					    <p class="right" id="navi-menu" onclick="location.href='${ contextPath }/user/logout'">일상으로</p>		
                </div>
                </c:if>
               
                <!-- 4. 로그인 유저가 관리자 일때 -->
                <c:if test="${!empty sessionScope.loginUser && loginUser.uspart eq '관리자'}">    
                <div class="navi">

                <a href="${contextPath}/user/aboutus"><img class="navi_logoimg" width="50px" height="50px" src="${ contextPath }/resources/images/image_main/logo_g.png"></img></a>

	                <br><br>
	                <p class="center" id="navi-title" onclick="location.href='${ contextPath }/main'">삼다도</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/route/m_route'">나만의 길 만들기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/tour_list'">전체 제주 관광지 보기</p>
	                <p class="center" id="navi-menu" onclick="location.href='${ contextPath }/business/hotel_list'">제주도 필수 예약</p>
            	</div>
                
                <div>
                <h5 class="helloName">${ loginUser.usname }님 <br> 혼저옵서예</h5> 
                    
				    <p class="right" id="navi-menu" onclick="location.href='${ contextPath }/admin/home'">관리자 홈</p>
				    <p class="right" id="navi-menu" onclick="location.href='${ contextPath }/user/logout'">일상으로</p>

				</div>			    
                </c:if>
            </div>
        </header>
    
    <!-- 회원가입 Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
           <div class="addMember-modal-inner-header" style="display: flex; margin: auto;">
		            <div class="col-5"><img src="${ contextPath }/resources/images/image_main/logo_g.png"></div>
		            <div class="col-8" style="margin-top: 10%;"><h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2></div>
	            </div>
            </div>
            
           <form action="${ contextPath }/user/join" method="post" id="joinForm" onsubmit="return joinValidate();">
             <div class="addMember-modal-inner-body" style="width: 80%;  margin: auto;">
	             <div class="modal-body">
	                <!--이름-->
		                <div class="name_div">
		                    <label for="id">* 이름</label>
		                    <label id="test_name_label" class="test_div"></label>
		                    <input type="text" id="name" name="usname" placeholder="홍길동" required>
		                </div>
		                <!--아이디-->
		                <div class="id_div">
		                    <label for="id">* 아이디</label>
		                    <label id="test_id_label" class="test_div"></label>
		                    <input type="text" id="id" name="usid" placeholder="영어숫자포함" required>
		                </div>	
		                <!--비밀번호-->
		                <div class="pwd_div">
		                    <label for="pwd">* 비밀번호</label>
		                    <label id="test_pwd_label" class="test_div"></label>
		                    <input type="password" id="pwd" name="uspwd" placeholder="대소문자 포함 8글자 이상" required>
		                </div>
		                <!--비밀번호 확인-->
		                <div class="pwd_div2">
		                    <label for="pwd2">* 비밀번호 확인</label>
		                    <label id="test_pwd2_label" class="test_div"></label>
		                    <input type="password" id="pwd2" name="uspwd2" placeholder="비밀번호 확인" required>
		                </div>
		                <!--이메일-->
		                <div class="email_div">
		                    <label for="email">* 이메일</label>
		                    <label id="test_email_label" class="test_div"></label>
		                    <input type="email" id="email" name="usemail" placeholder="you@example.com" required>
		                </div>
		                <!--생년월일-->
		                <div class="birth_div">
		                    <label for="birth">* 생년월일</label>
		                    <label id="test_birth_label" class="test_div"></label>
		                    <input type="date" id="birth" max="9999-12-31" name="usbirth" placeholder="1994-09-28" required>
		                </div>
		                <!--생년월일-->
		                <div class="phone_div">
		                    <label for="phone">* 휴대전화</label>
		                    <label id="test_phone_label" class="test_div"></label>
		                    <input type="text" id="phone" name="usphone" placeholder="01012345678" required>
		                </div>
		                <!--사업자등록번호-->
		                <a href="javascript:display();"><h5 id="business_text"><b>&gt;&gt; 제휴회원 이세요?</b></h5></a>
		                <div id="business_no_div">
		                    <label for="business_no">* 사업자등록번호</label>
		                    <label id="test_business_no_label" class="test_div"></label>
		                    <input type="text" id="business_no" name="busno" placeholder="000-00-00000">
		                </div>            
			            </div>
		            </div>
		            <div class="modal-footer">
		                <label><input type="checkbox" name="agreement" id="agreement_checkbox" value="개인정보수집동의" required>개인정보수집 동의</label>
		                <input type="submit" id="goaddMemberBtn" value="가입하기">
		                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
		            </div>
		         </form>
	        </div>
        </div>	
    </div>
    
     <!-- 로그인 Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               <div class="login-modal-inner-header" style="display: flex; margin: auto;">
           		   <div class="col-5"><img src="${ contextPath }/resources/images/image_main/logo_g.png"></div>
		            <div class="col-8" style="margin-top: 10%;"><h2 class="modal-title" id="exampleModalLabel">혼저옵서예.</h2></div>
                </div>
            </div>
           
             <form action="${ contextPath }/user/login" method="post" id="loginForm"> 
	            <div class="login-modal-inner-body" style="width: 80%;  margin: auto;"> 
		            <div class="modal-body">
		                <!--아이디-->
		                <div class="id_div">
		                    <label for="id">* 아이디</label>
		                    <label id="test_id_label" class="test_div"></label>
		                    <input type="text" id="id" name="usid" placeholder="영소문자로 시작하는 4~16글자 입력(숫자 포함 가능)" required>
		                </div>
		                <!--비밀번호-->
		                <div class="pwd_div">
		                    <label for="pwd">* 비밀번호</label>
		                    <label id="test_pwd_label" class="test_div"></label>
		                    <input type="password" id="pwd" name="uspwd" placeholder="영어대소문자/숫자/특수문자를 포함한 8~16자" required>
		                </div> 
		
		                <br><br>
		
		                <!--간편 로그인-->
		                <div class="easy_login_div">
		                    <label for="pwd">간편 로그인</label> <br>
		                    <div class="easy_login_imgs">
		                        <div class="container">
		                            <div class="row">
		                            <div class="col-sm">
		                                <a href="#"><img src="${ contextPath }/resources/images/image_user/google.png" id="google_img" alt="">  구글</a>
		                            </div>
		                              <div class="col-sm">
		                               <a href="#"><img src="${ contextPath }/resources/images/image_user/naver.png" alt=""> 네이버</a>
		                              </div>
		                              <div class="col-sm">
		                                <a href="#"><img src="${ contextPath }/resources/images/image_user/kakao.png" alt=""> 카카오</a>
		                              </div>
		                            </div>
		                          </div>
		                    </div>
		                </div> 
		            </div>
	            </div>
	            <div class="modal-footer">
	                <a href="${ contextPath }/user/find" id="find_id_pwd">아이디/비밀번호 찾기</a> <!-- 새 창 띄우기-->
	
	                <input type="submit" id="gologinBtn" value="로그인">
	                <button type="button" id="closeBtn" data-bs-dismiss="modal">닫기</button>
	            </div>
	         </form>   
        </div>
        </div>
    </div>
    
     <!-- 회원가입 제출 전 유효성검사 -->
	<script>
		function joinValidate(){
			
			// 이름 유효성검사
			if(!(/^[가-힣]{2,5}$/).test($("#name").val())){
				alert('이름은 한글로 2~5글자 사이만 가능합니다.');
				$("#name").select();
				return false;
			}
			
            // 아이디 유효성검사
			if(!(/^[a-z][a-z0-9]{3,15}$/.test($("#id").val()))){
				alert('영소문자로 시작하는 4~16글자 입력(숫자 포함 가능)');
				$("#id").select();		
				return false;
			}
            // 아이디 중복검사
			if(/중복 아이디로 사용할 수 없습니다./.test($("#test_id_label").text())){
				console.log($("#test_id_label").text());
				alert('중복된 아이디입니다.');
				$("#id").select();
				return false;
			}

			// 비밀번호 유효성검사
			if(!(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/.test($("#pwd").val()))){
				alert('영어대소문자/숫자/특수문자를 포함한 8~16자리 입력');
				$("#pwd").select();
				return false;
			}
			
            // 비밀번호일치 검사
			if($("#pwd2").val() != $("#pwd").val()){
				alert('비밀번호가 일치하지 않습니다.');
				$("#pwd2").select();
				return false;
			}
			
			var date = new Date;
			var inputbirth = new Date($("#birth").val());
			
            // 생년월일 형식 검사
			if(inputbirth > date){
				alert('생년월일을 정확하게 입력하세요.');
				$("#birth").select();
				return false;
			}
			
			// 이메일 유효성검사
			if(!((/^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test($("#email").val()))){
				alert('이메일주소를 확인해주세요.');
				$("#email").select();
				return false;
			}
			
			// 이메일 중복검사
			if(/중복된 이메일로 사용할 수 없습니다./.test($("#test_email_label").text())){
				console.log($("#test_email_label").text());
				alert('중복된 이메일입니다.');
				$("#email").select();
				return false;
			}
			
			// 전화번호 유효성검사
			if(!(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/).test($("#phone").val())){
				alert('전화번호를 확인해주세요.');
				$("#phone").select();
				return false;
			}
			
			// 전화번호 중복검사
			if(/중복 휴대전화로 사용할 수 없습니다./.test($("#test_phone_label").text())){
				console.log($("#test_phone_label").text());
				alert('중복된 전화번호입니다.');
				$("#phone").select();
				return false;
			}
			
			// 사업자등록번호 유효성검사
			var bizNum = $("#business_no").val();
			if(bizNum != "" && !(/\d{3}[-]\d{2}[-]\d{5}/).test(bizNum)){
				alert('사업자등록번호를 확인해주세요.');
				$("#business_no").select();
				return false;
			}

			return true;
		}
	
	</script>
    
    
    <!-- 회원가입폼 유효성검사 -->
    <script>
    	$("#name").change(function () {
            var regname = /^[가-힣]{2,5}$/;
            
            if (regname.test($(this).val())) {
                $("#test_name_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_name_label").html("올바른 입력이 아닙니다.").css("color", "red");
            }
        });
    	
    	$("#id").change(function () {
			var idVal = $("#id").val(); // 사용자가 입력한 id 값 추출
			
			var regengid = /^[a-z](?=.*\d)[a-z0-9]{3,15}$/; // 영어로시작, 영, 숫 4~16글자
            //console.log(idVal);
            
            if (regengid.test(idVal)) {
                $("#test_id_label").html("올바른 입력입니다.").css("color", "green");
               	$.ajax({
       				url: "${ contextPath }/user/idCheck",
       				data: { usid : idVal }, // 키(vo 필드명 동일) : 밸류
       				type: "post",
       			}).done(function(data){
       				console.log(data);
       				if (data == "fail") {  // 중복일때
       					console.log("아이디 중복!");
   						$("#test_id_label").html("중복 아이디로 사용할 수 없습니다.").css("color", "red");
       				} else { // 중복이 아닐때
       					console.log("아이디 사용가능!");
   						$("#test_id_label").html("사용할 수 있는 아이디입니다.").css("color", "green");
       				}
       			}).fail(function(){
       				console.log("ajax response fail..");
       			}).always(function(){
       				console.log("always is done..!");
       			});
            } else {
                $("#test_id_label").html("아이디를 다시 입력해주세요.").css("color", "red");
            }
  
        });
    	
    	$("#phone").change(function () {
			var phoneVal = $("#phone").val();
			var regphone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})?[0-9]{3,4}?[0-9]{4}$/;

            if (regphone.test(phoneVal)) {
                $("#test_phone_label").html("올바른 입력입니다.").css("color", "green");
               	$.ajax({
       				url: "${ contextPath }/user/phoneCheck",
       				data: { usphone : phoneVal },
       				type: "post",
       			}).done(function(data){
       				console.log(data);
       				if (data == "fail") {  // 중복일때
       					console.log("휴대전화 중복!");
   						$("#test_phone_label").html("중복 휴대전화로 사용할 수 없습니다.").css("color", "red");
       				} else { // 중복이 아닐때
       					console.log("휴대전화 사용가능!");
   						$("#test_phone_label").html("사용할 수 있는 휴대전화입니다.").css("color", "green");
       				}
       			}).fail(function(){
       				console.log("ajax response fail..");
       			}).always(function(){
       				console.log("always is done..!");
       			});
            } else {
                $("#test_phone_label").html("휴대전화를 다시 입력해주세요.").css("color", "red");
            }
  
        });
    	    
       $("#email").change(function () {
    	   var emailVal = $("#email").val();
           var regemail = /^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

           if (regemail.test(emailVal)) {
                $("#test_email_label").html("올바른 입력입니다.").css("color", "green");
              	$.ajax({
      				url: "${ contextPath }/user/emailCheck",
      				data: { usemail : emailVal },
      				type: "post",
      			}).done(function(data){
      				console.log(data);
      				if (data == "fail") {  // 중복일때
      					console.log("이메일 중복!");
  						$("#test_email_label").html("중복된 이메일로 사용할 수 없습니다.").css("color", "red");
      				} else { // 중복이 아닐때
      					console.log("이메일 사용가능!");
  						$("#test_email_label").html("사용할 수 있는 이메일입니다.").css("color", "green");
      				}
      			}).fail(function(){
      				console.log("ajax response fail..");
      			}).always(function(){
      				console.log("always is done..!");
      			});
           } else {
               $("#test_email_label").html("이메일을 다시 입력해주세요.").css("color", "red");
           }
 
       });
    	
    	$("#birth").change(function () {
            var date = new Date;
            var inputbirth = new Date($("#birth").val());

            if (inputbirth < date) {
                $("#test_birth_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_birth_label").html("올바른 형식이 아닙니다.").css("color", "red");
            }
        });

    	
    	$("#pwd").change(function () { 
            var regpwd = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/;
            if (!regpwd.test($(this).val())) {
                $("#test_pwd_label").html("영어대소문자/숫자/특수문자를 포함한 8~16자").css("color", "red");
            } else {
                $("#test_pwd_label").html("사용 가능한 비밀번호입니다.").css("color", "green");
            }
            
        });

        $("#pwd2").change(function () {
            if ($("#pwd2").val() != $("#pwd").val()) {
                $("#test_pwd2_label").html("비밀번호가 일치하지 않습니다.").css("color", "red");
            } else {
                $("#test_pwd2_label").html("비밀번호가 일치합니다.").css("color", "green");
            }
        });
        
        $("#business_no").change(function () {
            var busnoval = $("#business_no").val();
            var regbusno = /\d{3}[-]\d{2}[-]\d{5}/; // 258-41-00747 형식 
            if (regbusno.test(busnoval)) {
                $("#test_business_no_label").html("올바른 입력입니다.").css("color", "green");
            } else {
                $("#test_business_no_label").html("올바른 형식이 아닙니다.").css("color", "red");
            }
        });
	
    </script>
     <script>
	 	$(document).ready(function(){

	 		if('${loginUser.usid}' != ''){
	 			var searchU = new Object();
					searchU.usno = "${loginUser.usno}";
					searchU.uspart = "${loginUser.uspart}";
					
	 			$.ajax({
	 				url : "${contextPath}/mypage/new",
	 				data : JSON.stringify(searchU),
	 				type : "post",
	 				contentType : "application/json; charset=utf-8",
	 				success : function(data){
	 					if(data > 0){
	 						$('.newAlert').css("display","block");
	 						$('.newAlert').css("display","inline-block");
	 						$('.newAlert').css("margin-bottom","5px;");
	 					} else{
	 						alert("세션확인 오류!");
	 					}
	 				},
	 				error : function(e){
	 					alert("세션확인 오류2!"+ "error code : " + e.status + "\n"
									+ "message : " + e.responseText);
	 				}
	 			});
	 		}
	 		
	 	});
	 </script>
	 
	 <script>
	 	function goToInfo(uspart){
	 		var uspart = "일반";
	 		location.href="${contextPath}/mypage/userinfo?usno="+${loginUser.usno} + "&uspart=" + uspart;
	 	}
	 	
	 	function aboutUs(){
			location.href='${contextPath}/user/aboutus';

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