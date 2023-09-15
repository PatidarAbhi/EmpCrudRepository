<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
jsdbhjsdhjbdjsbj
	<%
	 HttpSession session1=request.getSession(false);
	 session1.invalidate();
	//response.sendRedirect("login.jsp");
	%>
</body>
</html>