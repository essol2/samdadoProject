<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<body>
	
   <!-- 네비영역 -->
   <div class="col-2" id="A"> 
     <div>
       <!-- 프로필사진 -------------------------------------------------------------------------------------------------------------------------------->
       <div class="card" style="width: 99%; height: 180px; border-style: none;">
       	   <br>  		           
           <img src="${ contextPath }/resources/images/image_admin/font_img.png" class="card-img-top" alt="...">
           <div style="padding-top: 4%; padding-bottom: 2%; padding-right: 2%;">
             <h5 style="text-align: center;"><b>${ loginUser.usname }</b></h5>
           </div>
        </div>
        <br>
           
        <!-- 왼쪽 네비바 ------------------------------------------------------------------------------------------------------------------------------------->
        <br>
        <div>
        <ul>
        	<li>
        		<a class="nav-link active" href="${ contextPath }/admin/home">
	        		<span data-feather="home">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-columns-gap" viewBox="0 0 16 16">
	                       <path d="M6 1v3H1V1h5zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H1zm14 12v3h-5v-3h5zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5zM6 8v7H1V8h5zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H1zm14-6v7h-5V1h5zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1h-5z"/>
	                     </svg>
	                </span>
	        		&nbsp;대쉬 보드
        		</a>
        	</li>
        	<br>
        	<li>
        		<a class="nav-link" href="${ contextPath }/admin/report">
	        		<span data-feather="shopping-cart">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-diamond" viewBox="0 0 16 16">
	                       <path d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 0 1 0-2.098L6.95.435zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z"/>
	                       <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
	                     </svg>
	                </span>
	        		&nbsp;신고 관리
        		</a>
        	</li>
        	<br>
        	<li>
        		<a class="nav-link" href="${ contextPath }/admin/qna">
	        		<span data-feather="users">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
	                       <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
	                       <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
	                     </svg>
	                </span>
	        		&nbsp;Q&A 관리
        		</a>
        	</li>
        	<br>
        	<li>
        		<a class="nav-link" href="#">
	        		<span data-feather="home">
	                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart" viewBox="0 0 16 16">
	                       <path d="M4 11H2v3h2v-3zm5-4H7v7h2V7zm5-5v12h-2V2h2zm-2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zM6 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm-5 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3z"/>
	                     </svg>
	                </span>
	        		&nbsp;광고 관리
        		</a>
        		<ul class="ul-class">                
	                <li><a class="nav-link" href="${ contextPath }/admin/advertise1" id="admin-navi-menu-ad1">&nbsp;&nbsp;&nbsp;- 배너 광고</a></li>
	                <li><a class="nav-link" href="${ contextPath }/admin/advertise2" id="admin-navi-menu-ad2">&nbsp;&nbsp;&nbsp;- 프리미엄 광고</a></li>
		       </ul>
        	</li>
        </ul>
        <br>
        <hr>
        <br>
        <br>
        <ul>
        	<li>
        		<a class="nav-link" href="${ contextPath }/admin/mypage">
	        		<span data-feather="file-text">
	                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
	                   <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
	                   <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
	                 </svg>
	               </span>
	        		&nbsp;어드민 관리
        		</a>
        	</li>
        </ul>

       </div>
    </div>
   </div>
</body>
</html>