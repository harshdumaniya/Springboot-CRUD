package com.jspservletcrud.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.jspservletcrud.model.Employee;
import com.jspservletcrud.util.DatabaseConnection;
import com.jspservletcrud.util.EmployeeQuery;

public class EmployeeDao extends EmployeeQuery {

	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultset = null;

	public void insertEmployee(Employee employee) throws SQLException {
		System.out.println(INSERT_EMPLOYEE_SQL);
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
			preparedStatement.setString(1, employee.getFirstName());
			preparedStatement.setString(2, employee.getLastName());
			preparedStatement.setString(3, employee.getEmail());
			preparedStatement.setLong(4, employee.getMobileNo());
			preparedStatement.setDate(5, employee.getDateOfBirth());
			preparedStatement.setString(6, employee.getGender());
			preparedStatement.setString(7, employee.getCity());
			preparedStatement.setInt(8, employee.getAge());
			preparedStatement.setFloat(9, employee.getSalary());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public Employee selectEmployee(long id) throws SQLException {
		Employee employee = null;
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
			preparedStatement.setLong(1, id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				Long mobileNo = rs.getLong("mobile_no");
				Date dateOfBirth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String city = rs.getString("city");
				Integer age = rs.getInt("age");
				Float salary = rs.getFloat("salary");
				employee = new Employee(id, firstName, lastName, email, mobileNo, dateOfBirth, gender, city, age, salary);
			}
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			if (resultset != null) {
				resultset.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return employee;
	}

	public List<Employee> selectAllEmployee() throws SQLException {

		List<Employee> employee = new ArrayList<>();
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String email = rs.getString("email");
				Long mobileNo = rs.getLong("mobile_no");
				Date dateOfBirth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String city = rs.getString("city");
				Integer age = rs.getInt("age");
				Float salary = rs.getFloat("salary");
				employee.add(new Employee(id, firstName, lastName, email, mobileNo, dateOfBirth, gender, city, age, salary));
			}
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			if (resultset != null) {
				resultset.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return employee;
	}

	public boolean updateEmployee(Employee employee) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
			preparedStatement.setString(1, employee.getFirstName());
			preparedStatement.setString(2, employee.getLastName());
			preparedStatement.setString(3, employee.getEmail());
			preparedStatement.setLong(4, employee.getMobileNo());
			preparedStatement.setDate(5, employee.getDateOfBirth());
			preparedStatement.setString(6, employee.getGender());
			preparedStatement.setString(7, employee.getCity());
			preparedStatement.setInt(8, employee.getAge());
			preparedStatement.setFloat(9, employee.getSalary());
			preparedStatement.setLong(10, employee.getId());
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean deleteEmployee(long id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
			statement.setLong(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

}