<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Program</title>
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
<div class="container">
  <center><h1><font color="yellow">Add Program</font></h1></center><div align="right"><a href="logout.html" class="btn btn-primary" role="button">Logout</a></div><br><br><br>

<form class="form-horizontal" role="form" action="AddProg.html" method="post">
<center><font font size="4" color="grey">Add Program To the<b> ${dep.name} </b>Department</font> </center> <br><br><br>
<div class="form-group">
      <label class="control-label col-sm-2"><font font size="4" color="grey">Program Name:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="programs" placeholder="Enter program"/>
 </div>
    </div>
 <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
      <button type="submit" name="add" value="add" class="btn btn-primary">ADD</button>
      
      
      </div></div>
<center><font font size="4" color="yellow">   Programs: </font><br />
<font font size="4" color="grey">
<c:forEach items="${dep.prog}" var="program">
${program.programs}<br/>
</c:forEach><br></font></center>
<input type="hidden" name="deptId" value="${param.deptId}" />




</form>
<h3><ul class="pager">

  <button type="button" class="btn">
<li><center><a href="AddInfo.html?deptId=${param.deptId}">Next</a></center></li></button>

</ul></h3>
</div>
</body>
</html>