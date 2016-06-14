<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EditApplication</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script>
  $(document).ready(function(){
		$('#degree').click(function()	{
			$("#add").append($('#addmore').clone().attr("id","rupal"));
			})

		
	})
  </script>
  </head>
  <style>
#rcorners1 {
    border-radius: 25px;
    background: #4CAF50;
    padding: 20px; 
    width: 800px;
    height: 100px;    
}
#rcorners2 {
    border-radius: 25px;
    border: 2px solid #4CAF50;
    padding: 10px; 
    width: 400px;
    height: 50px;    
}
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 11px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

</style>
  
<body class="container">

    <center><h2><p id="rcorners1">Edit Application</p></h2></center>
 <center><h3><p id="rcorners2">Personal Information</p></h3></center><br>


<form action="EditUpload.html" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Last Name:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="fname" value="${application.sinfo.lname}"/>
 </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">First Name:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="lname" value="${application.sinfo.fname}"/>
 </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">email:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="email" value="${application.sinfo.email}" required/>
 </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">CIN:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="cin" pattern="[0-9]+" value="${application.sinfo.cin}" required/>
 </div>
    </div>
   
     <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Citizenship:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="citizenship" value="${application.sinfo.citizenship}"/>
 </div>
    </div>
    
      <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Date of Birth:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="dob" value="${application.sinfo.dob}" required/>
 </div>
    </div>
    
      <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Phone Number:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="phone" pattern="[0-9]+" value="${application.sinfo.phone}" required/>
 </div>
    </div>
    
    
    <center><h3><p id="rcorners2">Application Info</p></h3></center><br>
    
    
    <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Term:</font></label>
      <div class="col-sm-6">
      <input type="text" class="form-control" name="term" value="${application.term}"/>
 </div>
    </div>
    
    <div class="form-group">
 <label class="control-label col-sm-4"><font font size="4" color="grey">Department Name:</font></label>
 <div class="col-sm-6">
${application.program.dept.name}
</div>
</div>



<div class="form-group">
<label class="control-label col-sm-4"><font font size="4" color="grey">Program:</font></label>
			<div class="col-sm-5">

<select selected="true" name="prog2" class="form-control dropdown-toggle" required>
<c:forEach items="${programs}"  var="appprog">
<option value="${appprog.programs}" <c:if test="${appprog.programs==application.program.programs}">selected</c:if>>${appprog.programs}</option>
</c:forEach>
</select></div>
</div>

<center><h3><p id="rcorners2">Educational BackGround</p></h3></center><br>


<c:forEach items="${application.degree}" var="app" >

<div id="add">
<div id="addmore">
<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Degree Earned:</font></label>
      <div class="col-sm-6">
        <input type="de" class="form-control" id="de" name="degreeearned" value="${app.degreeearned}" required/>
      </div>
    </div>

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">University Name:</font></label>
      <div class="col-sm-6">
        <input type="un" class="form-control" id="un" name="universityname" value="${app.universityname}" required/>
      </div>
    </div> 

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Field:</font></label>
      <div class="col-sm-6">
        <input type="Field" class="form-control" id="Field" name="field" value="${app.field}" required/>
      </div>
    </div>

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Time Period:</font></label>
      <div class="col-sm-6">
        <input type="tp" class="form-control" id="tp" name="timeperiod" value="${app.timeperiod}" required/>
      </div>
    </div>
        <h3><center><a href="DeleteDegree.html?degreeid=${app.id}&appliid=${param.appid}">Delete</a></center><br></h3>
    
</div>

    </div>

    </c:forEach>
       <center> <input type="button" id="degree" value="Add More Degree" class="button"> </center>
<center><h3><p id="rcorners2">Score</p></h3></center><br>

<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">GPA:</font></label>
      <div class="col-sm-6">
        <input type="gpa" class="form-control" id="gpa" pattern="[0-9]+([,\.][0-9]+)?" name="gpa" value="${application.records.gpa}" required/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">GRE:</font></label>
      <div class="col-sm-6">
        <input type="gre" class="form-control" id="gre" pattern="[0-9]+" name="gre" value="${application.records.gre}" required/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">TOEFL:</font></label>
      <div class="col-sm-6">
        <input type="toefl" class="form-control" id="toefl" pattern="[0-9]+" name="toefl" value="${application.records.toefl}" required/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4"><font font size="4" color="grey">Comment:</font></label>
      <div class="col-sm-6">
      <textarea rows="4" cols="50" id="comment" name="comment" value="${application.appstatus.comment}">${application.appstatus.comment}</textarea>
      </div>
    </div>
    
    
  <input type="hidden" name="appliid" value="${param.appid}"><center>
File: <input type="file" name="file" name="apid" value="${application.records.transcript}" required/>
</center>
<br><br>

   <center><input type="Submit" value="save" name="add" class="button"/>&nbsp;&nbsp;&nbsp;&nbsp;<button type="Submit" class="button">Submit</button></center>
   
    </form>
    </body>
</html>