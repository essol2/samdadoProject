<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserInfo</title>
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
        background-image: url('${contextPath}/resources/images/image_mp/backgroundImg.png');
        background-size: 100%;
    }
    #topMenu{
      align-items: center;
      width : 98%;
      height : 150px;
      /* border : 1px solid black; */
      position : absolute;
    }
    #countDday{
        /* border : 1px solid pink; */
        display : inline-block;
        position : relative;
        left : 3%;
        width : 15%;
        height : 150px;
        color : white;
        text-align : center;
        font-size: 30px;
        margin-left : 3%;
        margin-top : 3%;
    }
    .menuBox{
        width : 55%;
        height : 150px;
       /*  border : 1px solid blue;  */
        display : inline-block;
        position:relative;
        top : -60%;
        left : 3%;
        margin-left : 3%;
        /* margin-top : 1.5%; */
        align-items: center;
    }
    .menuButton{
        width : 140px;
        height : 130px;
        border : 1px solid white;
        background-color: white;
        color : #bfbfbf;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 1%;
        border-radius: 2px;
        align-items: center;
        /* -webkit-transition-duration : 0.4s;
        transition-duration: 0.4s; */
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
        margin-left : 5%;
        padding : 0;
    }

    .btnImg{
        width: 60px;
        height : 60px;
       /*  border : 1px solid yellow; */
    }

    .clickedBtn{
        box-shadow: 3px 3px gray;
        width : 140px;
        height : 130px;
        border : 1px solid #467355;
        background-color:#467355;
        color : white;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 1%;
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
        top : 30%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : 500px;
    }

    #leftBox{
        width: 60%;
        border-right : thick double white;
        display : inline-block;
    }

    #rightBox{
        width : 38.5%;
        /* border : 1px solid red; */
        display : inline-block;
        position : relative;
        top : -450px;
    }

    #memInfoTable{
        margin : 3px;
        width : 99%;
    }

   #memInfoTable td, #memInfoTable tr{
        border-bottom : 1px solid lightgray; 
        border-collapse: collapse;
        padding : 10px;
        padding-top : 24px;
        padding-bottom: 24px;
   }

   #memInfoTable th{
        text-align: right;
        font-size: small;
        border-right : 1px solid lightgray;
        border-bottom : 1px solid lightgray;
        padding : 10px;
        width : 160px;
   }

    #changePwdBtn, #memOut, #changeInfo{
        background-color: #467355;
        border-style: none;
        color : white;
        padding : 5px;
        cursor : pointer;
    }

    #specificCon{
        font-size: x-small;
    }

    #alertTable td{
        border-top : 1px solid lightgray;
        border-bottom : 1px solid lightgray;
        padding : 3px;
        padding-top : 10px;
        padding-bottom: 10px;
        font-size: 14px;
    }
    
    .chInfoTag{
    	with : 400px;
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
	  height :500px;
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
	
    @media (max-width:1650px){
         /* 마이페이지 css */
            body{
                background-image: url('../resources/images/image_mp/backgroundImg.png');
                background-size: 100%;
            }
            #topMenu{
                align-items: center;
                width : 80%;
                height : 150px;
                /* border : 1px solid black; */
            }
            #countDday{
                /* border : 1px solid pink; */
                display : inline-block;
                position : absolute;
                width : 20%;
                height : 150px;
                color : white;
                text-align : center;
                font-size: 30px;
                margin-left : 3%;
            }
            .menuBox{
                width : 70%;
                height : 150px;
                /* border : 1px solid blue; */
                display : inline-block;
                position:relative;
                top : 0;
                left : 25%;
                margin-left :3%;
                align-items: center;
            }
            .menuButton{
                width : 120px;
                height : 110px;
                border : 1px solid white;
                background-color: white;
                color : #bfbfbf;
                text-align : center;
                display : inline-block;
                margin-top : 2%;
                margin-left : 2%;
                border-radius: 2px;
                align-items: center;
                /* -webkit-transition-duration : 0.4s;
                transition-duration: 0.4s; */
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
                margin-left : 5%;
                margin-top : 1%;
                margin-bottom : 5%;
            }

            .btnImg{
                width: 60px;
                height : 60px;
                /* border : 1px solid yellow; */
            }

            .clickedBtn{
                box-shadow: 3px 3px gray;
                width : 120px;
                height : 130px;
                border : 1px solid #467355;
                background-color:#467355;
                color : white;
                text-align : center;
                display : inline-block;
                margin-top : 2%;
                margin-left : 2%;
                border-radius: 2px;
                align-items: center;
            }

            .clickedBtn:hover{
                box-shadow: 6px 6px gray;
                cursor: pointer;
            }

        }
</style>

</head>
<body>
 <div id="back">
 	   <!-- navi.jsp include -->
       <jsp:include page="../common/navi.jsp"/>
        
        <section class="page-start">
            <div id="topMenu">
                <div id="countDday"> <p>${ loginUser.usname }님의 <br> 여행까지 <br>D-100</p> </div>
                <div class="menuBox" id="menuBox">

                    <button class="clickedBtn" id="myInfo"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userW.png" class="btnImg"> <br> 내 정보<br> <br></div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록<br><br> </div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingB.png" class="btnImg"> <br> 내 예약<br> <br></div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행<br> <br></div></button>
                    <button class="menuButton" id="myInfo"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑<br><br></div></button>

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
							<form action="${ contextPath }/mypage/updateInfo" method="POST" onsubmit="return submitValidate();">
	                            <th>이메일, 전화번호 수정</th>
	                            <td>이메일 <input type="text" class="chInfoTag" id="email" name="email" value="${ loginUser.usemail }">
	                                </td>
	                            <td>전화번호 <input type="text" class="chInfoTag" id="phone" name="phone" value="${ loginUser.usphone }">
	                                <input type="hidden" name="usid" id="usid" value="${ loginUser.usid }"></td>
	                            <td><button id="changeInfo" type="submit">수정하기</button></td>
                        	</form>
                        </tr>
                        <tr>
                            <th >회원 탈퇴</th>
                            <td colspan="3"><p id="specificCon">회원 탈퇴 시 저장되어 있는 회원 정보는 3개월간 보관 후 영구적으로 삭제됩니다. <br>
                                3개월 이내에는 복구가 가능하며 관리자에게 문의주세요.<br>
                                삭제시 모든 예약 정보, 길 정보를 찾을 수 없습니다.<br>
                                탈퇴를 원하시면 아래 동의 후 비밀번호 확인을 통해 탈퇴하실 수 있습니다.<br></p>
                                <input type="checkbox" name="check" value="위의 안내사항에 대해 동의합니다.">위의 안내사항에 대해 동의합니다.<br>
                                <label style="font-size: small;">비밀번호 확인 :</label>
                                <input type="password" id="checkPwd" name="checkPwd">
                                <button id="memOut">탈퇴</button></td>
                        </tr>
                    </table>
                </div>
                <div id="rightBox">
                    <div id="alertBox">
                        <h2>&nbsp알림</h2>
                        <table id="alertTable"> 
                            <tr>
                                <td>1. </td>
                                <td>사용자님께서 커뮤니티에 작성하신 글에대한 신고가 접수되었습니다.</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
            <div id="modal">
            	<div class="modal_content">
					<%-- <h2 style="color:#467355;">비밀번호 수정</h2>
					<hr style="color : #467355;">
					<form action="${ contextPath }/mypage/updatepwd" method="post" onsubmit="return submitValidate();">
						<div id="chPwdArea">
						<table>
							<tr>
								<td> 현재 비밀번호 </td>
								<td>&nbsp&nbsp<input type="password" id="checkPwd" name="currentPwd"></td>
							</tr>
							<tr>
								<td> 새로운 비밀번호 </td>
								<label id="test_pwd_label" class="test_div"></label>
								<td>&nbsp&nbsp<input type="password" id="uspwd" name="newPwd" placeholder="대소문자 포함 8글자 이상" required><br></td>
							</tr>
							<tr>
								<td> 새로운 비밀번호 확인 </td>
								<label id="test_pwd2_label" class="test_div"></label>
								<td>&nbsp&nbsp<input type="password" id="uspwd2" name="newPwd2" placeholder="대소문자 포함 8글자 이상" required><br></td>
							</tr>
							<tr>
								<td colspan="2">&nbsp</td>
							</tr>
							<tr>
							<td>&nbsp</td>
							<td style="padding-left : 7%"><button type="button" id="modal_close_btn" class="chButtons">취소</button>  
							<input type="submit" id="modal_submit_btn" class="chButtons" value="확인">   </td>
							</tr>
						</table>
							
						</div>
						
					</form> --%>
					 <div>
                    <h4>- 비밀번호 재설정</h4>

                    <form action="${ contextPath }/mypage/updatepwd" method="POST" onsubmit="return submitValidate();">
                      <div class="row g-3">

                        <div class="col-12">
                            <label for="_id" class="form-label">현재 비밀변호 </label>
                            <input type="password" class="form-control" id="checkPwd" name="currentPwd" required>                           
                        </div>
                        
                        <div class="col-12">
                            <label for="_pwd" class="form-label">수정할 비밀번호</label>
                            <label id="test_pwd_label" class="test_div"></label>
                            <input type="password" class="form-control" name="newPwd" id="uspwd" placeholder="영어대소문자/숫자/특수문자를 포함한 8~16자" required>                           
                        </div>
                        
                        <div class="col-12">
                            <label for="_pwd" class="form-label">비밀번호 확인</label>
                            <label id="test_pwd2_label" class="test_div"></label>
                            <input type="password" class="form-control" name="newPwd2" id="uspwd2" placeholder="비밀번호 확인" required>                           
                        </div>
                                    
                      </div>
                      <input type="hidden" name="usid" id="usid" value="${ loginUser.usid }">
                      <input type="hidden" name="usname" id="usname" value="${ loginUser.usname }">
            
                      <hr class="my-4">
                      <button type="submit" id="modal_submit_btn" class="chButtons">확인</button>
            		  <button type="button" id="modal_close_btn" class="chButtons">취소</button>
                    </form>
                  </div>
				</div>
						   
				<div class="modal_layer"></div>
			</div>
	<script>
		$("#changePwdBtn").click(function(){
		   $("#modal").fadeIn();
		});
		   
		$("#modal_close_btn").click(function(){
		   $("#modal").fadeOut();
		});      
	</script>     
    
    <!-- 비밀번호 유효성검사 -->
    <script>
	 	// 비밀번호 유효성검사
		if(!(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/.test($("#uspwd").val()))){
			alert('영어대소문자/숫자/특수문자를 포함한 8~16자리 입력');
			$("#uspwd").select();
			return false;
		}
		
	    // 비밀번호일치 검사
		if($("#uspwd2").val() != $("#uspwd").val()){
			alert('비밀번호가 일치하지 않습니다.');
			$("#uspwd2").select();
			return false;
		}
		
    </script>
    <script>
	    $("#uspwd").change(function () { 
	        var regpwd = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/;
	        if (!regpwd.test($(this).val())) {
	            $("#test_pwd_label").html("영어대소문자/숫자/특수문자를 포함한 8~16자").css("color", "red");
	        } else {
	            $("#test_pwd_label").html("사용 가능한 비밀번호입니다.").css("color", "green");
	        }
	        
	    });
	
	    $("#uspwd2").change(function () {
	        if ($("#pwd2").val() != $("#uspwdf").val()) {
	            $("#test_pwd2_label").html("비밀번호가 일치하지 않습니다.").css("color", "red");
	        } else {
	            $("#test_pwd2_label").html("비밀번호가 일치합니다.").css("color", "green");
	        }
	    });
    </script>
    
     <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
      
</body>
</html>