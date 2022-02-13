<%@page import="User.UserBean"%>
<%@page import="Buyer.BuyerBean"%>
<%@page import="Buyer.BuyerDAO"%>
<%@page import="Seller.SellerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Seller.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABC주류</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/modal.css">
<link rel="stylesheet" href="./css/write.css">
<link rel="stylesheet" href="./css/userPage.css">
<link rel="stylesheet" href="./css/adminPage.css">
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
				</div>
			<div class="gnb-form">
				<div class="container">
					<div class="search">
						<form action="#" method="post">
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

	<section class="user-page container">
		<div class="user-info">
				<!-- <div class="user-id"> -->
					<h2>
						<span class="user-name"><%=sessionId %></span>님 어서오세요
					</h2>
				<!-- </div> -->
				<!-- <ul class="delivery">
				<li><button type="button" class="prepare"><span class="under-line">0</span>&nbsp;&nbsp;배송준비</button></li>
				<li aria-hidden="true">/</li>
				<li><button type="button" class="shipping"><span class="under-line">0</span>&nbsp;&nbsp;배송중</button></li>
				<li aria-hidden="true">/</li>
				<li><button type="button" class="complete"><span class="under-line">0</span>&nbsp;&nbsp;배송완료</button></li>
			</ul> -->
		</div>
	</section>

	<section class="sell-list container">
		<div class="date-choice">
			<span>날짜 선택 : </span>
			<input type="date" name="date" id="date">
		</div>
		<table class="sell-table">
			<caption>고객 주문 정보</caption>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>제품명</th>
					<th>낙찰가(개당)</th>
					<th>수량</th>
					<th>판매자명</th>
					<th>주소</th>
					<th>연락처</th>
					<th>픽업예정일</th>
				</tr>
			</thead>
			<tbody>
			<%
	        BuyerDAO bd = new BuyerDAO();
	        ArrayList<BuyerBean> list = bd.getList(sessionId);
	        for(int i=0; i<list.size(); i++) {
		        %>
		        <tr>
		            <td><%= list.get(i).getOrderNum() %></td>
		            <td><%= list.get(i).getProduct() %></td>
		            <td><%= list.get(i).getPrice() %></td>
		            <td><%= list.get(i).getOrderVol() %></td>
		            <td><%= list.get(i).getSellerName() %></td>
		            <td><%= list.get(i).getSellerAddr() %></td>
		            <td><%= list.get(i).getSellerTel() %></td>
		            <td><%= list.get(i).getPickDate() %></td>
		        </tr>
		        <%
	        }
			%>
			</tbody>
		</table>
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