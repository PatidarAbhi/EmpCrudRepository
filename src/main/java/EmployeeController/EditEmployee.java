package EmployeeController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import EmployeeService.EmployeeService;
import Entities.Employee;

/**
 * Servlet implementation class EditEmployee
 */
@WebServlet("/editEmp")
public class EditEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeService service = new EmployeeService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditEmployee() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			float salary = Float.parseFloat(request.getParameter("salary"));
			String password = request.getParameter("password");
			int id = Integer.parseInt(request.getParameter("id"));
			String userName = request.getParameter("userName");
			String isAdmin = request.getParameter("isAdmin");
			Employee employee = new Employee();
			employee.setFirstName(firstName);
			employee.setLastName(lastName);
			employee.setPasswrod(password);
			employee.setUserName(userName);
			employee.setId(id);
			String forward = null;
			if (isAdmin == null) {
				employee.setAdmine(false);
				forward = "employee";
			} else {
				if (isAdmin.equals("no")) {
					employee.setAdmine(false);
				} else
					employee.setAdmine(true);
			}
			employee.setSalary(salary);
			String status = service.editEmployee(employee);
			if (forward == null) {
				if (status.equals("success")) {
					List<Employee> empList = service.getListOfEmployee();
					session.setAttribute("empList", empList);
					response.sendRedirect(request.getContextPath() + "/admin.jsp");
				}
			} else {
				if (status.equals("success")) {
					response.sendRedirect(request.getContextPath() + "/Employee.jsp");
				}
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
