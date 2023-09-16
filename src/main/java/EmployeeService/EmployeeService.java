package EmployeeService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import Entities.Employee;

public class EmployeeService {
	public static List<Employee> list = new ArrayList<>();

	public void initilaizeEmployee() {
		System.out.println("Initailzing employee");
		Employee e1 = new Employee();
		e1.setFirstName("Abhi");
		e1.setLastName("Patidar");
		e1.setId(1);
		e1.setAdmine(true);
		e1.setUserName("aaa");
		e1.setPasswrod("123");
		e1.setSalary(67808f);

		Employee e2 = new Employee();
		e2.setFirstName("kartik");
		e2.setLastName("Patidar");
		e2.setId(2);
		e2.setAdmine(false);
		e2.setUserName("bbb");
		e2.setPasswrod("456");
		e2.setSalary(1234f);

		Employee e3 = new Employee();
		e3.setFirstName("Khus");
		e3.setLastName("Patidar");
		e3.setId(3);
		e3.setAdmine(false);
		e3.setUserName("ccc");
		e3.setPasswrod("789");
		e3.setSalary(3456.0f);
		list.add(e1);
		list.add(e2);
		list.add(e3);
	}

	public Employee validateEmployee(String userName, String password) {
		System.out.println("Empo list" + list);
		Optional<Employee> emOptional = list.stream()
				.filter(a -> a.getUserName().equals(userName) && a.getPasswrod().equals(password)).findFirst();
		if (emOptional.isPresent()) {
			return emOptional.get();
		}
		return null;
	}

	public List<Employee> getListOfEmployee() {
		return list;
	}

	public String addEmployee(Employee employee) {
		if (employee != null) {
			list.add(employee);
			return "success";
		}
		return "fail";
	}

	public Employee getEmployeeById(int id) {
		Employee employee = list.stream().filter(a -> a.getId() == id).findFirst().orElse(null);
		return employee;
	}

	public String editEmployee(Employee employee) {
		int id = employee.getId();
		list.stream().filter(a -> a.getId() == id).forEach(emp -> {
			emp.setFirstName(employee.getFirstName());
			emp.setLastName(employee.getLastName());
			emp.setPasswrod(employee.getPasswrod());
			emp.setUserName(employee.getUserName());
			emp.setSalary(employee.getSalary());
			emp.setAdmine(employee.isAdmine());
		});
		list.forEach(System.out::println);
		return "success";
	}

	public String deleteEmployeeById(int id) {
		Optional<Employee> employeeOpt = list.stream().filter(a -> a.getId() == id).findFirst();
		if (employeeOpt.isPresent()) {
			Employee emp = employeeOpt.get();
			if (!emp.isAdmine()) {
				list.removeIf(a -> a.getId() == emp.getId());
				return "success";
			} else {
				return "admin";
			}
		} else
			return "fail";

	}

}
