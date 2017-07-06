package model;

import java.sql.Date;

public class EmpDTO {
	
	int employee_id;
	String first_name;
	String last_name;
	String email;
	int job_id;
	int department_id;
	int salary;
	Date hire_date;
	
	
	public EmpDTO(){}


	public EmpDTO(int employee_id, String first_name, String last_name, String email, int job_id, int department_id,
			int salary, Date hire_date) {
		super();
		this.employee_id = employee_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.job_id = job_id;
		this.department_id = department_id;
		this.salary = salary;
		this.hire_date = hire_date;
	}


	public int getEmployee_id() {
		return employee_id;
	}


	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}


	public String getFirst_name() {
		return first_name;
	}


	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}


	public String getLast_name() {
		return last_name;
	}


	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getJob_id() {
		return job_id;
	}


	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}


	public int getDepartment_id() {
		return department_id;
	}


	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}


	public int getSalary() {
		return salary;
	}


	public void setSalary(int salary) {
		this.salary = salary;
	}


	public Date getHire_date() {
		return hire_date;
	}


	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}


	@Override
	public String toString() {
		return "EmpDTO [employee_id=" + employee_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", email=" + email + ", job_id=" + job_id + ", department_id=" + department_id + ", salary=" + salary
				+ ", hire_date=" + hire_date + "]";
	}
	
	
	
	
}
