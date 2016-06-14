<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Application Detail</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
#rcorners1 {
    border-radius: 25px;
    background: #73AD21;
    padding: 20px; 
    width: 800px;
    height: 100px;    
}
#rcorners2 {
    border-radius: 25px;
    border: 2px solid #73AD21;
    padding: 10px; 
    width: 400px;
    height: 50px;    
}

</style>
</head>
<body class="container">

    <center><h2><p id="rcorners1">Application Detail</p></h2></center>
    
     <center><h3><p id="rcorners2">Personal Information</p></h3></center><br>
    
<div class="form-horizontal">
<div class="form-group">
      <label class="control-label col-sm-2">Last Name:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.lname}
      </div>
    </div><br>
<div class="form-group">
      <label class="control-label col-sm-2">First Name:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.fname}
      </div>
    </div><br>
    <div class="form-group">
      <label class="control-label col-sm-2">Email:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.email}
      </div>
    </div><br>
    <div class="form-group">
      <label class="control-label col-sm-2">Gender:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.gender}
      </div>
    </div><br>
    <div class="form-group">
      <label class="control-label col-sm-2">CIN:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.cin}
      </div>
    </div><br>
    <div class="form-group">
      <label class="control-label col-sm-2">CitizenShip:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.citizenship}
      </div>
    </div><br>
    <div class="form-group">
      <label class="control-label col-sm-2">Date of Birth:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.dob}
      </div>
    </div><br>
    <div class="form-group">
      <label class="control-label col-sm-2">Phone Number:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.sinfo.phone}
      </div>
    </div><br>
    
    
    <center><h3><p id="rcorners2">Application Info</p></h3></center><br>
    
     <div class="form-group">
      <label class="control-label col-sm-2">Term:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.term}
      </div>
    </div><br>
     <div class="form-group">
      <label class="control-label col-sm-2">Department Name:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.program.dept.name}
      </div>
    </div><br>
     <div class="form-group">
      <label class="control-label col-sm-2">Program Name:</label>
      <div class="col-sm-6">
      ${ApplicationDetail.program.programs}
      </div>
    </div><br>
    
    <center><h3><p id="rcorners2">Educational BackGround</p></h3></center><br>
    
    <c:forEach items="${ApplicationDetail.degree}" var="appl" >
    
    
      <div class="form-group">
      <label class="control-label col-sm-2">Degree Earned:</label>
      <div class="col-sm-6">
${appl.degreeearned}
</div>
    </div><br> 
    <div class="form-group">
      <label class="control-label col-sm-2">University Name:</label>
      <div class="col-sm-6">
${appl.universityname}
      </div>
    </div><br>
 <div class="form-group">
      <label class="control-label col-sm-2">Field:</label>
      <div class="col-sm-6">
${appl.field}
</div>
    </div><br>
<div class="form-group">
      <label class="control-label col-sm-2">Time Period:</label>
      <div class="col-sm-6">
${appl.timeperiod}      
</div>
    </div><br>
 </c:forEach>
 <center><h3><p id="rcorners2">Score</p></h3></center><br>
 
 <div class="form-group">
      <label class="control-label col-sm-2">GPA:</label>
      <div class="col-sm-6">
${ApplicationDetail.records.gpa}
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">GRE:</label>
      <div class="col-sm-6">
${ApplicationDetail.records.gre}
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">TOEFL:</label>
      <div class="col-sm-6">
${ApplicationDetail.records.toefl}
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Comment:</label>
      <div class="col-sm-6">
${ApplicationDetail.appstatus.comment}
      </div>
    </div>
 
       
    <div class="form-group">
      <label class="control-label col-sm-2">File:</label>
      <div class="col-sm-6">
                  <a href="download.html?app_Id=${param.app_Id}"><h5>Transcript Download</h5></a>
</div>
    </div><br>
    
	</div>
</body>
</html>