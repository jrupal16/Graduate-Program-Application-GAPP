<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Department Detail</title>
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
<body background="de.jpg">
<div class="container">
<center><h1>Department Details</h1></center><br><br>
    
                <div class="panel panel-primary">
     
<div class="panel-heading">
  <table class="table table-bordered">

      <thead>
    
  		<tr>
			<th>Department Name</th>
			<th>Program</th>
			<th>Add Requirement</th>
		</tr>
	   </thead>
	   </div>
	   <div class="panel-body">
		<tbody>

		<tr>
			<td>${DepartmentDetail.name}</td>
			<td> <c:forEach items="${DepartmentDetail.prog }" var="prog">
	    
 		                  ${prog.programs }<br>
 		          </c:forEach></td>
 		
 		
 		
 		     <td> <c:forEach items="${DepartmentDetail.depar }" var="field">
	    
 		                  ${field.fieldname } ,
 		                  ${field.typefieldvalue } ,
 		                  ${field.requirement }<br>
 		      </c:forEach></td>
 		
 		
 		
		</tr></tbody></div>
	</table>
	       </div>         <div class="panel panel-primary"></div>
	</div>
	</div>
</body>
</html>