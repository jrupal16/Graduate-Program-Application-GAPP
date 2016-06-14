<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Department</title>
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
<div class="container"><br>
  <center><h1><font color="yellow">Add New Department</font></h1></center><div align="right"><a href="logout.html" class="btn btn-primary" role="button">Logout</a></div><br><br><br>
  <form class="form-horizontal" role="form" method ="post" action="AddDept.html">
    <div class="form-group">
      <label class="control-label col-sm-2"><font font size="4" color="grey">Department Name:</font></label>
      <div class="col-sm-6">
        <input type="department" class="form-control" id="department" name="department" placeholder="Enter department">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" name="add" value="add" class="btn btn-primary">ADD</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </div>
    </div>
  </form>
</div>

</body>
</html>