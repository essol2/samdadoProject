<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<title>UserInfo</title>
	<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <link rel="icon" type="image/png" sizes="16x16" href="${contextPath }/resources/images/image_main/logo_g.png">

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
        margin-left : 4%;
        margin-top : 5%;
    }
    .menuBox{
        width : 55%;
        height : 150px;
       /*  border : 1px solid blue; */
        display : inline-block;
        position:relative;
        top : -60%;
        left : 3%;
        margin-left : 3%;
        /* margin-top : 1.5%; */
        align-items: center;
    }
    .menuButton{
        width : 155px;
        height : 140px;
        border : 1px solid white;
        background-color: white;
        color : #bfbfbf;
        text-align : center;
        display : inline-block;
        margin-top : 2%;
        margin-left : 2%;
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
        margin-left : 11%;
        padding : 0;
    }

    .btnImg{
        width: 60px;
        height : 60px;
      /*  border : 1px solid yellow; */
    }

    .clickedBtn{
        box-shadow: 3px 3px gray;
        width : 155px;
        height : 140px;
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
    /* mainBox */
    #mainBox{
        position : absolute;
        top : 30%;
        left : 3%;
        background-color:rgba( 255, 255, 255, 0.8 );
        border : 5px solid white;
        width : 77%;
        height : 500px;
        display : flex;
    }

    #leftBox{
        width: 60%;
        border-right : thick double white;
        display : inline-block;
        order : 1;
    }

    #rightBox{
        width : 38.5%;
        /* border : 1px solid red; */
        display : inline-block;
        order : 2;
        height : 450px;
        margin : 20px;
        overflow : auto;
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
    
    #alertTable{
    	width : 100%;
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
	
	 .modal {
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

	.modal button{
	  display:inline-block;
	  width:120px;
	  height : 60px;
	  margin-left:2%;
	  float : right;
	  background-color : #467355;
	  color : white;
	  border-style : none;
	  
	}
	
	.modal .modal_content {
	  width:860px;
	  height :fit-content;
	  /* margin:100px auto; */
	  margin-left : auto;
	  margin-right : auto;
	  margin-top : 10%;
	  padding:20px 20px 90px;
	  background:#fff;
	  border-radius : 20px;
	  /* border : 1px solid yellow; */
	}
	
	.modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	  /* border : 1px solid blue; */
	} 
	
	#innerModalBox{
		width : 90%;
		height : 90%;
		background-color : #467355;
		color : white;
		border-radius : 20px;
		border : 1px solid #467355;
		margin : auto;
	}
   
   #modalTable{
   	background-color : #467355;
   	color : white;
   	padding : 5%;
   	text-align : left;
   	/* border : 1px solid white; */
   	border-radius : 20px;
   	width : 97%;
   	margin : auto;
   }
   
   #modalTable tr, #modalTable td, #modalTable th{
    /* border : 1px solid white; */
   	padding-top : 1%;
   	padding-bottom : 1%;
   	padding-left : 2%;
   	padding-right : 2%;
   }
   
   #modalYTable{
   	background-color : #467355;
   	color : white;
   	padding : 5%;
   	text-align : left;
   	/* border : 1px solid white; */
   	border-radius : 20px;
   	width : 97%;
   	margin : auto;
   }
   
   #modalYTable tr, #modalYTable td, #modalYTable th{
   	/* border : 1px solid white; */
   	padding-top : 1%;
   	padding-bottom : 1%;
   	padding-left : 2%;
   	padding-right : 2%;
   }
   
   #reddot{
		position: absolute;
	    top: 8%;
	    left: 18%;
	    width : 20px;
	    height : 20px;
	}
	
   /*  @media (max-width:1440px){
         /* 마이페이지 css 
            body{
                background-image: url('../resources/images/image_mp/backgroundImg.png');
                background-size: 100%;
            }
            #topMenu{
                align-items: center;
                width : 80%;
                height : 150px;
                border : 1px solid black;
            }
            #countDday{
                border : 1px solid pink;
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
                width : 80%;
                height : 150px;
                border : 1px solid blue;
                display : inline-block;
                position:relative;
                top : 0;
                left : 25%;
                margin-left :3%;
                align-items: center;
            }
            .menuButton{
                width : 150px;
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
            }

            .menuButton:hover{
                box-shadow: 6px 6px gray;
                cursor: pointer;
            }

            .menuBoxEle{
                border : 1px solid red;
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
                border : 1px solid yellow;
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

        } */
</style>

</head>
<body>

 <div id="back">
 	   <!-- navi.jsp include -->
       <jsp:include page="../common/naviWhite.jsp"/>
        
        <section class="page-start" style="height : 1000px;">
            <div id="topMenu">
                <div id="countDday"> <p>${ loginUser.usname }님의 <br> 여행까지 <br>D-1</p> </div>
                <div class="menuBox" id="menuBox">

                    <button class="clickedBtn" id="myInfo" onclick="goToInfo();"> <div class="menuBoxEle" ><br><img src="${contextPath}/resources/images/image_mp/mp_userW.png" class="btnImg"> <br> 내 정보<br> <br></div></button>
                    <img src="${contextPath}/resources/images/image_mp/dot_r.png" class="newAlert" id="reddot">
                    <button class="menuButton" id="myInfo" onclick="goToJjim();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_jjimB.png" class="btnImg"> <br> 찜목록<br><br> </div></button>
                    <button class="menuButton" id="myInfo" onclick="goToBooking();"> <div class="menuBoxEle" onclick="location.href='${contextPath}/mypage/booking'"><br><img src="${contextPath}/resources/images/image_mp/mp_bookingB.png" class="btnImg"> <br> 내 예약<br> <br></div></button>
                    <button class="menuButton" id="myInfo" onclick="goToRoute();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_tripB.png" class="btnImg"> <br> 나만의 여행<br> <br></div></button>
                    <button class="menuButton" id="myInfo" onclick="goToWallet();"> <div class="menuBoxEle"><br><img src="${contextPath}/resources/images/image_mp/mp_walletB.png" class="btnImg"> <br> 내 지갑<br><br></div></button>

                </div>
            </div>

            <div id="mainBox">
                <div id="leftBox">
                
                    <input type="hidden" name="uspart" id="uspart" value="${loginUser.uspart }">
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
                    
                </div>
                <div id="rightBox">
                    <div id="alertBox">
                        
                        <div id="tableBox" style="overflow:scroll; ">
                        <c:choose>
                        <c:when test="${ empty alertBoard }">
                        	<div colspan="4" style="color : #467355; font-size : 30px; text-align : center; "> 
			             		<p style="padding-top : 20%;">새로운 공지사항이 없습니다!</p>
			             	</div>
                        </c:when>
			            
			             <c:otherwise>
			             <h2>&nbsp 공지사항</h2>
	                    <table id="alertTable">
	                        <c:forEach var="b" items="${ alertBoard }" varStatus="bStatus">
			                <tr style="cursor : pointer;" onclick="detailAlert(${b.bno})" class="newList">
			                    <th>${ b.bno }</th>
			                    <td>${ b.btitle }</td>
			                    <td>${ b.bdate}</td>
			                </tr>
			             </c:forEach>
			             </table>
			             </c:otherwise>
			             </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="modal">
            	<div class="modal_content">
				
					 <div>
                    <h4>- 비밀번호 재설정</h4>

                    <form action="${ contextPath }/mypage/updatepwd" method="POST" onsubmit="return submitValidate();">
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
		
		
		<div id="modalN" class="modal">
		<div class="modal_content">
			<div>
            	<h4 style="text-align : center; color : #467355; padding : 3px;"><b>알림</b></h4>
            	<hr>
               		<table id="modalTable">
               		
               		</table>
            		<div id="buttonBoxes">
            		<br>
	            		<button type="button" id="modal_close_Nbtn" class="chButtons" onclick="backBtn(${loginUser.usno})">닫기</button>
            		</div>
    		</div>
		</div>
						   
		<div class="modal_layer"></div>
	</div>
	
	<div id="modalY" class="modal">
		<div class="modal_content">
			<div>
            	<h4 style="text-align : center; color : #467355; padding : 3px;"><b>알림</b></h4>
            	<hr>
               		<table id="modalYTable">
               		
               		</table>
            		<div id="buttonBoxes">
            		<br>
	            		<button type="button" id="modal_close_Ybtn" class="chButtons">닫기</button>
            		</div>
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
    function goToWallet(){
		/* console.log("jsp안에서 usno확인 : " + usno); */
		location.href='${contextPath}/mypage/wallet?usno='+${loginUser.usno};
	};
	
	function goToBooking(){
		location.href='${contextPath}/mypage/booking?usno='+${loginUser.usno};
	}
	
	function goToJjim(){
		location.href='${contextPath}/mypage/jjimlist?usno='+${loginUser.usno};
	}
	
	function goToInfo(){
		location.href='${ contextPath }/mypage/userinfo?usno='+${loginUser.usno};
	}
	
	function goToRoute(){
		location.href="${contextPath}/mypage/myroute?usno=" + ${loginUser.usno};
	}
	function goToChange(){
		var uspart = "일반";
		var usid=$('#usid').val();
		var usemail = document.getElementById('newEmail').value;
		/* var usemail=$('#email').val(); */
		var usphone=$('#newPhone').val();
	/* 	
		console.log(uspart);
		console.log(usid);
		console.log(usemail);
		console.log(usphone); */
		
		location.href="${contextPath}/mypage/updateInfo?usno=" + ${loginUser.usno} + "&uspart" + uspart + "&usid=" + usid + "&usemail=" + usemail + "&usphone=" + usphone;
	}
	
	function detailAlert(bno){
		var datailList = findDetailAjax(bno);
		$("#modalY").fadeIn();
	}
	
	$("#modal_close_Ybtn").click(function(){
		   $("#modalY").fadeOut();
	});   
	
	
	function findDetailAjax(bno){
		
		//console.log("아작스 전에 nno 확인 : " + nno);
		
		var searchBno = new Object();
		searchBno.bno = bno;
		searchBno.usno = ${loginUser.usno};
		searchBno.usnews = ${loginUser.usnews};
		
		//console.log("usn = " + ${loginUser.usno});
		//console.log("usnews = " + ${loginUser.usnews});
		
		$.ajax({
			url : "${contextPath}/mypage/alertboardajax",
			data : JSON.stringify(searchBno),
			type : "post", 
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				table =  $("#modalYTable");
				table.html("");
				
				var tr1 = $("<tr>");
				var tnno = $("<th style='width : 10%; text-align : right;'>").text("번호 : ");
				var tnnoData = $("<td style='width : 40%; text-align : left;'>").text(data.bno);
				
				var tncate = $("<th style='width : 10%; text-align : right;'>").text("유형 : ");
				var tncateData = $("<td style='width : 60%; text-align : left;'>").text("공지사항");

				var blankTr2 = $("<tr>");
				var blankTd2 = $("<td colspan='4' style='height : 30px;'>").text(" ");
				
				var tr3 = $("<tr>");
				var tqcont = $("<th colspan='4'>").text("제목 : " + data.btitle);
				
				var tr4 = $("<tr>");
				var tqreply = $("<th colspan='4'>").text(data.bcontent);
				
				tr1.append(tnno, tnnoData, tncate, tncateData);
				tr3.append(tqcont);
				tr4.append(tqreply);
				blankTr2.append(blankTd2);
				table.append(tr1, blankTr2, tr3, tr4);
			},
			error : function(e) {
				alert("error code : " + e.status + "\n"
						+ "message : " + e.responseText);
			}
		
		});
	}
    </script>
</section>
</div>

    
     
     <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
 <div style="position : absolute; bottom:-20px; width : 100%; margin-bottom:-150px;">
 	<footer>
          <jsp:include page="../common/footer.jsp"/>
 	</footer>
 </div>
</body>
</html>