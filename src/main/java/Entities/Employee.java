package Entities;

public class Employee {
	private int id;
	private String firstName;
	private String lastName;
	private String userName;
	private String passwrod;
	private boolean isAdmine;
	private float salary;

	public Employee() {
	}

	public Employee(int id, String firstName, String lastName, String userName, String passwrod, boolean isAdmine,
			float salary) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.passwrod = passwrod;
		this.isAdmine = isAdmine;
		this.salary = salary;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswrod() {
		return passwrod;
	}

	public void setPasswrod(String passwrod) {
		this.passwrod = passwrod;
	}

	public boolean isAdmine() {
		return isAdmine;
	}

	public void setAdmine(boolean isAdmine) {
		this.isAdmine = isAdmine;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}
	

	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", userName=" + userName
				+ ", passwrod=" + passwrod + ", isAdmine=" + isAdmine + ", salary=" + salary + "]";
	}
	

}
