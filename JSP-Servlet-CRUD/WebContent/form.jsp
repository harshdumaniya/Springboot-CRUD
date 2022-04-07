<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add/Update Employee Form</title>
			<style>
				@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');
				*{
				  margin: 0;
				  padding: 0;
				  box-sizing: border-box;
				  font-family: 'Montserrat', sans-serif;
				}
				body{
				  background: #25366e;
				  padding: 0 10px;
				}
				.wrapper{
				  max-width: 500px;
				  width: 100%;
				  background: #fff;
				  margin: 50px auto;
				  box-shadow: 2px 2px 4px rgba(0,0,0,0.125);
				  padding: 30px;
				}
				.wrapper .title{
				  font-size: 24px;
				  font-weight: 700;
				  margin-bottom: 25px;
				  color: #25366e;
				  text-transform: uppercase;
				  text-align: center;
				}
				.wrapper .form{
				  width: 100%;
				}
				.wrapper .form .inputfield{
				  margin-bottom: 15px;
				  display: flex;
				  align-items: center;
				}
				.wrapper .form .inputfield label{
				   width: 200px;
				   color: #757575;
				   margin-right: 10px;
				  font-size: 14px;
				}
				.wrapper .form .inputfield .input,
				.wrapper .form .inputfield .textarea{
				  width: 100%;
				  outline: none;
				  border: 1px solid #d5dbd9;
				  font-size: 15px;
				  padding: 8px 10px;
				  border-radius: 3px;
				  transition: all 0.3s ease;
				}
				.wrapper .form .inputfield .textarea{
				  width: 100%;
				  height: 125px;
				  resize: none;
				}
				.wrapper .form .inputfield .custom_select{
				  position: relative;
				  width: 100%;
				  height: 37px;
				}
				.wrapper .form .inputfield .custom_select:before{
				  content: "";
				  position: absolute;
				  top: 12px;
				  right: 10px;
				  border: 8px solid;
				  border-color: #d5dbd9 transparent transparent transparent;
				  pointer-events: none;
				}
				
				.wrapper .form .inputfield .custom_select select{
				  -webkit-appearance: none;
				  -moz-appearance:   none;
				  appearance:        none;
				  outline: none;
				  width: 100%;
				  height: 100%;
				  border: 0px;
				  padding: 8px 10px;
				  font-size: 15px;
				  border: 1px solid #d5dbd9;
				  border-radius: 3px;
				}
				.wrapper .form .inputfield .input:focus,
				.wrapper .form .inputfield .textarea:focus,
				.wrapper .form .inputfield .custom_select select:focus{
				  border: 1px solid #fec107;
				}
				
				.wrapper .form .inputfield p{
				   font-size: 14px;
				   color: #757575;
				}
				.wrapper .form .inputfield .check{
				  width: 15px;
				  height: 15px;
				  position: relative;
				  display: block;
				  cursor: pointer;
				}
				.wrapper .form .inputfield .check input[type="checkbox"]{
				  position: absolute;
				  top: 0;
				  left: 0;
				  opacity: 0;
				}
				.wrapper .form .inputfield .check .checkmark{
				  width: 15px;
				  height: 15px;
				  border: 1px solid #fec107;
				  display: block;
				  position: relative;
				}
				.wrapper .form .inputfield .check .checkmark:before{
				  content: "";
				  position: absolute;
				  top: 1px;
				  left: 2px;
				  width: 5px;
				  height: 2px;
				  border: 2px solid;
				  border-color: transparent transparent #fff #fff;
				  transform: rotate(-45deg);
				  display: none;
				}
				.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark{
				  background: #fec107;
				}
				.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark:before{
				  display: block;
				}
				.wrapper .form .inputfield .btn{
				  width: 100%;
				   padding: 8px 10px;
				  font-size: 15px; 
				  border: 0px;
				  background:  #25366e;
				  color: #fff;
				  cursor: pointer;
				  border-radius: 3px;
				  outline: none;
				}
				.wrapper .form .inputfield:last-child{
				  margin-bottom: 0;
				}
				@media (max-width:420px) {
				  .wrapper .form .inputfield{
				    flex-direction: column;
				    align-items: flex-start;
				  }
				  .wrapper .form .inputfield label{
				    margin-bottom: 5px;
				  }
				  .wrapper .form .inputfield.terms{
				    flex-direction: row;
				  }
				}
			</style>
	</head>
	<body>
		<div class="wrapper">
    		<div class="title">
     			Add/Update Employee Form
    		</div>
			<c:if test="${employee != null}">
				<form action="update" method="post">
			</c:if>
			<c:if test="${employee == null}">
				<form action="insert" method="post">
			</c:if>

			<c:if test="${employee != null}">
				<input type="hidden" name="id"
					value="<c:out value='${employee.id}' />" />
			</c:if>
			
			<div class="form">
      			<div class="inputfield">
					<label>First Name</label>
						<input type="text" value="<c:out value='${employee.firstName}' />" name="firstName" pattern="^[A-Za-z]*(([,.] |[ '-])[A-Za-z][a-z]*)*(\.?)$" minlength="3" maxlength="30"  title="Numbers are not allowed in first name" required><br>
				</div>
				<div class="inputfield">
					<label>Last Name</label>
						<input type="text" value="<c:out value='${employee.lastName}' />" name="lastName" pattern="^[A-Za-z]*(([,.] |[ '-])[A-Za-z][a-z]*)*(\.?)$" minlength="3" maxlength="30"  title="Numbers are not allowed in last name" required><br>
				</div>
				<div class="inputfield">
					<label>Email</label>
						<input type="email" value="<c:out value='${employee.email}' />" name="email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" title="Please enter valid email address" required><br>
				</div>
				<div class="inputfield">
					<label>Mobile No</label>
						<input type="mobileNo" value="<c:out value='${employee.mobileNo}' />" name="mobileNo" minlength="10" pattern="[789][0-9]{9}" titlr="mobile number must be start with 7 to 9 and 10 digits only" required><br>
				</div>
				<div class="inputfield">
					<label>Date Of Birth</label>
						<input type="date" value="<c:out value='${employee.dateOfBirth}' />" name="dateOfBirth" required><br>
				</div>
				<div class="inputfield">
					<label name="gender" value="<c:out value='${employee.gender}' />">Gender</label>
						<input type="radio"  name="gender" value="Male" title="Please select atleast one option" required>Male&nbsp&nbsp&nbsp
						<input type="radio" name="gender" value="Female" title="Please select atleast one option" required>Female<br>
				</div>
				<div class="inputfield">
					<label>City</label>
						<input type="text" value="<c:out value='${employee.city}' />" name="city" required="required"><br>
				</div>
				<div class="inputfield">
					<label>Age</label>
						<input type="number" value="<c:out value='${employee.age}' />" name="age" minlenth="1" maxlength="3" title="Please enter valid age" required><br>
				</div>
				<div class="inputfield">		
					<label>Salary</label>
					<input type="number" value="<c:out value='${employee.salary}' />" name="salary" required><br>
				</div>
				<div class="inputfield">
					<button type="submit" class="btn">Save</button>
				</div>
				</div>
			</form>
	</body>
</html>