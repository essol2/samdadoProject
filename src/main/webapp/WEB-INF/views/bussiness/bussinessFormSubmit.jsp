<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<!-- css 외부 파일 첨부 -->
<link rel="stylesheet" href="${ contextPath }/resources/css/Bussiness/bussinessFormSubmit.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
    
    <!-- 중간영역 -->
    <div class="container-fluid">
     <!-- 네비 따로 빼서 인클루드 하기 -->
     <div class="row">
        <div id="nav_part">
            <div id="back">
                <header>
                    <div class="navi">
                        <br><br>
                        <p class="center" id="navi-title">삼다도</p>
                        <p class="center" id="navi-menu">나만의 길 만들기</p>
                        <p class="center" id="navi-menu">전체 제주 관광지 보기</p>
                        <p class="center" id="navi-menu">삼다도에서 사업하기</p>
                        <p class="center" id="navi-menu-buss-hotel">호텔 등록하기</p>
                        <p class="center" id="navi-menu-buss-rent">음식점/렌트카 등록하기</p>
                        <p class="center" id="navi-menu-buss-attrac">관광지 등록하기</p>
                        <p class="center" id="navi-menu-buss-banner">배너(리스팅)광고</p>
                    </div>
                    <div>
                        <image class="img" width="50px" height="50px" src="${ contextPath }/resources/images/image_main/logo_g.png"></image>
                        <p class="right" id="navi-menu">들어가기</p>
                        <p class="right" id="navi-menu">회원가입</p>
                    </div>
                </header>
            </div>
        </div>
        <div id="content_div">
            <!--삼다도 광고 신청-->
            <div class="row" id="include_img_div">
                <div class="row">
                      <div class="col-1">
                        <a href="${ contextPath }/main"><img class="d-block mx-auto mb-4" src="${ contextPath }/resources/images/image_main/logo_w.png" alt="" width="72" height="57"></a> 
                      </div>
                      <div class="col-11">
                        <h3 id="page_title">삼다도 배너 광고 신청</h3>
                      </div>
                </div>  
            </div>
            <br><br>
            <!-- 제휴 신청 페이지 -->
            <div class="row" id="center_content_div">      
         
                <div class="modal fade" id="myModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h4 class="modal-title" id="staticBackdropLabel">잠깐! 먼저 읽어주세요.</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5 id="mymodal_caution_text">배너 광고에 대해 숙지 부탁드립니다.</h5> <br>
                            <h6 id="modal_inner_text">
                                삼다도 배너 광고는 <b>관리자에 의해 승인</b>이 이루어지면 <br>
                                신청 순서에 따라 삼다도 메인페이지에 순서대로 노출됩니다. <br>
                                자세한 사항은 <a href="${ contextPath }/mypage/userinfo"><b>‘삼다도에 대해서’</b></a> 페이지에서 확인 해 주세요! <!-- 페이지 링크 연결-->
                                <br><br>
                                배너 광고는 <b style="color: red;">포인트 충전</b>이 필요한 서비스입니다. <br>
                                포인트 충전은 잊지 않으셨죠?
                                </h6>             
                        <br>
                        <div class="goToPayBtn_div">
                            <a href="${ contextPath }/mypage/userinfo" id="goMyPageBtn" class="btn btn-secondary" style="color: white; text-decoration: none;">동의 후 포인트 충전하러 가기</a> 
                        </div>    
                        </div>
                        <div class="modal-footer">
                        <button type="button" data-bs-dismiss="modal" id="myModal_closeBtn">닫기</button>
                        </div>
                    </div>
                    </div>
                </div> 

            <form action="${ contextPath }/submit/bannerAd" method="POST">
                <div class="inner_content">
                    <h4>1. 신청하실 사업장을 선택하세요.</h4> <br>
                    <select class="form-select" name="searchBannerAD" id="searchBannerAD" aria-label="Default select example">
                        <option value="all" <c:if test="${ param.searchBannerAD == 'all' }">selected</c:if>>전체</option>
							<option value="writer" <c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>작성자</option>
							<option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
							<option value="content" <c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
                      </select>
                </div>
              
                <div class="inner_content">
                    <h4>2. 배너 이미지를 등록해주세요.</h4> <br>
                    <div class="mb-3">
                        <input class="form-control" type="file" id="formFile" name="uploadFile">
                        <br>
                        <div id="exp_img_part">
                            <img src="${ contextPath }/resources/images/냠냠제주.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="inner_content">
                    <h4>3. 기업에 대한 간단한 소개를 해주세요.</h4> <br>
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="기업에 대한 간단한 소개를 해주세요." id="floatingTextarea"></textarea>
                    </div>  
                </div>
              
                <div class="inner_content">               
                    <button type="submit" class="btn btn-secondary" id="submit_bannerBtn">신청하기</button> 
                </div>
            </form>
        
        </div>
    </div>
 </div>

<!-- 모달창 자동 onload -->
 <script>
      $(document).ready(function() {
            $('#myModal').modal("show");
        });
 </script>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
-->

    <!-- 푸터 인클루드 하기 -->
   
</body>
</html>


