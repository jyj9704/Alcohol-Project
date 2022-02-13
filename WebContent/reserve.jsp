<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/shopping.css">
<script type="text/javascript" src="script/product.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class="alert alert-secondary" role="alert">
주류 구매 예약(구매자)
<p style="text-align:right;">
<button type="button" class="btn btn-outline-secondary">메인페이지</button>
<button type="button" class="btn btn-outline-secondary">마이페이지</button>
<button type="button" class="btn btn-outline-secondary">로그아웃</button>
</p>
	<div id="wrap" align="center">
		<h1>우리들의 주류</h1>
			<form method="post" enctype="multipart/form-data" name="frm">
				<input type="hidden" name="code" value="${product.code}">
				<input type="hidden" name="nomakeimg" value="${product.pictureUrl}">
				<table>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty product.pictureUrl}">
									<img src="upload/noimage.gif">
									</c:when>
									<c:otherwise>
										<img src="upload/${product.pictureUrl}">
									</c:otherwise>
							</c:choose>
						</td>
						<td>
							<table>
								<tr>
									<th style="width:80px">상품명</th>
									<td>
										<input type="text" name="name" value="${product.name}" size="80">
									</td>
								</tr>	
								<tr>
									<th style="width:80px">원산지</th>
									<td>
										<input type="text" name="country" value="${product.country}" >
									</td>
								</tr>	
								<tr>
									<th style="width:80px">용량</th>
									<td>
										<input type="text" name="bottle" value="${product.bottle}" >ml
									</td>
								</tr>
								<tr>
									<th style="width:80px">알콜도수</th>
									<td>
										<input type="text" name="alcol" value="${product.alcol}" >%
									</td>
								</tr>		
								<tr>
									<th>가격</th>
									<td>
										<input type="text" name="price" value="${product.price}">원
									</td>
								</tr>
								<tr>
									<th>사진</th>
									<td>
										<input type="file" name="pictureUrl"><br>
										(구매하려는 이미지를 선택해 주세요)
									</td>
								</tr>
								<tr>
									<th>요청사항</th>
									<td>
										<textarea rows="10" cols="90" name="description">
											${product.description}
										</textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table><br>
				<input type="submit" value="구매" onclick="return productCheck()">
				<input type="reset" value="다시작성">
				<input type="button" value="즐겨찾기" onclick="location.href='productList.do'">
			</form>
	</div>
</body>
</html>