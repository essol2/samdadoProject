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
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminCheckBussinessForm.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
    
    <!-- 중간영역 -->
    <div class="container">

     <div class="row">
        <div id="content_div">

            <div class="row" id="include_img_div">
                <div class="row">
                    <div class="col">
                         <img src="${ contextPath }/resources/images/image_admin/logo_g.png" class="card-img-top" alt="...">
                    </div>
                    <div class="col">
                        <h3 id="page_title">삼다도</h3>
                    </div>
                  </div>
            </div>
            <br><br>

            <div class="row" id="center_content_div">   

                <h2 id="title">No.1 [삼다도]님의 배너광고 신청 내역</h2> <br><br><br>

                <div class="inner_content" id="inner_content_1">
                    <h4 id="inner_content_1_title">1. 신청 사업장</h4>
                    <button type="submit" class="btn btn-secondary" id="showDetailBtn">상세보기</button>
                </div>

                <div class="inner_content">
                    <h4>2. 등록 이미지</h4>
                    <div class="mb-3">
                        <br>
                        <div id="exp_img_part">
                            <img src="resources/images/냠냠제주.jpg" alt="">
                        </div>
                    </div>
                </div>

                <div class="inner_content">
                    <h4>3. 작성 소개글</h4> <br>
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="??" id="floatingTextarea">안녕하세요. 제주도 냠냠물고깅</textarea>
                    </div>  
                </div>
            </div>
        </div>
    </div>

    <br><br><br><br><br>
 </div>



<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
-->
   
</body>
</html>


