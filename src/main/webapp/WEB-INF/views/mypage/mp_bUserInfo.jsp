<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage_info(b)</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

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
        height: fit-content;
        margin-top : 5%;
        margin-left : 3%;
    }

    #leftBox{
        width: 100%;
        /* border-right : thick double white; */
        display : inline-block;
    }

    #memInfoTable{
        width : 90%;
        margin-left : 5%;
        margin-top : 1.5%;
        /* border : 1px solid red; */
    }

   #memInfoTable td, #memInfoTable tr{
        border-bottom : 1px solid lightgray; 
        border-collapse: collapse;
        padding : 15px;
        padding-top : 15px;
        padding-bottom: 15px;
   }

   #memInfoTable th{
        width : 160px;
        text-align: right;
        font-size: small;
        border-right : 1px solid lightgray;
        border-bottom : 1px solid lightgray;
        padding : 15px;
        margin-left : 5%;
   }

    #changePwdBtn, #memOut, #changeInfo{
        background-color: #467355;
        border-style: none;
        color : white;
        padding : 5px;
    }

    #specificCon{
        font-size: small;
    }

	.chInfoTag{
    	with : 1000px;
    	font-size : small;
    }

	#modal {
	  position:relative;
	  width:100%;
	  height:100%;
	  z-index:1;
	  border : 1px solid rgba(0, 0, 0, 0);
	  margin : auto;
	  align-items : center;
	  /* text-align : center; */
	  display : none;
	}

	#modal button, #modal_submit_btn {
	  display:inline-block;
	  width:60px;
	  margin-left:3%;
	  float : right;
	  background-color : #467355;
	  color : white;
	  border-style : none;
	}
	
	#modal .modal_content {
	  width:430px;
	  height :530px;
	  /* margin:100px auto; */
	  margin-left : 30%;
	  margin-top : 10%;
	  padding:20px 10px;
	  background:#fff;
	  /* border : 1px solid yellow; */
	}
	
	#modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	  /* border : 1px solid red; */
	} 
	
	#test_uspwd_label{
		font-size : small;
	}
	
	#forMargin{
		margin-bottom : 0;
	}
	
	#reddot{
		position: absolute;
	    top: 13%;
	    left: 27%;
	    width : 30px;
	    height : 30px;
	}
</style>
</head>
<body>

    <div id="back">
        <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
        <section class="page-start">
            <div id="topMenu">
                <div class="menuBox" id="menuBox">

                    <button class="clickedBtn" id="myInfo" onclick="location.href='${ contextPath }/mypage/buserinfo'"> <div class="menuBoxEle" ><br><img src="../resources/images/image_mp/mp_userW.png" class="btnImg"> <br> 내 정보</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToAlert();"> <div class="menuBoxEle" ><br><img src="../resources/images/image_mp/bellB.png" class="btnImg"> <br> 내 소식</div></button>
                    <img src="${contextPath}/resources/images/image_mp/dot_r.png" class="newAlert" id="reddot">
                    <button class="menuButton" id="myInfo" onclick="goToBuss();"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/storeB.png" class="btnImg"> <br> 내 사업장</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToAdvert();"> <div class="menuBoxEle" onclick="goToAdvert();"><br><img src="../resources/images/image_mp/adverB.png" class="btnImg"> <br> 광고관리</div></button>
                    <button class="menuButton" id="myInfo" onclick="goToPoint();"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 포인트</div></button>
                    <button class="menuButton" id="myInfo" onclick="location.href='${ contextPath }/mypage/gotoqna'"> <div class="menuBoxEle"><br><img src="../resources/images/image_mp/qnaB.png" class="btnImg"> <br> 문의하기</div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="leftBox">
                    <table id="memInfoTable">
                        <tr>
                            <th>이름, 아이디</th>
                            <td colspan="3">${ loginUser.usname }<br>${ loginUser.usid }</td>
                        </tr>
                        <tr>
                            <th>비밀번호 수정</th>
                            <td colspan="3" > <button type="button" id="changePwdBtn" onclick="">비밀번호 수정하기</button></td>
                        </tr>
                        <tr>
	                            <th>이메일, 전화번호 수정</th>
	                            <td>이메일 <input type="text" class="chInfoTag" id="newEmail" name="email" value="${ loginUser.usemail }">
	                                </td>
	                            <td>전화번호 <input type="text" class="chInfoTag" id="newPhone" name="phone" value="${ loginUser.usphone }">
	                                <input type="hidden" name="usid" id="usid" value="${ loginUser.usid }"></td>
	                            <td><button id="changeInfo" onclick="goToChange();">수정하기</button></td>
                        </tr>
                         <tr>
                            <th >회원 탈퇴</th>
                            <td colspan="3">
                            <form action="${contextPath}/mypage/userout" method="post">
                            <p id="specificCon">회원 탈퇴 시 저장되어 있는 회원 정보는 3개월간 보관 후 영구적으로 삭제됩니다. <br>
                                3개월 이내에는 복구가 가능하며 관리자에게 문의주세요.<br>
                                삭제시 모든 예약 정보, 길 정보를 찾을 수 없습니다.<br>
                                탈퇴를 원하시면 아래 동의 후 비밀번호 확인을 통해 탈퇴하실 수 있습니다.<br></p>
                                <input type="checkbox" name="check" value="위의 안내사항에 대해 동의합니다.">위의 안내사항에 대해 동의합니다.<br>
                                <label style="font-size: small;">비밀번호 확인 :</label>
                                <input type="password" id="uspwd" name="uspwd">
                                <input type="hidden" id="usno" name="usno" value="${loginUser.usno }">
                                <input type="hidden" id="uspart" name="uspart" value="${loginUser.uspart}">
                                <input type="hidden" id="usid" name="usid" value="${loginUser.usid}">
                                <button id="memOut" type="submit">탈퇴</button></form></td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </section>
    </div>
    
     <div id="modal">
            	<div class="modal_content">
				
					 <div>
                    <h4>- 비밀번호 재설정</h4>

                    <form action="${ contextPath }/mypage/updateBupwd" method="POST" onsubmit="return submitValidate();">
                      <div class="row g-3">
						<input type="hidden" name="uspart" id="uspart" value="${loginUser.uspart }">
                        <div class="col-12">
                            <label for="_id" class="form-label">현재 비밀변호 </label>
                            <input type="password" class="form-control" id="checkPwd" name="currentPwd" required>                           
                        </div>
                        
                        <div class="col-12">
                            <label for="_pwd" class="form-label" id="forMargin">수정할 비밀번호</label>
                            <label id="test_uspwd_label" class="test_div"></label>
                            <input type="password" class="form-control" name="newPwd" id="uspwdnew" placeholder="영어대소문자/숫자/특수문자를 포함한 8~16자" required>                           
                        </div>
                        
                        <div class="col-12">
                            <label for="_pwd" class="form-label">비밀번호 확인</label>
                            <label id="test_uspwd2_label" class="test_div"></label>
                            <input type="password" class="form-control" name="newPwd2" id="uspwdnew2" placeholder="비밀번호 확인" required>                           
                        </div>
                                    
                      </div>
                      <input type="hidden" name="usid" id="usid" value="${ loginUser.usid }">
                      <input type="hidden" name="usname" id="usname" value="${ loginUser.usname }">
            		  <div id="buttonBoxes">
	                      <hr class="my-4">
	                      <button type="submit" id="modal_submit_btn" class="chButtons">확인</button>
	            		  <button type="button" id="modal_close_btn" class="chButtons">취소</button>
            		  </div>
                    </form>
                  </div>
				</div>
						   
				<div class="modal_layer"></div>
			</div>
			
	<script>
		$("#changePwdBtn").click(function(){
			console.log("기능 들어오는지 확인");
		   $("#modal").fadeIn();
		});
		   
		$("#modal_close_btn").click(function(){
		   $("#modal").fadeOut();
		});      
	</script>     
    
    <!-- 비밀번호 유효성검사 -->

    <script>
	    $("#uspwdnew").keyup(function () { 
	    	/* console.log("이거 맞나염?"); */
	        var regpwd = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/;
	        if (!regpwd.test($(this).val())) {
	            $("#test_uspwd_label").html("영어대소문자/숫자/특수문자를 포함한 8~16자").css("color", "red");
	        } else {
	            $("#test_uspwd_label").html("사용 가능한 비밀번호입니다.").css("color", "green");
	        }
	        
	    });
	
	    $("#uspwdnew2").keyup(function () {
	    	/* console.log("이벤트 확인 돼랏!"); */
	        if ($("#uspwdnew2").val() != $("#uspwdnew").val()) {
	            $("#test_uspwd2_label").html("비밀번호가 일치하지 않습니다.").css("color", "red");
	        } else {
	            $("#test_uspwd2_label").html("비밀번호가 일치합니다.").css("color", "green");
	        }
	    });
    </script>
    
    <script>
	function goToPoint(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/point?usno='+${loginUser.usno};
	};
	
	function goToBuss(){
		location.href='${contextPath}/mypage/buss?usno='+${loginUser.usno};
	}
	
	function goToAdvert(){
		location.href='${contextPath}/mypage/advert?usno='+${loginUser.usno};
	}
	
	function goToAlert(){
		var uspart = "제휴";
		location.href="${contextPath}/mypage/alert?usno="+${loginUser.usno} +"&uspart=" + uspart;
	}
	
	function goToChange(){
		var uspart = "제휴";
		var usid=$('#usid').val();
		var usemail = document.getElementById('newEmail').value;
		/* var usemail=$('#email').val(); */
		var usphone=$('#newPhone').val();
		
		/* console.log(uspart);
		console.log(usid);
		console.log(usemail);
		console.log(usphone);  */
		
		location.href="${contextPath}/mypage/updatebuInfo?usno=" + ${loginUser.usno} + "&uspart" + uspart + "&usid=" + usid + "&usemail=" + usemail + "&usphone=" + usphone;
	}
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
 <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>