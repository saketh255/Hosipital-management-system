<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Consulation</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<style>

html {
 
   height: 100%;
}

body {
	background: linear-gradient(to bottom, #fffbd5, #b20a2c);
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: "century gothic", "Courier New", monospace;
}
#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #fffbd5;
}



.split {
  width: 30%;
  position: absolute;
  z-index: 1;
  top: 20%;
  overflow-x: hidden;
  padding-top: 20px;
}

.left {
  left: 0;
  background-color: #fff;
}

.right {
  right: 5%;
  background: transparent;
}

.form-box{
    width: 30%;
    position:relative;
    margin-left: 13%;
    margin-top: 4%;
    background: transparent;
}

input[type=text], input[type=number], select {
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
	background-color: #b20a2c;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=logout] {
	width: 10%;
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	float: right;
	text-align: center;
}
.button {
	width: 20%;
	margin-bottom: 10%;
	background-color: #f1dd9d;
	padding: 14px 20px;
	margin: 8px 0;
	border-color:#eaafc8;
	border-radius: 10px;
	cursor: pointer;
	float: right;
	text-align: center;
}


input[type=submit]:hover {
	background-color: #eaafc8;
	color: black;
	transition: 0.5s;
}

input[type=logout]:hover {
	background-color: #eaafc8;
	color: black;
	transition: 0.5s;
}

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
box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
    transition: 2s;
    padding: 4%;
}

table, th, td {
  border: 1px solid black;
}
</style>
</head>
<body>
 
<center><h1>${patient.name}</h1></center>
<div class="split right">


<div class="gallery" id="gal">
<div class="card">
<img src="photos/patient.jpg" alt="Patient" style="width:100%">
<div class="container">

<h4><b>Patient id : ${patient.iD}</b></h4>
<h4><b>Name : ${patient.name}</b></h4>
<h4><b>Age : ${patient.age}</b></h4>
<h4><b>Gender : ${patient.gender}</b></h4>

</div>
</div>
</div>

</div>
<div class="form-box">

<form action="/addPrescription" name="addPrescription">
  <label for="patientid"></label>
  <input type="text" style="display:none" id="patientid" name="patient" value="${patient.name}" required>
  <label for="Doctorid"></label>
  <input type="text" style="display:none" id="Doctorid" name="doctor" value="${doctor.name}" required>

<label for="appointmentId"></label><br>
  <input type="text" style="display:none" id="appointmentId" name="appointmentId" value="${appointment.applicationId}" required>

  <label for="Medicine">Medicine</label><br>
  <select id="Medicine" name="medicine" required>
			<c:forEach items="${list}" var="entry">
				<option value="${entry.name}">${entry.name}</option>
			</c:forEach>
		</select> <br><br>
  <label for="Medicineqty">Medicine Quantity</label><br>
  <input type="number" min="0" id="Medicineqty" name="quantity" required><br><br>
  <textarea style="border: transparent; border-radius: 3px" name="notes" id="addPrescription" placeholder="Doctor's instructions" cols="54" rows="4"></textarea><br><br>

  <input type="submit" value="Submit"><br><br>
</form> 

<div>
<table id="customers">
<tr>
        <th>Medicine Id</th>
        <th>Medicine Name</th>
    </tr>
<c:forEach items="${list}" var="entry">
    <tr>
            <td>${entry.id}</td>
            <td> ${entry.name} </td>
    </tr>
</c:forEach>
</table>
</div>

</div>


<a href="/generatePrescription?AppointmentId=${appointment.applicationId}">
<button class="button">Generate Prescription</button>
</a>
<br><br><br>

<button  onclick="history.back(-1)" class="button">Cancel</button>
<br><br><br><br><br><br><br><br><br>

</body>
</html>