package EmployeeController;

import java.io.IOException;

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
 * Servlet implementation class AddEmployeeController
 */
@WebServlet("/AddEmp")
public class AddEmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeService service = new EmployeeService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEmployeeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		if(session!=null) {
			System.out.println("session in add::"+session);
		System.out.println("inside dopost of add emp");
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
		if (isAdmin.equals("no")) {
			employee.setAdmine(false);
		} else
			employee.setAdmine(true);
		employee.setSalary(salary);
		String status = service.addEmployee(employee);
		if (status.equals("success")) {
			 request.setAttribute("add", "Add successful");
			response.sendRedirect(request.getContextPath() + "/admin.jsp");
		}
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/login.jsp");	
		}

	}

}
