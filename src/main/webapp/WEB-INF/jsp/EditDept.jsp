<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Department</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style type="text/css">
body {
	background-image: url("lo.jpg");

}
</style>
</head>
<body>
<form class="form-horizontal" role="form" action="EditDept.html" method="post">
<center><h1><font color="yellow">Edit the Department Name</font></h1></center><div align="right"><a href="logout.html" class="btn btn-primary" role="button">Logout</a></div><br><br><br>

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Department Name:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="deptName" value="${department.name}" placeholder="Enter department">
 </div>
    </div>
<input type="hidden" name="deptId" value="${param.deptId}">
<input type="hidden" name="pId" value="5"/>

<br><br>
 <div class="form-group">        
      <div class="col-sm-offset-4 col-sm-6">
<button type="submit" name="save" value="save" class="btn btn-primary">SAVE</button>
      </div></div>




</form>
</body>
</html>