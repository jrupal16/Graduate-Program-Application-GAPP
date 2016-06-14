<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background-image: url("lo.jpg");

}
#rcorners6 {
    border-radius: 15px 50px;
    background: #4CAF50;
    padding: 15px; 
    width: 200px;
    height: 80px; 
} 
.center {
    border-radius: 15px;
    margin: auto;
    width: 700px;
    border: 3px solid #4CAF50;
    padding: 5px;
}
.button {
    background-color: #4CAF50;
    border-radius: 10px 50px;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>
  <center><h1><p id="rcorners6">Login</p></h1></center><br><br><br>

<div class="center"><br>
  <form class="form-horizontal" role="form" method ="post" action="Login.html">
    <div class="form-group">
      <label class="control-label col-sm-4" for="email"><font font size="4" color="#4CAF50">Email:</font></label>
      <div class="col-sm-6">
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pwd"><font font size="4" color="#4CAF50">Password:</font></label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pwd" name="password" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-4 col-sm-10">
        <button type="submit" class="button">Login</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href = "Registration.html"><button type="button" class="button">Sign Up</button> </a>
      </div>
    </div>
  </form>
</div>

</body>
</html>