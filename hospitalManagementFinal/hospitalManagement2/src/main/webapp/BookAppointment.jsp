	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book an appointment</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
body {
	display: block;
	margin: 30px;
	background-color: #A9C9FF;
	background-image: linear-gradient(180deg, #A9C9FF 0%, #FFBBEC 100%);
	font-family: "century gothic", "Courier New", monospace;
}

.button {
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 50px;
  cursor: pointer;
  background-color: #3a6186;
float: right
}

input[type=text], input[type=date], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #3a6186;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #A9C9FF;
color: black;
transition: 0.5s;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

/***************************************/

div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 180px;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}

.card {
  /* Add shadows to create the "card" effect */
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/* Add some padding inside the card container */
.container {
  padding: 2px 16px;
}
.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 50px;
	cursor: pointer;
	background-color: #008CBA;
	float: right
}

input[type=logout] {
	width: 10%;
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 8px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	float: right;
	text-align: center;
}

input[type=logout]:hover {
	background-color: #3a6186;
	transition: 0.5s;
}
</style>
</head>
<body>
<a href="StaffPortal"><input type="logout" value="BACK"></a>

<center><h1>Book Appointment for ${patient.name} (${patient.iD})</h1></center>
<div>
  <form action="addAppointment" style="font-family: sans-serif">
    <input type="hidden" name="patientId" placeholder="Enter your patient Id" value="${patient.iD}">
    <label for="doctorId">Select Doctor</label>
<select id="doctorId" name="doctorId" required>
			<c:forEach var="listValue" items="${doctorList}">
				<option value="${listValue.doctorId}">Dr. ${listValue.name} (${listValue.doctorId})</option>
			</c:forEach>
		</select>
	<label for="applicationDate">Appointment Date</label>
	<input type="date" id="applicationDate" name="applicationDate" min="${min}" max="${max}" required><br>
	
    <label for="PreferredTime">Preferred Time</label>
    <select id="PreferredTime" name="applicationTime">
    <option value="9:00 AM to 10:00 AM">9:00 AM to 10:00 AM</option>
	<option value="10:00 AM to 11:00 AM">10:00 AM to 11:00 AM</option>
	<option value="11:15 AM to 12:00 PM">11:15 AM to 12:00 PM</option>
	<option value="02:00 PM to 03:00 PM">02:00 PM to 03:00 PM</option>
	<option value="03:00 PM to 04:00 PM">03:00 PM to 04:00 PM</option>
	<option value="04:15 PM to 05:00 PM">04:15 PM to 05:00 PM</option>
    </select>
  <br>
    <input type="submit" value="Submit">
  </form>
</div>
<script>
function init() {
	if(!("[[${alert}]]"==="[[]]")){
		alert("[[${alert}]]");
	}
}
init();
</script>
<c:forEach var="listValue" items="${doctorList}">
<div class="gallery" id="gal">
<div class="card">
  <img src="photos/avt.png" alt="Doctor" style="width:100%">
  <div class="container">
    <h4><b>Dr. ${listValue.name}</b></h4> 
    <h5>Doctor Id : ${listValue.doctorId} </h5>
    <p>${listValue.designation}</p> 
  </div>
</div>
</div>
</c:forEach>


<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>