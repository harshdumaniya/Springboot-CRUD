package com.jspservletcrud.util;

public class EmployeeQuery {

	protected static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee " + "  (first_name, last_name, email, mobile_no, date_of_birth, gender, city, age, salary) VALUES " + " (?, ?, ?, ?, ?, ?, ?, ?, ?);";
	protected static final String SELECT_EMPLOYEE_BY_ID = "select id, first_name, last_name, email, mobile_no, date_of_birth, gender, city, age, salary from employee where id =?";
	protected static final String SELECT_ALL_EMPLOYEE = "select * from employee";
	protected static final String DELETE_EMPLOYEE_SQL = "delete from employee where id = ?;";
	protected static final String UPDATE_EMPLOYEE_SQL = "update employee set first_name = ?, last_name = ?, email = ?, mobile_no = ?, date_of_birth = ?, gender = ?, city = ?, age = ?, salary = ? where id = ?;";

}