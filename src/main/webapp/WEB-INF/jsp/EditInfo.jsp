<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Additional Info</title>
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
  <center><h1><font color="yellow">Edit Additional Info</font></h1></center><div align="right"><a href="logout.html" class="btn btn-primary" role="button">Logout</a></div><br>


<form class="form-horizontal" role="form" action="EditInfo.html" method="post">
<center><font font size="4" color="grey">Edit the field <b>${depart.name}</b> Department <br><br></font></center>


<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Field Name: </font></label>
      <div class="col-sm-6">
      <input class="form-control" type="text" name="fieldname" placeholder="Add Field Name"/></div></div>
      

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Field Value:</font></label>
             <div class="col-sm-6">
       
       <input class="form-control" type="text" name="typefieldvalue" placeholder="Field Value"/></div></div>
       
       
<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Requirement:</font></label>
                   <div class="col-sm-6">
      
       <input class="form-control" class="form-control" type="text" name="requirement" placeholder="Requirement"/></div></div>
       <div class="form-group">        
      <div class="col-sm-offset-4 col-sm-4">
<button type="submit" name="add" value="add" class="btn btn-primary">ADD</button>
</div></div>
<center><font font size="4" color="yellow">   Additional Info: </font><br />

       <font font size="4" color="grey">
       
<c:forEach items="${depart.depar}" var="departm">
${departm.fieldname},
${departm.typefieldvalue},
${departm.requirement}   <a href="DeleteInfo.html?infoId=${departm.id }&deptId=${param.deptId}">Delete</a><br>
</c:forEach></font></center>
<input type="hidden" name="deptId" value="${param.deptId}" />





</form>
<h3><ul class="pager">

  <button type="button" class="btn">
<li><center><a href="Admin.html">Finish</a></center></li></button></ul></h3></div>

</body>
</html>