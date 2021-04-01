<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
/* 푸터 */
    footer{
        width: 100%;
        background-color: rgb(70, 115, 85);
        height : 180px;
    }

    .leftImg{
        margin-left:30px;
        margin-top:20px;
    }


    #footer_center {
        margin-left:350px;
        margin-top:-130px;
        color:white;
    }

    #footer_right{
        margin-left:800px;
        margin-top:-120px;
        color:white;
    }

    .rightImg{
        padding-right: 15px;
    }

    #copyRight{
        color:white;
        margin-left: 500px;
        margin-top:60px;
    }

    /* 회원가입 기본틀 */

    :root{
    --body-background-color: #dadada
    --font-color: #4e4e4e;
    --border-gray-color : #dadada;   
    }

    *{
    margin:0;
    padding:0;
    }

    body{
    background:var(--body-background-color);
    }

    .main-container{
    width:87%;
    display:flex;
    flex-direction:column;
    align-items:center;
    }
    .main-container .main-wrap{
    width:100%;

    }
    .main-container .sel-lang-wrap
    {
    width: 96px;
    height: 30px;
    color: var(--font-color);
    border: solid 1px var(--border-gray-color);
    }

    .main-container {
    display:flex;
    justify-content:flex-end;
    }

    
    .main-container .logo-wrap{
        width: 100%;
        display:flex;   
        flex-direction: column;
        /* align-items: center; */
        background-color: #467355;
    }

    .title_img{
        padding: 30px;
        color: #ffffff;
    }

    .logo-wrap label {
        font-size: 30px;
        text-align: center;
    }

    .terms-section-wrap{
        padding-top: 60px;
        display: flex; 
        flex-direction: column;
        align-items: center;
    }

    .terms-check-wrap{
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 10px;
    }

    /* 회원가입 기본틀 끝 */

    /* 약관 페이지 */
    textarea{
        border: solid 1px var(--border-gray-color);
    }


    .terms-div{
        margin-top:30px;
        font-size: 14px;   
    }

    .terms-all-div{
        font-size: 15px;
    }

    .terms-div, .terms-all-div{
        font-weight: bold;   
    }

    .partner-div, .user-div{
        margin-top: 30px;
        color: #666;
    }

    #terms-privacy, #terms-service, label{
        cursor: pointer;
    }

    #partner-signup, #user-signup{
        font-size: 14px;
        line-height: 14px;
        display: inline-block;
        cursor: pointer;
        color: black;
    }

    #btnJoin {   
        background-color:#467355;
        border-radius:6px;
        border:1px solid #467355;
        cursor:pointer;
        color:#ffffff;
        font-family:Arial;
        font-size:18px;
        font-weight:bold;
        padding:10px 79px;
        text-decoration:none;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .button-class{
        margin-top: 40px;
    }

    .button-class2{
        margin-top: 40px;
        left: 20%;
    }

    /* 약관페이지 끝*/

    /* 가입양식 페이지 */

    h3 {
        margin: 19px 0 8px;
        font-size: 14px;
        font-weight: 700;
    }

    .signup-section-wrap{
      width: 75%;
    }


    .signup-div, .dog-div, .btn_area{
        position: relative;
        left: 45%;
    }

    .box {
        display: block;
        width: 465px;
        height: 48px;
        left: auto;
        border: solid 1px var(--border-gray-color);
        padding: 10px 14px 10px 14px;
        box-sizing: border-box;
        background: white;
        position: relative;
    }

    .int, .postcodify_postcode5, .postcodify_address
    , .postcodify_details {
        display: block;
        position: relative;
        width: 100%;
        height: 29px;
        border: none;
        background: #fff;
        font-size: 15px;
    }

    .box.int_pass {
        padding-right: 40px;
    }

    .box.int_pass_check {
        padding-right: 40px;
    }

    #bir_wrap {
        display: table;
        width: 100%;
    }

    #bir_yy {
        display: table-cell;
        width: 147px;
        
    }

    #bir_mm {
        display: table-cell;
        width: 147px;
        vertical-align: middle;
    }

    #bir_dd {
        display: table-cell;
        width: 147px;
    }

    #bir_mm, #bir_dd {
        padding-left: 10px;
    }

    select {
        width: 100%;
        height: 29px;
        font-size: 15px;
        background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
        background-size: 20px 8px;
        -webkit-appearance: none;
        display: inline-block;
        text-align: start;
        border: none;
        cursor: default;    
    }

    /* 에러메세지 */

    .error_next_box {
        margin-top: 9px;
        font-size: 12px;
        color: red;    
        display: none;
    }

    #alertTxt {
        position: absolute;
        top: 19px;
        right: 38px;
        font-size: 12px;
        color: red;
        display: none;
    }

    /* 버튼 */

    .btn_area {
        margin: 30px 0 91px;
        
    }

    #btnJoin {
    
    }

    /* 회원가입 양식 끝 */

    /* 방추가 */

    #car_add{
        width: 70px;
        height: 30px;
        float: right;
        background-color: #467355;
        color: #ffffff;
        font-weight: bold;
        background-color:#467355;
        border-radius:6px;
        border:1px solid #467355;
        margin-right: 1%;
        
    }

    #searchBtn {
        background-color:#467355;
        border-radius:6px;
        border:1px solid #467355;
        color: #ffffff;
        font-weight: bold;
    }
</style>
</head>
<body>
	<!-- 네비  -->
	<jsp:include page="../../common/navi.jsp"/>
	<!-- 메인 -->
	<div class="main-container">
        <div class="main-wrap">
          <div class="logo-wrap" id="logo-div">
            <label class="title_img">음식점 등록페이지</label>
          </div>
      <section class="signup-section-wrap">
			
		<form action="${ contextPath }/business/restaurant_insert" method="post" enctype="multipart/form-data">
            <!-- 사업장명 -->
            <div class="signup-div">
                <h3 class="join_title">
                    <label for="id">사업장명</label>
                </h3>
                <span class="box int_id">
                    <input type="text" id="id" class="int" name="bus_name"> 
                </span>              
            </div>

            <!-- 도로명주소 api -->
            <div class="signup-div">
                <h3 class="join_title"><label for="address1">우편번호</label></h3>
                <span class="box int_pass" style=" display: -webkit-inline-box;">
                    <input type="text" id="address1" name="bus_address" class="postcodify_postcode5" readonly>
                    <button type="button" id="postcodify_search_button" style="width: 40px; height: 30px;">검색</button>                  
                </span>
            </div>
            <div class="signup-div">
                <h3 class="join_title"><label for="address2">도로명주소</label></h3>
                <span class="box int_pass_check">
                    <input type="text" id="address2" name="bus_address" class="postcodify_address" readonly>                    
                </span>
            </div>
            <div class="signup-div">
                <h3 class="join_title"><label for="address3">상세주소</label></h3>
                <span class="box int_name">
                    <input type="text" id="address3" name="bus_address" class="postcodify_details">
                </span>
            </div>
            <!-- jQuery가 포함 된 상태에서 postcodify 스크립트 포함 -->
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<!-- 검색 버튼 클릭 시 팝업 레이어 열리도록 -->
			<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
             
             <!-- 카테고리 -->
             <div class="signup-div">
                <h3 class="join-title"><label for="category">카테고리</label></h3>
                <select class="box int_name" id="category" name="catagory">
                    <option value="select" selected>선택</option>
                    <option value="select">한식</option>
                    <option value="select">중식</option>
                    <option value="select">양식</option>
                    <option value="select">일식</option>
                    <option value="select">기타</option>
                </select>
            </div>
            
            <!-- 영업시간 -->
            <div class="signup-div">
                <h3 class="join-title"><label for="opening">영업시간</label></h3>
                <span class="box int_address">
                    <input type="text" id="opening" name="opening" class="int" placeholder="매일 08:00 ~ 22:00">
                </span>
            </div>         
           

            <!-- 메뉴판 사진 -->
            <div class="signup-div">
                <h3 class="join_title"><label>메뉴판 사진</label></h3>
                <span class="photo">
                    <input type="file" class="int" name="uploadFile">
                </span>   
            </div>

            <!-- 매장사진 -->
            <!-- <div class="signup-div">
                <h3 class="join_title"><label for="mainPhoto">매장사진</label></h3>
                <span class="photo">
                    <input type="file"   id="mainPhoto" class="int" maxlength="16">
                </span>
			</div> -->
            
            <!-- 추가사진 -->
            <!-- <div class="signup-div">
                <h3 class="join_title"><label for="phoneNo">추가사진</label></h3>
                <span class="photo">
                    <input type="file"  name="res_add_file" id="mobile" class="int" maxlength="16">
                </span>
                <span class="error_next_box"></span>    
            </div> -->

            <!-- 추가사진 -->
            <!-- <div class="signup-div">
                <h3 class="join_title"><label for="phoneNo">추가사진</label></h3>
                <span class="photo">
                    <input type="file"  name="res_add_file" id="mobile" class="int" maxlength="16">
                </span>
                <span class="error_next_box"></span>    
            </div> -->

            <!-- 소개글 -->
            <div class="signup-div">
                <h3 class="join_title"><label for="phoneNo">소개글</label></h3>
                <textarea id="intArea" name="bus_intro" class="intArea" rows="10" cols="64" ></textarea>
                <span class="error_next_box"></span>    
            </div>
            <!-- 등록, 뒤로가기 버튼 -->
            <div class="btn_area">
              <!-- Optional JavaScript; choose one of the two! -->

              <!-- Option 1: Bootstrap Bundle with Popper -->
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

              <!-- Option 2: Separate Popper and Bootstrap JS -->
              <!--
              <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
              -->
              <!-- Button trigger modal -->
              <button id="btnJoin" class="btn btn-primary">
              <a>등록하기</a>
              </button>
              <!-- Modal -->
              <!-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                   data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                  <div class="modal-dialog">
                  <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">여긴뭐지</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                           	 카카오톡 결제
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-primary">결제하기</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>
                  </div>
                  </div>
              </div> -->
		
              <button type="button" href="#" id="btnJoin" class="btn btn-primary">
              <a>뒤로가기</a>
              </button>
            </div>  
            </form>
            </section>   
        </div>        
    </div>
	<!--은화 : footer-->
	<footer>
	    <div id="footer_left">
	        <img src="../resources/images/image_footer/footerlogo.png" class="leftImg">
	    </div>
	    <div id="footer_center">
	        <img src="../resources/images/image_footer/Vector.png" class="centerImg"> &nbsp 서울 특별시 강남구 테헤란로14길 6<br><br>
	        <img src="../resources/images/image_footer/phone.png" class="centerImg"> &nbsp (064)740-6000 <br><br>
	        <img src="../resources/images/image_footer/message.png" class="centerImg"> &nbsp samdado@ijto.co.kr
	    </div>
	    <div id="footer_right">
	        <p id="samdado_news">삼다도 소식</p>
	        <img src="../resources/images/image_footer/facebook.png" class="rightImg">
	        <img src="../resources/images/image_footer/twitter.png" class="rightImg">
	        <img src="../resources/images/image_footer/LinkedIn.png" class="rightImg">
	        <img src="../resources/images/image_footer/pininterest.png" class="rightImg">
	    </div>
	    <br>
	    <br>
	    <hr>
	    <p id="copyRight" style="font-size: small;">© 2021 Digital Project. Team SAMDASOO</p>
	</footer>
	
</body>
</html>