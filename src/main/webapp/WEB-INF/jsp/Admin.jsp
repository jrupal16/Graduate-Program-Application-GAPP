<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Department</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style type="text/css">
body {
	background-image: url("dp.jpg");

}
</style>
</head>
<body>
<div class="container">
<center><h2>LIST OF DEPARTMENTS</h2></center><div align="right"><a href="logout.html" class="btn btn-primary" role="button">Logout</a></div><br><br>
  <table class="table table-bordered">
    <thead>

		<tr>
			<th>Sr.No</th>
			<th>Department Name</th>
			<th>Program Name</th>
			<th>Edit Department</th>
						<th>Department Detail</th>
			
		</tr>
       </thead>
          <tbody>

 		<c:forEach items="${department }" var="admin">
 		<tr>
				<td>${admin.id}</td>
                <td>${admin.name}</td>
		        <td>
		
 		        <c:forEach items="${admin.prog }" var="p">
 		                  ${p.programs }<br>
 		        </c:forEach>
 		        </td>
 		
 		
 		         <td><a href="EditDept.html?deptId=${admin.id}">Edit</a></td>
				<td><a href="DeptDetail/${admin.id}.html">Detail</a></td>
	   </tr>
       </c:forEach>	
       </table>

<center><h2><a href="AddDept.html">ADD</a></h2></center></div>
	
</body>
</html>