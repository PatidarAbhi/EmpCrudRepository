<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<%!String msg;%>
<%
msg = (String) request.getAttribute("msg");
if (msg != null) {
%>
<h2 align="center"><%=msg%></h2>
<%
}
%>

<body>
	<div class="container">
		<h2>Login Page</h2>
		<form action="LoginServlet" method="Post">
			<div class="form-group">
				<label for="email">User Name:</label> <input type="text"
					class="form-control" id="userName" placeholder="Enter User Name"
					name="userName">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="pwd">
			</div>
			<button type="submit" class="btn btn-default" name="Login"
				value="Login">LogIn</button>
		</form>
	</div>
</body>
</html>