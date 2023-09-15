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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeService service = new EmployeeService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Inside Post");
		if (request.getParameter("Login").equals("Login")) {
			String userName = request.getParameter("userName");
			String password = request.getParameter("pwd");
			Employee emp = service.validateEmployee(userName, password);
			System.out.println("userName::" + userName + " Password::" + password);
			if (emp != null) {
				
				System.out.println("Emp not null");
				if(!emp.isAdmine())
				{
					HttpSession ses =request.getSession();
					System.out.println("not a admin");
					 ses=request.getSession();
					ses.setAttribute("emp", emp);
					ses.setAttribute("isAdmin", false);
					 request.setAttribute("login", "login successful");
					RequestDispatcher rd=request.getRequestDispatcher("Employee.jsp");
					 rd.forward(request, response);
				}
				else
				{
					HttpSession ses =request.getSession();
					System.out.println("session in login::"+ses);
					List<Employee> empList=service.getListOfEmployee();
					 ses=request.getSession();
					ses.setAttribute("empList", empList);
					ses.setAttribute("isAdmin", true);
					request.setAttribute("login", "login successful");
					RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					rd.forward(request, response);
				}
			} else {
				request.setAttribute("msg", "invalid credentials");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
				System.out.println("Emp null");
			}
		}
	}

}
