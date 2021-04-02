<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>Insert title here</title>
<style>
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

        .searchbtn {
            background-color: rgba(189, 189, 189, 0.4);
            width: 50px;
            height: 50px;
            border: 0px;
            border-top-right-radius: 50px;
            border-bottom-right-radius: 50px;
            border-top-left-radius: 50px;
            border-bottom-left-radius: 50px;
        }
        
        .srcimg {
            width: 30px;
            height: 30px;
        }

        .modal-header {
            border: 0px;
        }

        #modal-body {
            /* height: auto; */
            max-height: 420px;
            overflow: auto;
            overflow-x: hidden;
        }

        #search_input {
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;

            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }

        #modal-body input {
            background-image: url(image/search.png);
            background-repeat: no-repeat;
            background-size: 30px;
            padding-left: 35px;
        }

        #searchtitle {
            font-size: larger;
            margin: 0px;
        }

        #zzim {
            font-size: 20px;
            margin-left: 10%;
            font-weight: 400;
            margin-bottom: 0%;
        }

        .zzim_list {
            margin-left: 10%;
            margin-right: 10%;
            border-bottom: 1px solid #467355 ;
            margin-top: 3%;
        }

        .zzim_content_title {
            margin-bottom: 0px;
            font-size: 18px;
            font-weight: 600;
        }

        .zzim_content {
            margin-bottom: 0px;
            font-size: 13px;
        }

        #addbtn {
            background-color: white;
            border: 0px;
            margin-left: 65%;
        }

        

    </style>
</head>
 <body>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <!-- Button trigger modal -->
    <button type="button" class="searchbtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <img class="srcimg" src="image/search.png">
    </button>
  
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <p id="searchtitle">관광지 검색</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <class class="modal-body" id="modal-body">
                    <input type="text" id="search_input" placeholder="관광지를 검색하세요.">
                    <br><br>
                    <p id="zzim">삼다수 님이 찜하신 관광지</p>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="image/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="image/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="image/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    <div class="zzim_list">
                        <p class="zzim_content_title" >제주김만복 본점</p>
                        <p class="zzim_content">제주 제주시 오라로 41</p>
                        <p class="zzim_content">
                            오라 3동 2250-1
                            <button id="addbtn">
                                <img src="image/download.png">추가하기
                            </button>
                        </p>
                    </div>
                    
                </class>
                </div>
               
            </div>
        </div>
    </div>
 
  </body>
</html>