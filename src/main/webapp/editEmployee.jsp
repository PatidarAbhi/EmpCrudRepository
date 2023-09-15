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

<title>Insert title here</title>
</head>
<body>

	<%
	Employee employeeList = (Employee) request.getAttribute("emp");
	%>

	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#staticBackdrop">Add Employee</button>

	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Employee</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddEmp" method="post">
						<div class="card "></div>
						<div class="card-body">
							<h5 class="card-title"></h5>
							<p class="card-text"></p>
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">First Name</th>
										<td><input class="form-control" type="text"
											name="firstName" placeholder="FIrst Name"></td>
									</tr>
									<tr>
										<th scope="row">Last Name</th>
										<td><input class="form-control" type="text"
											name="lastName" placeholder="Lasr Name"></td>
									</tr>
									<tr>
										<th scope="row">Salary</th>
										<td><input class="form-control" type="number"
											name="salary" placeholder="Salary"></td>
									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input class="form-control" type="password"
											name="password" placeholder="Enter Passwoed"></td>
									</tr>
									<tr>
										<th scope="row">Id</th>
										<td><input type="number" name="id"
											placeholder="Enter the id"></td>
									</tr>
									<tr>
										<th scope="row">IsAdmin</th>
										<td><input type="checkbox" name="isAdmin" value="true"></td>
									</tr>
									<tr>
										<th scope="row">User Name</th>
										<td><input type="text" name="userName"
											placeholder="User Name"></td>
									</tr>
								</tbody>
							</table>



						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</html>