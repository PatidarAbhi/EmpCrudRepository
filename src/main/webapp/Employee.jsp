<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Entities.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#rishiID {
	color: white;
	text-decoration: none;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	Employee e = (Employee) session.getAttribute("emp");
	%>
	<%
	if (e != null) {
	%>

	<div class="container">
		<h2 align="center">Employee Table</h2>
		<table class="table" border="1">
			<thead>
				<tr style="background-color: #000; color: #fff; padding: 10px;">
					<th>Id</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Salary</th>
					<th>Operations</th>
				</tr>
			</thead>
			<tbody>
				<td><%=e.getId()%></td>
				<td><%=e.getFirstName()%></td>
				<td><%=e.getLastName()%></td>
				<td><%=e.getSalary()%></td>
				<td>
					<%-- <a href="editEmployee?id=<%=e.getId()%>">Update</a> --%>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#editModal<%=e.getId()%>"
						onclick="checkBox(<%=e.isAdmine()%>,<%=e.getId()%>)">Edit
						Employee</button>
				</td>
			</tbody>
		</table>
		<button class="btn btn-danger">
			<a href="LogoutServlet" id="rishiID">Logout</a>
		</button>
	</div>
	<div class="modal fade" id="editModal<%=e.getId()%>"
		data-backdrop="static" data-keyboard="false" tabindex="-1"
		aria-labelledby="editModalLabel<%=e.getId()%>" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel<%=e.getId()%>"">Edit
						Employee</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="editEmp" method="post">
						<div class="card "></div>
						<div class="card-body">
							<h5 class="card-title"></h5>
							<p class="card-text"></p>

							<div>
								<label>First Name</label> <input class="form-control"
									type="text" value="<%=e.getFirstName()%>" name="firstName"
									placeholder="FIrst Name">
							</div>
							<div>
								<label>Last Name</label> <input class="form-control" type="text"
									value="<%=e.getLastName()%>" name="lastName"
									placeholder="Last Name">
							</div>

							<div>
								<label>Salary</label> <input class="form-control" type="number"
									name="salary" placeholder="Salary" value="<%=e.getSalary()%>">
								<div>
									<label>Password</label> <input class="form-control"
										type="password" name="password" placeholder="Enter Passwoed"
										value="<%=e.getPasswrod()%>">
								</div>
								<div>
									<label>Id</label> <input type="number" name="id"
										value="<%=e.getId()%>" readonly="readonly">
								</div>
								<div>
									<label>User Name</label> <input type="text" name="userName"
										placeholder="User Name" value="<%=e.getUserName()%>">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form>
					<%
					} else {
					response.sendRedirect("login.jsp");
					}
					%>
				</div>

			</div>

		</div>
</body>

</html>