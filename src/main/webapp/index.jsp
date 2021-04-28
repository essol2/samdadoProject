<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to SAMDADO</title>
<style>
        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }
        body{
            background-image: url("resources/images/image_main/samdado.gif");
            background-repeat: no-repeat;
            background-size : 100%;
        }

        #textArea{
            margin-top : 10%;
        }

        h3, h1{
            text-align: center;
            color:black;
        }

        .indexbtn{
            text-align: center;
            align-items: center;
            background-color: #467355;
            border-style: none;
            width : 200px;
            height : 70px;
            margin-left : auto;
            margin-right : auto;
            margin-bottom : 10%;
            color : white;
        }

        #back{
            width : 30%;
            height : 100%;
            margin-top:5%;
            margin-left : auto;
            margin-right : auto;
            padding-top : 3%;
            background-color: rgba( 255, 255, 255, 0.8 );
            text-align : center;
        }

    </style>
</head>
<body>
<%-- 	<jsp:forward page="${ pageContext.servletContext.contextPath }/WEB-INF/views/common/main.jsp"/>
 --%>
 	<div id="back">
        <div id="textArea">
            <h3>제주여행의 시작과 끝.</h3>
            <h1>삼다도입니다.</h1>
        </div>
        <button class="indexbtn" onclick="javascript:location.href='main';">삼다도 들어가기</button>
    </div>
 
 
</body>
</html>