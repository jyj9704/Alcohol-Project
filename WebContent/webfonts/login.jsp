<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ABC주류</h1>
<div align="center">
<hr>
<h2>Log-In</h2>
	<form action="loginAction.jsp" method="post">
	    <table width="400" border="1">
		    <tr height="40">
		        <td width="100" align="center">아이디:</td><td width="200" align="center"><input type="text" name="id"></td><br>
		    </tr>
		<tr height="50">
		    <td width="100" align="center">비밀번호:</td><td width="200" align="center"><input type="password" name="pw"></td><br>
		    </tr>
		 </table>
		 <input type="submit" value="로그인">&nbsp;&nbsp;
         <input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
	</form>
	</div>
</body>
</html>