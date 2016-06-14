<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-image: url("re.jpg");
}
</style>
<script>
	function validateForm() {

		var x = document.forms["myForm"]["email"].value;
		if (x == null || x == "") {
			alert("Email must be filled out");
			return false;
		}
		var y = document.forms["myForm"]["password"].value;
		if (y == null || y == "") {
			alert("Password must be filled out");
			return false;
		}
		var z = document.forms["myForm"]["fname"].value;
		if (z == null || z == "") {
			alert("First Name must be filled out");
			return false;
		}
		var w = document.forms["myForm"]["lname"].value;
		if (w == null || w == "") {
			alert("Last Name must be filled out");
			return false;
		}

	}
</script>

</head>
<body>
	<div class="container">
		<br>
		<br>
		<center>
			<h2>Registration</h2>
		</center>
		<br>
		<br>
		<br>
		<br>
		<form:form modelAttribute="usersinfo" name="myForm"
			onsubmit="return validateForm()" class="form-horizontal" role="form"
			action="Registration.html" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email:</label>
				<div class="col-sm-7">
					<form:input path="email" type="email" class="form-control"
						id="email" name="email" placeholder="Enter email" />
					<c:choose><c:when test="${not empty param.error}">
						<h4 style="color: red;">Username already exists</h4>
					</c:when></c:choose>

					<form:errors path="email" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-7">
					<form:input path="password" type="password" class="form-control"
						id="pwd" name="password" placeholder="Enter password" />
					<form:errors path="password" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="fname">First
					Name:</label>
				<div class="col-sm-7">
					<form:input path="fname" type="fname" class="form-control"
						id="fname" name="fname" placeholder="Enter First Name" />
					<form:errors path="fname" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="lname">Last Name:</label>
				<div class="col-sm-7">
					<form:input path="lname" type="lname" class="form-control"
						id="lname" name="lname" placeholder="Enter Last Name" />
					<form:errors path="lname" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" name="Registration" value="add"
						class="btn btn-primary">Register</button>
				</div>
			</div>
		</form:form>
	</div>

</body>
</html>