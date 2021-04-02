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
       <!-- admin-navi 인클루드 -->
         <jsp:include page="admin-navi.jsp"/>
         
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