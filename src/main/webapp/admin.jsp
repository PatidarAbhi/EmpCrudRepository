<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Entities.Employee"%>
<%@ page import="java.util.List"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script type="text/javascript">
	
</script>
<title>Insert title here</title>
<style>
#rishiID {
	color: white;
	text-decoration: none;
}
</style>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
List<Employee> employeeList = (List<Employee>) session.getAttribute("empList");
int lastEmployeeId = 0; // Default value if the list is empty

if (employeeList != null && !employeeList.isEmpty()) {
	Employee lastEmployee = employeeList.get(employeeList.size() - 1);
	lastEmployeeId = lastEmployee.getId();
}
%>


<script>
           
// Assume you have a JavaScript variable 'isAdminValue' representing the user's isAdmin status
     function checkBox(condition,id){
	
            var isAdminValue = condition; // Set this to the user's actual isAdmin status (true or false)
            console.log(isAdminValue);
            // Set the initial state of the radio buttons based on isAdminValue
            if (isAdminValue) {
                document.getElementById("isAdminYes"+id).checked = true;
            } else {
                document.getElementById("isAdminNo"+id).checked = true;
            }
}
        </script>

<h2 align="center">Admin</h2>
<%
if (employeeList != null) {
%>
<body>
	<div class="container">
		<table class="table" border="1">
			<thead>
				<tr style="background-color: #000; color: #fff; padding: 10px;">
					<th>Id</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Salary</th>
					<th>Is Admine</th>
					<th>Operations</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Employee e : employeeList) {
				%>
				<td><%=e.getId()%></td>
				<td><%=e.getFirstName()%></td>
				<td><%=e.getLastName()%></td>
				<td><%=e.getSalary()%></td>
				<td><%=e.isAdmine()%></td>
				<td>
					<%-- <a href="editEmployee?id=<%=e.getId()%>">Update</a> --%>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#editModal<%=e.getId()%>"
						onclick="checkBox(<%=e.isAdmine()%>,<%=e.getId()%>)">Edit
						Employee</button>
				</td>

				<td>
					<%
					if (e.isAdmine()) {
					%>
					<button class="btn btn-danger" disabled="disabled">
						<a href="deleteEmployee?id=<%=e.getId()%>" id="rishiID">Delete</a>
					</button> <%
 } else {
 %>
					<button class="btn btn-danger">
						<a href="deleteEmployee?id=<%=e.getId()%>" id="rishiID">Delete</a>
					</button> <%
 }
 %>
				</td>

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
												required="required" placeholder="FIrst Name">
										</div>
										<div>
											<label>Last Name</label> <input class="form-control"
												type="text" value="<%=e.getLastName()%>" name="lastName"
												required="required" placeholder="Last Name">
										</div>

										<div>
											<label>Salary</label> <input class="form-control"
												type="number" name="salary" placeholder="Salary"
												required="required" value="<%=e.getSalary()%>">

											<div>
												<label>Password</label> <input class="form-control"
													type="password" name="password"
													placeholder="Enter Passwoed" value="<%=e.getPasswrod()%>">
												required="required"
											</div>
											<div>
												<label>Id</label> <input type="number" name="id"
													required="required" value="<%=e.getId()%>"
													readonly="readonly">
											</div>
											<div>

												<label for="isAdmin">Are you an admin?</label> <input
													type="radio" id="isAdminYes<%=e.getId()%>" name="isAdmin"
													value="yes"> <label for="isAdminYes<%=e.getId()%>">Yes</label>
												<%
												if (!e.isAdmine()) {
												%>
												<input type="radio" id="isAdminNo<%=e.getId()%>"
													name="isAdmin" value="no"> <label
													for="isAdminNo<%=e.getId()%>">No</label>
												<%
												}
												%>
											</div>
											<div>
												<label>User Name</label> <input type="text" name="userName"
													required="required" placeholder="User Name"
													value="<%=e.getUserName()%>">
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
			</tbody>
			<%
			}
			%>
		</table>
	</div>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#staticBackdrop">Add Employee</button>

	<!-- Modal -->
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
											name="firstName" placeholder="FIrst Name" required="required"></td>
									</tr>
									<tr>
										<th scope="row">Last Name</th>
										<td><input class="form-control" type="text"
											name="lastName" placeholder="Lasr Name" required="required"></td>
									</tr>
									<tr>
										<th scope="row">Salary</th>
										<td><input class="form-control" type="number"
											name="salary" placeholder="Salary" required="required"></td>
									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input class="form-control" type="password"
											name="password" placeholder="Enter Passwoed"
											required="required"></td>
									</tr>
									<tr>
										<th scope="row">Id</th>
										<td><input type="number" name="id"
											value="<%=lastEmployeeId + 1%>" readonly="readonly"
											required="required" placeholder="Enter the id"></td>
									</tr>
									<tr>
										<th scope="row">IsAdmin</th>
										<td><input type="radio" id="isAdminYes" name="isAdmin"
											required="required" value="yes"> <label
											for="isAdminYes">Yes</label> <input type="radio"
											id="isAdminNo" name="isAdmin" value="no" required="required">
											<label for="isAdminNo">No</label>
									</tr>
									<tr>
										<th scope="row">User Name</th>
										<td><input type="text" name="userName"
											required="required" placeholder="User Name"></td>
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
			</div>
			</form>
		</div>

	</div>
	<button class="btn btn-danger">
		<a href="LogoutServlet" id="rishiID">Logout</a>
	</button>
	<%
	} else {
	   response.sendRedirect("login.jsp");
	}
	%>





</body>
</body>
</html>