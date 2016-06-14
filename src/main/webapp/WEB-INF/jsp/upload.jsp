<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Add Application</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
var programList;
$(document).ready(function(){
$(".P").change(function(){
	$('.clearThis').remove();
	console.log($(this).val())

	$.ajax({
		type:'post',
		url:'up.html',
		data:{
			dname:$(this).val()

		},

	}).done(function(response) {

		for(var i=0;i<(response).length;i++){
			$('.q').append("<option class='clearThis'>"+response[i].pname+"</option>");
		}

		})})});
</script>





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

  <script>
/*   var storedElement = $('#addmore').detach();
 */
  $(document).ready(function(){
		$('#degree').click(function()	{
			$("#add").append($('#addmore').clone().attr("id","rupal"));
			})

		
	})
  </script>


</head>
<body>

<div class="container">

    <center><h2><p id="rcorners1">Create New Application</p></h2></center>
 <center><h3><p id="rcorners2">Personal Information</p></h3></center><br>
 
 
<form name="myForm" action="upload.html" onsubmit="return validateForm()" method="post" enctype="multipart/form-data" class="form-horizontal" role="form" >


	<div class="form-group">
      <label class="control-label col-sm-2">Last Name:</label>
      <div class="col-sm-6">
        <input type="lname" class="form-control" id="lname" name="lname" placeholder="Enter Last Name">
      </div>
    </div>

	<div class="form-group">
      <label class="control-label col-sm-2">First Name:</label>
      <div class="col-sm-6">
        <input type="fname" class="form-control" id="fname" name="fname" placeholder="Enter First Name">
      </div>
    </div>


<div class="form-group">
      <label class="control-label col-sm-2">Email:</label>
      <div class="col-sm-6">
        <input type="Email" class="form-control" id="Email" name="email" placeholder="Enter Email" required/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Gender:</label>
            <div class="col-sm-6">
       <input type="radio" name="gender" value="male" checked="checked"> Male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female"> Female</center><br><br>
</div></div>
<div class="form-group">
      <label class="control-label col-sm-2">CIN:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="cin" pattern="[0-9]+" name="cin" placeholder="Enter Campus Identification Number" required/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">CitizenShip:</label>
      <div class="col-sm-6">
        <input type="CitizenShip" class="form-control" id="CitizenShip" name="citizenship" placeholder="Enter CitizenShip"/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">DateOF Birth:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" name="dob" placeholder="Enter Date Of Birth(mm/dd/yyyy)" required/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">Phone Number:</label>
      <div class="col-sm-6">
        <input type="pn" class="form-control" id="pn" pattern="[0-9]+" name="phone" placeholder="Enter Phone Number" required/>
      </div>
    </div>
<center><h3><p id="rcorners2">Application Info</p></h3></center><br>

<div class="form-group">
      <label class="control-label col-sm-2">Term:</label>
      <div class="col-sm-6">
        <input type="Term" class="form-control" id="Term" name="term" placeholder="Enter Term"/>
      </div>
    </div>
   
   <div class="form-group">
   
   <label class="control-label col-sm-2">Department:</label>
		   <div class="col-sm-4">
			<select class="P form-control dropdown-toogle"  name="deptname" required>
				<option>Select a Department</option>
						<c:forEach items="${department}"  var="dept">
					<option value="${dept.name}">${dept.name}</option>
					</c:forEach>
				</select>
				</div>
</div>
<div class="form-group">

<label class="control-label col-sm-2">Program:</label>
			<div class="col-sm-4">
				<select class="q form-control dropdown-toogle" name="progname" required>
					<option>Select a Program</option>
 					</select>
 					</div>
 					</div>

<center><h3><p id="rcorners2">Educational BackGround</p></h3></center><br>




<div id="add">
<div id="addmore">
<div class="form-group">
      <label class="control-label col-sm-2">Degree Earned:</label>
      <div class="col-sm-6">
        <input type="de" class="form-control" id="de" name="degreeearned" placeholder="Enter Degree Earned" required/>
      </div>
    </div>

<div class="form-group">
      <label class="control-label col-sm-2">University Name:</label>
      <div class="col-sm-6">
        <input type="un" class="form-control" id="un" name="universityname" placeholder="Enter University Name" required/>
      </div>
    </div> 

<div class="form-group">
      <label class="control-label col-sm-2">Field:</label>
      <div class="col-sm-6">
        <input type="Field" class="form-control" id="Field" name="field" placeholder="Enter Field" required/>
      </div>
    </div>

<div class="form-group">
      <label class="control-label col-sm-2">Time Period:</label>
      <div class="col-sm-6">
        <input type="tp" class="form-control" id="tp" name="timeperiod" placeholder="Enter Time Period" required/>
      </div>
    </div>
    
     </div>
    
    </div>
       <center> <input type="button" id="degree" value="Add More Degree" class="button"> </center>
   
    
    
    
    
    
    
    
<center><h3><p id="rcorners2">Score</p></h3></center><br>

<div class="form-group">
      <label class="control-label col-sm-2">GPA:</label>
      <div class="col-sm-6">
        <input type="gpa" class="form-control" pattern="[0-9]+([,\.][0-9]+)?" id="gpa" name="gpa" placeholder="Enter Grade Point Average" required/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">GRE:</label>
      <div class="col-sm-6">
        <input type="gre" class="form-control" id="gre" pattern="[0-9]+" name="gre" placeholder="Enter GRE Score" required/>
      </div>
    </div>
<div class="form-group">
      <label class="control-label col-sm-2">TOEFL:</label>
      <div class="col-sm-6">
        <input type="toefl" class="form-control" id="toefl" pattern="[0-9]+" name="toefl" placeholder="Enter TOEFL Score" required/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Comment:</label>
      <div class="col-sm-6">
      <textarea rows="4" cols="50" name="comment" name="coment" placeholder="Enter Comment"></textarea>
      </div>
    </div>
<input type="hidden" name="user_id" value="${param.user_id}"></input>
<input type="hidden" name="student_id" value="${param.student_id}"></input>

<center>
File: <input type="file" name="file" required/>
</center>
<br><br>

<center><input type="submit" value="save" name="add" class="button"/>&nbsp;&nbsp;&nbsp;&nbsp;<button type="Submit" class="button">Submit</button></center>
</form>
</div>
</body>
</html>