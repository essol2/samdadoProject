<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${ contextPath }/resources/css/admin/QnA.css" type="text/css">

     <!--차트 api cdn-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
  </head>
  <body>
  
   <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg }">
   		<script>alert('${ msg }')</script>
   		<c:remove var="msg" />
   </c:if>
   
    <div class="container-fluid">
      <div class="row">
        
         
         <!-- admin-navi 인클루드 -->
         <jsp:include page="admin-navi.jsp"/>
         
        <!-- B영역 -->

        <div class="col-10" id="B">
            <br>
            <!--신규 Q&A 내역 -->
            <h3>신규 <span style="color: red;">Q&A</span>  내역</h3>
            <br>
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>회원명</th>
                        <th scope="row">문의내용</th>
                        <th>답변내용</th>
                        <th>처리</th>
                        <th>문의날짜</th>
                    </tr>
                </thead>
                <tbody>
                 <form action="${ contextPath }/admin/insertReplyQna" method="post">
          		  <c:forEach var="q" items="${ qnaList }">
                   <tr>
                       <th scope="row">${ q.qnano }</th>
                       <td>${ q.usname }</td>
                       <td>${ q.qcont }</td>
                       <input type="hidden" name="qnano" value="${ q.qnano }">
                       <td><input type="text" name="qreply" id="replyValue" class="form-control"></td>
                       <td><button type="submit" class="btn btn-secondary">답변</button></td>
                       <td>${ q.qdate }</td>
                   </tr>
                  </c:forEach>              
				</form>
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

            <br><br>

               <div class="find_qna">
                <h3>Q&A<span style="color: red;"> 내역조회 </span>하기</h3>
                <br>
                
                <div class="search_qna_div">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>-------</option>
                        <option value="qna_no" name="qna_no">Q&A번호</option>
                        <option value="name" name="name">회원명</option>
                        <option value="qcontent" name="qcontent">문의내용</option>
                        <option value="qdate" name="qdate" >문의날짜</option>
                        <option value="qreply" name="qreply">답변내용</option>
                    </select>
                    <input type="text" id="searchValue" class="form-control">
                    <button class="btn btn-secondary" onclick="searchQna();">검색하기</button>
                </div>
                
                <br>

                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>회원명</th>
                            <th scope="row">문의내용</th>
                            <th>문의날짜</th>
                            <th>답변내용</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td>강제주</td>
                            <td>계정 탈퇴하면 재복구 안됨?</td>
                            <td>2021-01-02</td>
                            <td>안녕하세요. 탈퇴한 계정은 복구할 수 없습니다. 감사합니다.</td>
                            <td>완료</td>
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
               <br><br><br><br><br><br><br><br><br><br><br><br>
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