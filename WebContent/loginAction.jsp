<%@page import="User.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="User.UserBean" scope="page" />
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="pw"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
      <%
           String sessionId = null;
           if(session.getAttribute("sessionId") != null) {
        	   sessionId = (String)session.getAttribute("sessionId");
           }
           if(sessionId != null){
        	PrintWriter script = response.getWriter();
           	script.println("<script>");
           	script.println("alert('이미 로그인이 되어있습니다.')");
           	script.println("history.back()");
           	script.println("</script>");
           }
           UserDAO userDAO=new UserDAO();
           user = userDAO.login(user.getId(), user.getPw());
            if(user != null){ // 회원이 맞는 경우
            	if(user.getId() != null && user.getId() != ""){
            	session.setAttribute("sessionId", user.getId());
            	session.setAttribute("sessionLevel", user.getLevel());
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
            	script.println("location.href = 'main.jsp'");
            	script.println("</script>");
            
            }else{
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
            	script.println("alert('비밀번호가 틀립니다.')");
            	script.println("history.back()");
            	script.println("</script>");
            	
           }
            }else{
            	PrintWriter script = response.getWriter();
            	script.println("<script>");
            	script.println("alert('존재하지 않는 아이디입니다.')");
            	script.println("history.back()");
            	script.println("</script>");
            	
            }
    %>

</body>
</html>