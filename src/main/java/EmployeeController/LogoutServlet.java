package EmployeeController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogoutServlet() {
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
		/*
		 * if(session!=null) { session.invalidate(); request.setAttribute("logout",
		 * "logout successful"); } response.sendRedirect(request.getContextPath() +
		 * "/login.jsp");
		 */

		if (session != null) {
			Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

			if (isAdmin != null && isAdmin) {
				// This is an admin session, perform admin logout actions
				session.invalidate();
				System.out.println("Session expire for admin");
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			} else {
				// This is a regular user session, perform user logout actions
				System.out.println("Session expire for user");
				session.invalidate();
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
			/*
			 * response.sendRedirect(request.getContextPath() + "/login.jsp");
			 */
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
