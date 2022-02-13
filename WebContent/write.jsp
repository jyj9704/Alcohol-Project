<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
	<div id="wrap">
		<header>
			<div class="login-form">
				<div class="container">
					<span></span>
					<h1><a href="main.jsp">ABC주류</a></h1>
					<ul>
						<li><a href="javascript:void(0)" class="login-go">로그인</a></li>
						<li><a href="javascript:void(0)" class="signUp-go">회원가입</a></li>
					</ul>
				</div>
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

		<section class="container write-section">
			<div class="write-bg"></div>
			<div class="title-box">
				<h2>(관리자) 주류 추가</h2>
			</div>
			<form action="#">
				<ul class="write-box">
					<li class="write-list">
						<h5>종류</h5>
						<input type="radio" name="liquor" id="whiskey" value="whiskey" checked><label for="whiskey"><span class="circle"><span class="circle-choice"></span></span>위스키</label>
						<input type="radio" name="liquor" id="wine" value="wine"><label for="wine"><span class="circle"><span class="circle-choice"></span></span>와인</label>
						<input type="radio" name="liquor" id="beer" value="beer"><label for="beer"><span class="circle"><span class="circle-choice"></span></span>맥주</label>
						<input type="radio" name="liquor" id="vodka" value="vodka"><label for="vodka"><span class="circle"><span class="circle-choice"></span></span>보드카</label>
						<input type="radio" name="liquor" id="sake" value="sake"><label for="sake"><span class="circle"><span class="circle-choice"></span></span>사케</label>
						<input type="radio" name="liquor" id="etc" value="etc"><label for="etc"><span class="circle"><span class="circle-choice"></span></span>기타</label>
					</li>
					<li class="write-list">
						<h5><label for="liqour-name">명칭</label></h5>
						<input type="text" id="liquor-name" autocomplete="off">
					</li>
					<li class="write-list">
						<h5><label for="liquor-volume">도수</label></h5>
						<input type="text" id="liquor-volume" autocomplete="off">
					</li>
					<li class="write-list">
						<h5><label for="liquor-from">원산지</label></h5>
						<input type="text" id="liquor-from" autocomplete="off">
					</li>
					<li class="write-list">
						<h5>판매방식</h5>
						<select name="sell" id="liquor-sell">
							<option value="1">고급포장</option>
							<option value="2">미니어쳐</option>
							<option value="3">면세방식</option>
							<option value="4">대량판매</option>
						</select>
					</li>
					<li class="write-list">
						<h5>이미지</h5>
						<input type="file" name="file" id="liquor-pic">
						<div>
							<label for="liquor-pic">파일 선택</label>
							<span class="file-result"></span>
						</div>
					</li>
					<li class="write-list">
						<h5>내용</h5>
						<textarea name="memo" id="liquor-memo"></textarea>
					</li>
					<div class="button-box">
						<button type="submit">등록</button>
						<button type="reset">취소</button>
					</div>
				</ul>
			</form>
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
	
	<script type="text/javascript">
		const pic=document.querySelector('#liquor-pic');
		pic.addEventListener('change',function(){
			const fileResult=document.querySelector('.file-result');
			fileResult.textContent=pic.value.split('/').pop().split('\\').pop();
		});
	</script>
</body>
</html>