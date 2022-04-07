<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>Employee List</title>
			<style>
				table {
					width: 100%;
					border-collapse: collapse;
					border-radius: 10px;
					overflow: hidden;
				}
				span {
					font-size: 35px;
					font-weight: bold;
					word-break: normal;
				}
				td {
					border: 0px solid black;
					height: 20px;
					width: 50px;
					text-align: center;
					font-size: 14px;
					white-space: nowrap;
					font-family: Gotham, "Helvetica Neue", Helvetica, Arial, "sans-serif";
					padding: 15px 20px;
				}
				caption {
					text-align: right;
				}
				th {
					color: white;
					padding: 10px;
				}
				th:nth-child(odd) {
					background-color: #4f628e;
					align-content: center;
				}
				th:nth-child(even) {
					background-color: #2e4172;
					align-content: center;
				}
				tr:nth-child(2n) {
					background: #ececec;
				}
				tr:nth-child(2n-1) {
					background:  #dbdbdb;
				}
				td:nth-child(2n) {
					
					background:lightgray;
				}
				tr:nth-child(odd) td:nth-child(even) {
					background: #e7e7e7;
				}
				tr:nth-child(even) td:nth-child(even) {
					background: #f3f3f3;
				}
				a.add {
				 background-color: green;
				  color: white;
				  padding: 7px 11px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				}
				a {
					text-decoration: none;
				}
			</style>
	</head>
	<body>
	<br>
		<a href="<%=request.getContextPath()%>/new" class="add"><i class="fa fa-plus-circle" style="font-size:15px;color:white">&nbsp&nbsp</i>Add New Employee</a>
	<br><br>
		<table border="0">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Mobile No</th>
					<th>Date Of Birth</th>
					<th>Gender</th>
					<th>City</th>
					<th>Age</th>
					<th>Salary</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employee" items="${listEmployee}">
					<tr>
						<td><c:out value="${employee.firstName}" /></td>
						<td><c:out value="${employee.lastName}" /></td>
						<td><c:out value="${employee.email}" /></td>
						<td><c:out value="${employee.mobileNo}" /></td>
						<td><c:out value="${employee.dateOfBirth}" /></td>
						<td><c:out value="${employee.gender}" /></td>
						<td><c:out value="${employee.city}" /></td>
						<td><c:out value="${employee.age}" /></td>
						<td><c:out value="${employee.salary}" /></td>
						<td>
						<a href="edit?id=<c:out value='${employee.id}' />"><i class="fa fa-edit" style="font-size:25px;color:#0a2929"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="delete?id=<c:out value='${employee.id}' />"><i class="fa fa-trash-o" style="font-size:24px;color:#ff3333"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>