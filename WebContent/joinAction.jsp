<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="User.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	// 입력 값 셋팅
%>
<jsp:useBean id="user" class="User.UserBean" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="bDate" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="tel" />
<%
	try { // try-catch 안하면 주류 입력 안했을 때 for문에서 에러나서 500에러 뜸.
		String[] drink = request.getParameterValues("drink");
		String textDrink = "";

		for (int i = 0; i < drink.length; i++) {
			textDrink += drink[i] + " ";
		}
		User.UserBean uu = new UserBean();
		uu.setDrink(textDrink);
%>
<jsp:setProperty name="user" property="drink" value="<%=textDrink%>" />
<jsp:setProperty name="user" property="level" />
<%
	} catch (Exception e) {
       e.printStackTrace();
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%

		// 비밀번호 확인 값
		String pw_check = request.getParameter("pw_check");
	    
	    // 생년월일 년도 값
	    String strDate = user.getbDate();
        String subDate = strDate.substring(0,4);
        int year = Integer.parseInt(subDate);
        int tYear = LocalDate.now().getYear();
        
        // 로그인 상태에서 회원가입 금지
        String sessionId = null;
        if(session.getAttribute("sessionId") != null) {
     	   sessionId = (String)session.getAttribute("sessionId");
        }
        if(sessionId != null){
     	PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('이미 로그인 되어있습니다.')");
        	script.println("history.back()");
        	script.println("</script>");
        }

		//1. 빈 항목 체크
		if (user.getId() == null || user.getPw() == null || user.getName() == null || user.getbDate() == null
				|| user.getEmail() == null || user.getTel() == null || user.getDrink() == null || user.getLevel() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		
	    //2. 비밀번호 확인 체크	
		} else if (!user.getPw().equals(pw_check)) {
	%>
	    <script type="text/javascript">
	    	alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	    	history.back();
	    </script>

	<%  
	   //3. 미성년자 체크
		}else if ((tYear-year)<20){
	%>
		<script type="text/javascript">
			alert("미성년자는 가입이 불가합니다.");
			history.back();
		</script>

	<%  		
		} else {
			User.UserDAO userDAO = new User.UserDAO();
			int result = userDAO.join(user);

			if (result == -1) {
				// 4. 중복아이디 체크 (나머지 에러 = 아이디 중복)
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				session.setAttribute("sessionId", user.getId());
				session.setAttribute("sessionLevel", user.getLevel());
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("location.href = 'main.jsp' ");
				script.println("</script>");
			}
		}
	%>
</body>
</html>