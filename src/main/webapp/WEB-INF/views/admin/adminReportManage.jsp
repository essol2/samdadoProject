<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/adminReportManage.css" type="text/css">

     <!--차트 api cdn-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-2" id="A">
          <div>
              <!-- 프로필사진 -------------------------------------------------------------------------------------------------------------------------------->
              <div class="card" style="width: 99%; border-style: none;">
                  <img src="${ contextPath }/resources/images/image_admin/logo_g.png" class="card-img-top" alt="...">
                  <div style="padding-top: 4%; padding-bottom: 2%; padding-right: 2%;">
                    <h5 style="text-align: center;"><b>${ loginUser.usid }</b></h5>
                  </div>
                </div>
                <br>
                
                <!-- 왼쪽 네비바 ------------------------------------------------------------------------------------------------------------------------------------->
                <div>
                  <li class="nav-item" style="text-decoration-style: none;">
                      <a class="nav-link active" aria-current="page" href="/admin.html">
                        <span data-feather="home">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-columns-gap" viewBox="0 0 16 16">
                            <path d="M6 1v3H1V1h5zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H1zm14 12v3h-5v-3h5zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5zM6 8v7H1V8h5zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H1zm14-6v7h-5V1h5zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1h-5z"/>
                          </svg>
                        </span>
                        대시 보드
                      </a>
                    </li>
                    <br>
                    <li class="nav-item">
                      <a class="nav-link" href="/adminAd1Manage.html">
                        <span data-feather="file">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
                            <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
                          </svg>
                        </span>
                        광고 관리
                      </a>
                    </li>
                  <br>
                    <li class="nav-item">
                      <a class="nav-link" href="/adminReportManage.html">
                        <span data-feather="shopping-cart">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-diamond" viewBox="0 0 16 16">
                            <path d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
                            <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                          </svg>
                        </span>
                        신고 관리
                      </a>
                    </li>
                    <br>
                    <li class="nav-item">
                      <a class="nav-link" href="/QnA.html">
                        <span data-feather="users">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
                            <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                            <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                          </svg>
                        </span>
                        Q&A 관리
                      </a>
                    </li>
                  </ul>
                </div> 
  
                <br>
                <hr style="width: 98%;">
  
                <br>
                <span>settings</span>
                <a class="link-secondary" href="#" aria-label="Add a new report">
                  <span data-feather="plus-circle"></span>
                </a>
              </h6>
              <ul class="nav flex-column mb-2">
                <li class="nav-item">
                  <a class="nav-link" href="#">
                    <span data-feather="file-text">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                        <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                      </svg>
                    </span>
                    마이페이지
                  </a>
                </li>
              </ul>
          </div>
        </div>

        <!-- B영역 -->

        <div class="col-10" id="B">
            <br>
            <!--신고 신규 내역 -->
            <h3>신고 <span style="color: red;">신규</span>  내역</h3>
            <br>
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>신고번호</th>
                        <th>피신고자</th>
                        <th>신고사유</th>
                        <th scope="row">신고내용</th>
                        <th>첨부파일</th>
                        <th>신고날짜</th>
                        <th>카테고리</th>
                        <th>승인처리</th>
                        <th>반려처리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <!--반복문 -->
                  <tr>
                    <th>1</th>
                    <td>김춘추</td>
                    <td>욕설</td>
                    <td scope="row">욕설 오짐;; 첨부파일 확인 ㄱ</td>
                    <td><a class="btn btn-info">보기</a></td>
                    <td>2021-03-17</td>
                    <td>일반</td>
                    <td><button type="submit" class="btn btn-secondary">승인</button></td>
                    <td><button type="submit" class="btn btn-success">반려</button></td>
                  </tr>
                  <tr>
                    <th>2</th>
                    <td>강제주</td>
                    <td>허위매물</td>
                    <td scope="row">갔는데 읎노;; 하....................</td>
                    <td><a class="btn btn-info">보기</a></td>
                    <td>2021-03-17</td>
                    <td>제휴</td>
                    <td><button type="submit" class="btn btn-secondary">승인</button></td>
                    <td><button type="submit" class="btn btn-success">반려</button></td>
                  </tr>
                </tbody>
              </table>

              <br><hr> 

              <!-- 페이지네이션 -->
              <div class="row-page">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
              </div>
              

             <br> <br>

             <!--신고 승인 내역 -->
             <!-- <h3>신고 <span style="color: red;">승인</span> 내역</h3>
             <br>
             <table class="table table-borderless">
                 <thead>
                     <tr>
                         <th>신고번호</th>
                         <th>피신고자</th>
                         <th>신고사유</th>
                         <th scope="row">신고내용</th>
                         <th>첨부파일</th>
                         <th>신고날짜</th>
                         <th>카테고리</th>
                         <th>처리</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                     
                   <tr>
                     <th>1</th>
                     <td>김춘추</td>
                     <td>욕설</td>
                     <td scope="row">욕설 오짐;; 첨부파일 확인 ㄱ</td>
                     <td><a class="btn btn-info">보기</a></td>
                     <td>2021-03-17</td>
                     <td>일반</td>
                     <td><button type="submit" class="btn btn-secondary">삭제</button></td>
                   </tr>
                   <tr>
                     <th>2</th>
                     <td>강제주</td>
                     <td>허위매물</td>
                     <td scope="row">갔는데 읎노;; 하....................</td>
                     <td><a class="btn btn-info">보기</a></td>
                     <td>2021-03-17</td>
                     <td>제휴</td>
                     <td><button type="submit" class="btn btn-secondary">삭제</button></td>
                   </tr>
                 </tbody>
               </table>
  -->
              <!-- <br> <hr> <br> -->

               <!--신고 반려 내역 -->
             <!-- <h3>신고 <span style="color: red;">반려</span> 내역</h3>
             <br>
             <table class="table table-borderless">
                 <thead>
                     <tr>
                         <th>신고번호</th>
                         <th>피신고자</th>
                         <th>신고사유</th>
                         <th scope="row">신고내용</th>
                         <th>첨부파일</th>
                         <th>신고날짜</th>
                         <th>카테고리</th>
                         <th>처리</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                    
                     <th>1</th>
                     <td>홍길동</td>
                     <td>도배</td>
                     <td scope="row">게시판에 자꾸 도배를 하네요... 강퇴 부탁드립니다.</td>
                     <td><a class="btn btn-info">보기</a></td>
                     <td>2021-03-17</td>
                     <td>일반</td>
                     <td><button type="submit" class="btn btn-secondary">삭제</button></td>
                   </tr>
                 </tbody>
               </table> -->

               <!-- <br><hr><br> -->

               <div class="find_report">
                <h3>신고<span style="color: seagreen;">내역조회</span>하기</h3>
                <br>
                
                <div class="search_report_div">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>-------</option>
                        <option value="1" name="name">피신고자</option>
                        <option value="2" name="reseon">신고사유</option>
                        <option value="3" name="content">신고내용</option>
                        <option value="3" name="date">신고날짜</option>
                        <option value="3" name="category" >카테고리</option>
                        <option value="3" name="result">처리여부</option>
                    </select>
                    <input type="text" id="searchValue" class="form-control">
                    <button class="btn btn-secondary" onclick="searchReport();">검색하기</button>
                </div>
                
                <br>

                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th>신고번호</th>
                            <th>피신고자</th>
                            <th>신고사유</th>
                            <th scope="row">신고내용</th>
                            <th>첨부파일</th>
                            <th>신고날짜</th>
                            <th>카테고리</th>
                            <th>처리여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td>강제주</td>
                            <td>허위매물</td>
                            <td scope="row">갔는데 읎노;; 하....................</td>
                            <td><a class="btn btn-info" href="#">보기</a></td>
                            <td>2021-03-17</td>
                            <td>제휴</td>
                            <td>승인</td>
                          </tr>
                    </tbody>
                  </table>
               </div>
               <br><hr>
               
                <!-- 페이지네이션 -->
                <div class="row-page">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        </ul>
                    </nav>
                </div>
               
               <br><br>
        </div>
   
    </div>
</div>
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