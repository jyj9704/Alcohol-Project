<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ABC주류</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/modal.css">
<link rel="stylesheet" href="./css/write.css">
<script src="./js/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script defer src="./js/main.js"></script>
<script defer src="./modal.js"></script>
</head>
<body>
    <%
        String sessionId = null;
        String sessionLevel = null;
        if(session.getAttribute("sessionId") != null && session.getAttribute("sessionLevel") != null) {
        	sessionId = (String) session.getAttribute("sessionId");
        	sessionLevel = (String) session.getAttribute("sessionLevel");
        }
    %>
	<div id="wrap">
		<header>
			<div class="login-form">
				<div class="container">
					<span></span>
					<h1><a href="main.jsp">ABC주류</a></h1>
					<%
					    if(sessionId == null) {
					%>
					<ul>
						<li><a href="javascript:void(0)" class="login-go">로그인</a></li>
						<li><a href="javascript:void(0)" class="signUp-go">회원가입</a></li>
					</ul>
					<%
					    }else {
					 %>
					    <ul>
						<li><a href="logoutAction.jsp" class="logout">로그아웃</a></li>
					 <% 
					     if(sessionLevel.equals("판매자")){ 
					 %>
						<li><a href="sellerMypage.jsp" class="mypage">마이페이지</a></li>
					 <%
					     }else if(sessionLevel.equals("구매자")){ 
					 %>
						<li><a href="buyerMypage.jsp" class="mypage">마이페이지</a></li>
					 <%
					     } 
					 %>	
					</ul>
					<%   	
					    }
					%>
				</div>
			</div>
			<div class="gnb-form">
				<div class="container">
					<div class="search">
						<form action="#" method="get">
							<label for="search-input"><i class="fas fa-search"></i></label>
							<input type="text" id="search-input" autocomplete="off">
						</form>
					</div>
					<nav>
						<ul class="gnb">
							<li><a href="#">맥주</a></li>
							<li><a href="#">와인</a></li>
							<li><a href="#">위스키</a></li>
							<li><a href="#">보드카</a></li>
							<li><a href="#">사케</a></li>
						</ul>
					</nav>
					<ul class="sub-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">이벤트</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
			</div>
		</header>
		<section class="box-slide swiper-container">
			<ul class="swiper-wrapper">
				<li class="swiper-slide">
					<img src="./images/slide1.jpg" alt="슬라이드 이미지 1">
					<div class="slide-text container">
						<p>THE PRIMIUM BEER</p>
						<h3>강하고 진한 맛<br><span class="liquor-name name1">ABC BEER</span></h3>
						<p>
							2021년 연말을 장식할 최고의 맥주. ABC BEER<br>
							오랜 기다림 끝에 드디어 한국에 상륙!
						</p>
					</div>
				</li>
				<li class="swiper-slide">
					<img src="./images/slide2.jpg" alt="슬라이드 이미지 2">
					<div class="slide-text container">
						<p>THE PRIMIUM WINE</p>
						<h3>강하고 진한 맛<br><span class="liquor-name name2">ABC WINE</span></h3>
						<p>
							2021년 연말을 장식할 최고의 와인. ABC WINE<br>
							오랜 기다림 끝에 드디어 한국에 상륙!
						</p>
					</div>
				</li>
				<li class="swiper-slide">
					<img src="./images/slide3.jpg" alt="슬라이드 이미지 3">
					<div class="slide-text container">
						<p>THE PRIMIUM WHISKEY</p>
						<h3>강하고 진한 맛<br><span class="liquor-name name3">ABC WHISKEY</span></h3>
						<p>
							2021년 연말을 장식할 최고의 위스키. ABC WHISKEY<br>
							오랜 기다림 끝에 드디어 한국에 상륙!
						</p>
					</div>
				</li>
			</ul>
			<div class="swiper-pagination"></div>
			<div class="swiper-navigation container">
				<button type="button" class="swiper-button-prev"></button>
				<button type="button" class="swiper-button-next"></button>
			</div>
		</section>
		
		
		
		<section class="abc-best container">
			<div class="name-box">
				<h2>ABC BEST</h2>
				<span><a href="#"><i class="fas fa-plus"></i> MORE</a></span>
			</div>
			<ul class="best-list">
				<li>
					<a href="#">
						<div class="best-img">
							<img src="./images/item/absolut-vodka.jpg" alt="앱솔루트 보드카">
						</div>
						<h5>ABSOLUT VODKA<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li>
					<a href="#">
						<div class="best-img">
							<img src="./images/item/buffaloTrace-whiskey.jpg" alt="버팔로트레이스 위스키">
						</div>
						<h5>BUFFALO TRACE<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li>
					<a href="#">
						<div class="best-img">
							<img src="./images/item/coronaExtra-beer.jpg" alt="코로나엑스트라 맥주">
						</div>
						<h5>CORONA EXTRA<span>&#8361;100,000</span></h5>
					</a>
				</li>
			</ul>
		</section>
		<section class="beer-video">
			<div class="video-bgc">
				<h2>ABC BEER</h2>
				<div><a href="#"><i class="fas fa-plus"></i> 주문하기</a></div>
			</div>
				<div class="video">
					<iframe src="https://www.youtube.com/embed/9BnCP8OUpEI?&autoplay=1&controls=0&autohide=1&mute=1&playlist=9BnCP8OUpEI&loop=1&mute=1" width="1000" height="562" frameborder="0" allowfullscreen></iframe>
				</div>
		</section>
		
		
		<section class="abc-recommended container">
			<div class="name-box">
				<h2>ABC RECOMMENDED</h2>
				<ul class="abc-choice">
					<li><button type="button" class="choice-btn active" onclick="btnClick(0)">ALL</button></li>
					<li><button type="button" class="choice-btn" onclick="btnClick(1)">BEER</button></li>
					<li><button type="button" class="choice-btn" onclick="btnClick(2)">WINE</button></li>
					<li><button type="button" class="choice-btn" onclick="btnClick(3)">VODKA</button></li>
					<li><button type="button" class="choice-btn" onclick="btnClick(4)">WHISKEY</button></li>
					<li><button type="button" class="choice-btn" onclick="btnClick(5)">SAKE</button></li>
				</ul>
			</div>
			<ul class="best-list">
				<li class="all vodka">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/absolut-vodka.jpg" alt="앱솔루트 보드카">
						</div>
						<h5>ABSOLUT VODKA<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all whiskey">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/buffaloTrace-whiskey.jpg" alt="버팔로트레이스 위스키">
						</div>
						<h5>BUFFALO TRACE<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all beer">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/coronaExtra-beer.jpg" alt="코로나엑스트라 맥주">
						</div>
						<h5>CORONA EXTRA<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all wine">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/dePerriere-wine.jpg" alt="드페리에 와인">
						</div>
						<h5>DE PERRIERE<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all beer">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/flensburger-beer.jpg" alt="플렌버거 맥주">
						</div>
						<h5>FLENS BURGER<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all beer">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/heineken-beer.jpg" alt="하이네켄 맥주">
						</div>
						<h5>HEINEKEN BEER<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all whiskey">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/jackDaniels-whiskey.jpg" alt="잭다니엘 위스키">
						</div>
						<h5>JACK DANIELS WHISKEY<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all sake">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/shirataka-sake.jpg" alt="시라타카 사케">
						</div>
						<h5>SHIRATAKA<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li class="all vodka">
					<a href="#">
						<div class="best-img">
							<img src="./images/item/smirnoff-vodka.jpg" alt="스미노프 보드카">
						</div>
						<h5>SMIRNOFF<span>&#8361;100,000</span></h5>
					</a>
				</li>
				<li></li>
			</ul>
		</section>
		
		<footer>
			<nav>
				<ul class="footer-gnb">
					<li><a href="#">이용약관</a></li>
					<li><a href="#">오시는길</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">제휴문의</a></li>
				</ul>
			</nav>
			<div>
				<h1>ABC주류</h1>
				<p>
					주소 : 서울특별시 중랑구 묵동<br>
					고객센터 : 02/111-1111 / 02-222-2222
				</p>
			</div>
			<p class="copyright">
				COPYRIGHT &copy; 3조 ALL RIGHTS RESERVED.
			</p>
		</footer>
	</div>
</body>
</html>