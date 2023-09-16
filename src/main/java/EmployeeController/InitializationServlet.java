package EmployeeController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import EmployeeService.EmployeeService;

public class InitializationServlet extends HttpServlet {

	private EmployeeService service=new EmployeeService(); 
	@Override
	public void init() throws ServletException {
		service.initilaizeEmployee();
	}
	
	

}
