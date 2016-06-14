<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Student</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style type="text/css">
  table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}

</style>
<style>#rcorners1 {
    border-radius: 25px;
    background: #4CAF50;
    padding: 20px; 
    width: 800px;
    height: 100px;    
}</style>
</head>
<body class="container">
<center><h1><p id="#rcorners1">Hello ${useris.lname}, ${useris.fname}</p></h1></center><br><br><br><div align="right"><a href="logout.html" class="btn btn-primary" role="button">Logout</a></div>
 <br><br>
 
 <table class="table table-bordered">
    <thead>
		<tr>
<th>Submission Date</th>
<th>Department Name</th>
<th>Program Name</th>
<th>Term</th>
<th>Status</th>
<th>Detail</th>
<th>Edit Application</th>

</tr>
</thead>
          <tbody>


<c:forEach items="${application}" var="app">
 		<tr>
<td>${app.appstatus.recordtime} </td>
<td>${app.program.dept.name}</td>
<td>${app.program.programs}</td>
<td>${app.term}  </td>
<td>
	<c:choose>	
		<c:when test="${app.appstatus.getValue()=='doEdit'}">Not Submitted</c:when>
		<c:otherwise>Submitted</c:otherwise>
	</c:choose>
</td>
<td><a href="Detail.html?app_Id=${app.id}">Detail</a></td>
<td><c:if test="${app.appstatus.getValue()=='doEdit'}"><a href="EditUpload.html?appid=${app.id}">Edit</a></c:if></td>

</tr>
</c:forEach>
</tbody>
</table>
<h3><a href="upload.html?user_id=${param.user_id}&&student_id=${param.student_id}">Add Application</a></h3>

</body>
</html>