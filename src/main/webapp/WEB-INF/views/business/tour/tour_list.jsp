<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Samadado</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/images/image_main/logo_g.png">
    <style>
        /* 공통 - 폰트 */
        * {
            font-family: 'Jeju Myeongjo', serif;
        }

        footer {
            background-color: rgb(70, 115, 85);
            height: 190px;
        }

        .leftImg {
            margin-left: 6%;
            margin-top: 20px;
        }

        #footer_center {
            margin-left: 30%;
            margin-top: -130px;
            color: white;
        }

        #footer_right {
            margin-left: 60%;
            margin-top: -120px;
            color: white;
        }

        .rightImg {
            padding-right: 15px;
        }

        #copyRight {
            color: white;
            margin-left: 40%;
            margin-right: 40%;
            margin-top: 10px;
            margin-bottom: 0px;
            opacity: 0.5;
        }

        hr {
            color: white;
        }


        /* 네비 css */
        #back {
            width: 100%;
            height: auto;
            margin: auto;
            top: 0;
        }

        header {
            position: fixed;
            width: 240px;
            top: 0;
            left: 1200px;
            height: 100%;
            -webkit-transition-duration: 0.2s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.2s;
            transition-timing-function: ease;
            color: black;
            border-left: 3px solid black;
            z-index: 1;
        }

        .down {
            -webkit-transition-duration: 0.2s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.2s;
            transition-timing-function: ease;
        }

        .down #navi {
            -webkit-transition-duration: 0.4s;
            -webkit-transition-timing-function: ease;
            transition-duration: 0.4s;
            transition-timing-function: ease;
        }

        .center {
            text-align: center;
        }

        .right {
            text-align: right;
            position: relative;
            right: 10%;
            margin: auto;
        }

        #navi-title {
            font-size: 40px;
            font-weight: bold;
        }

        #navi-menu {
            font-size: 15px;
            font-weight: 500;
        }

        .navi {
            height: 600px;
            /* border : 1px solid pink; */
            margin-left: 2%;
            width: 100%;
        }

        .img {
            position: relative;
            left: 70%;
        }

        /* 반응형 */
        @media (max-width:1920px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 87%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }
        }

        @media (max-width:1650px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 85%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }
        }

        @media (max-width:1440px) {
            header {
                position: fixed;
                width: 240px;
                top: 0;
                left: 83%;
                height: 100%;
                -webkit-transition-duration: 0.2s;
                -webkit-transition-timing-function: ease;
                transition-duration: 0.2s;
                transition-timing-function: ease;
                color: black;
                border-left: 3px solid black;
                z-index: 1;
            }

        }

        body {
            margin: 0;
            padding: 0;
            height: auto;
            box-sizing: border-box;
            background: white;
            color: black;
        }

        /* 컨테이너 */

        #main-container {
            height: 100%;
            width: 85%;
            display: flex;
            flex-direction: column;

        }

        /* 검색필터 */

        #filter-nav {
            list-style-type: none;
            margin: 0;
            padding: 1.3rem;
        }

        #filter-nav ul {
            display: flex;
        }

        #filter-nav li {
            display: flex;
            font-size: 20px;
            padding: 10px;
        }

        #filter-img {
            width: 55px;
            height: 55px;
        }

        .search-result {
            padding-left: 3%;
        }

        /* 검색필터끝 */

        /* 정렬필터 */

        #choise2-nav {
            list-style-type: none;
            text-align: center;
            margin: 0;
            padding: 1.3rem;
            display: flex;
            align-items: flex-end;           
        }

        #choise2-nav ul {
            display: flex;
        }

        #choise2-nav li {
            display: flex;
            font-size: 20px;
            padding: 10px;
        }

        /* 정렬필터끝 */

        /* 리스트 */
		
		.list{
			flex-direction: column;
		}
		
        #firstlist {            
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            /* justify-content: center; */
            align-items: center;
			max-width: 1600px;
    		flex-wrap: wrap;
        }

        .premium {
            width: 75px;
            height: 21px;
        }

        /* 프리미엄테두리 반짝이효과 */
        .gradient-border {
            --borderWidth: 5px;
            background: white;
            position: relative;
            border-radius: var(--borderWidth);
        }

        .gradient-border:after {
            content: '';
            position: absolute;
            top: calc(-1 * var(--borderWidth));
            left: calc(-1 * var(--borderWidth));
            height: calc(100% + var(--borderWidth) * 2);
            width: calc(100% + var(--borderWidth) * 2);
            background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
            border-radius: calc(1.5 * var(--borderWidth));
            z-index: -1;
            animation: animatedgradient 2s ease alternate infinite;
            background-size: 300% 300%;
        }

        @keyframes animatedgradient {
            0% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%;
            }
        }

        /* 프리미엄테두리 반짝이효과 끝 */

        #secondlist {            
            margin-left: 1%;
		    /* flex: 5; */
		    display: flex;
		    /* justify-content: center; */
		    align-items: center;
		    /* max-width: 1600px; */
		    flex-wrap: wrap;

        }
        
        #thirdlist {
           
            margin-left: 1%;
            /* flex: 5; */
            display: flex;
            justify-content: center;
            align-items: center;
            

        }

        .profile {

            display: flex;
            flex-direction: column;
            /* align-items: center; */
            justify-content: center;
            /* flex: 1; */
            margin: 1rem;
            padding: 1rem;
            width: 500px;
            height: 500px;
            box-sizing: border-box;
        }

        .image {
            object-fit: cover;
            width: 400px;
            height: 300px;
            border: 1px solid gray;
            border-radius: 3%; 
        }

        /* 리스트끝 */

        .btnarea {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex: 1;
        }

        /* 필터, 버튼 폰트 */

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .cover {
            width: 70px;
            height: 33px;
            border: 1px solid black;
            border-radius: 20%;            
        }

        .cover a, .cover label {
            text-decoration: none;
            color: black;
            font-family: 'GmarketSansBold' !important;
            line-height:0px;
        }

        .moreBtn {
            background-color: rgb(70, 115, 85);
            border-radius: 6px;
            border: 1px solid rgb(70, 115, 85);
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 75px;
            text-decoration: none;
            margin-bottom: 50px;
            font-family: 'GmarketSansBold' !important;
        }
        
        /* 사업장종류선택 */

        #choise-nav {
            list-style-type: none;
            text-align: center;
            margin: 0;
            padding: 1.3rem;
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;            
        }

        #choise-nav ul {
            display: flex;
        }

        #choise-nav li {
            display: flex;
            font-size: 20px;
            padding: 10px;
        }

        /* 사업장종류선택끝 */
    </style>
</head>

<body>
    <!-- navi.jsp include -->
    <jsp:include page="../../common/navi.jsp"/>

        <!-- 전체 section-->
        <section id="main-container">
        	<!-- 페이지 이동 nav -->
            <nav id="choise-nav">
                <ul id="choise">
                    <li>
                        <div class="cover"><a href='${ contextPath }/business/hotel_list'>숙박</a></div>
                    </li>
                    <li>
                        <div class="cover" style="background-color: rgb(70, 115, 85);"><label style="color: white;">관광지</label></div>
                    </li>
                    <li>
                        <div class="cover"><a href='${ contextPath }/business/restaurant_list'>음식점</a></div>
                    </li>
                    <li>
                        <div class="cover"><a href='${ contextPath }/business/rentcar_list'>렌트카</a></div>
                    </li>
                </ul>
            </nav>

            <nav id="filter-nav">
                <form method="POST">
                    <div class="cover2">
                        <ul id="filter">
                            <img id="filter-img" src="../resources/images/image_main/logo_g.png" alt="">

                            <li><label>지역</label>
                                <select>
                                    <option value="location">무관</option>
                                    <option value="location">서귀포</option>
                                    <option value="location">용인</option>
                                    <option value="location">한라산</option>
                                </select>

                            </li>
                            <li><label>날짜</label>
                                <input type="date">

                            </li>
                            <li>
                                <label>인원수</label>
                                <div>
                                    <select>
                                        <option value="location">1명</option>
                                        <option value="location">2명</option>
                                        <option value="location">3명</option>
                                        <option value="location">4명</option>
                                        <option value="location">5명</option>
                                        <option value="location">6명이상</option>
                                    </select>
                                    <img src="../resources/images/image_listpage/search.png">
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
                <div class="search-result">
                    <label style="font-size: 18px;">3월 16일 ~ 20일. 2명 게스트</label><br>
                    <label style="font-size: 23px;" >제주도 지역의 관광지</label>
                </div>
            </nav>

            <nav id="choise2-nav">
                <ul id="choise2">
                    <li>
                        <div class="cover"><label>테마별</label></div>
                    </li>
                    <li>
                        <div class="cover"><label>유형별</label></div>
                    </li>
                    <li>
                        <div class="cover"><label>별점순</label></div>
                    </li>
                    <li>
                        <div class="cover"><label>후기순</label></div>
                    </li>
                </ul>

            </nav>

            <!-- 관광지목록 div -->

            <div class="list">
                <div id="firstlist" class="gradient-border">
                    <div class='profile' onclick="location.href='${ contextPath }/business/tour_detail'">
                        <img class="premium" src="../resources/images/image_listpage/premium.png">
                        <img class="image" src="../resources/images/image_listpage/tour1.png">
                        <b>★4.90(후기 99+개)</b>
                        <b>김녕미로공원</b>
                        <b>입장료 : 3000</b>
                        <p><img src="../resources/images/image_listpage/heart.png"></p>
                    </div>
                    <div class='profile'>
                        <img class="premium" src="../resources/images/image_listpage/premium.png">
                        <img class="image" src="../resources/images/image_listpage/tour2.png">
                        <b>★4.90(후기 99+개)</b>
                        <b>서핑페스티벌</b>
                        <b>입장료 : 3000</b>
                        <p><img src="../resources/images/image_listpage/noheart.png"></p>
                    </div>
                    <div class='profile'>
                        <img class="premium" src="../resources/images/image_listpage/premium.png">
                        <img class="image" src="../resources/images/image_listpage/tour3.png">
                        <b>★4.90(후기 99+개)</b>
                        <b>서광승마장</b>
                        <b>입장료 : 3000</b>
                        <p><img src="../resources/images/image_listpage/noheart.png"></p>
                    </div>
                </div>

                <div id="secondlist">
                <c:forEach var="t" items="${ tourList }">
                    <div class='profile'>
                        <img class="image" src="../resources/images/image_listpage/tour4.png" onclick="selectRes(${t.bus_code})">
                        <b>★4.90(후기 99+개)</b>
                        <b>${ t.pro_name }</b>
                        <b>입장료 : ${ t.pro_price }</b>
                        <p><img src="../resources/images/image_listpage/noheart.png"></p>
                    </div>
                </c:forEach>
                </div>        
			</div>
			
			<!-- 디테일 이동 -->
			<script>
				function selectRes(bus_code){
					location.href='${contextPath}/business/tour_detail?bus_code=' + bus_code;
				}
			</script>
			
			
                <div class="btnarea">
                    <button class="moreBtn">더보기</button>
                </div>

        </section>

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