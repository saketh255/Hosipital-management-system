<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prescriptiion</title>
</head>
<style>
body {
font-family: "century gothic", "Courier New", monospace;
}

.form-box{
    width: 85%;
    height: 100%;
    position:absolute;
    margin: 5%;
    background: #ccc;
    padding: 3%;
    border-radius: 10px;
    text-align: center;
}

.button {
float: right;
width: 10%;
height: 6%;
background-color: #cfcfcf;

border-radius: 3%;
}

#customers {

	border-collapse: collapse;
	width: 100%;
	align: center;
}

#customers td, #customers th {
	border: 1px solid black;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #cfcfcf;
}
</style>
<body>

<div class="form-box">
<center><h1><b>PRESCRIPTION</b></h1></center>
<br>
<h3>${patient.name}</h3>
<h3>Age: ${patient.age}</h3>
<h3>Gender: ${patient.gender}</h3>
<br>
<h3>Doctor : ${doctor}</h3>
<h3>Dated : ${date}<h3>
<br><br>

<table id="customers">
			<tr>
				<th>Medicine</th>
				<th>Quantity</th>
				<th>Doctor's instructions</th>
			</tr>
			<c:forEach items="${prescriptionList}" var="entry">
				<tr>
					<td>${entry.medicine}</td>
					<td>${entry.quantity}</td>
					<td>${entry.notes}</td>
				</tr>
			</c:forEach>
		</table>
</div>
<a href="/currentAppointment?doctorId=${appointment.doctorId}&appointmentId=${appointment.applicationId}">
<button class="button">BACK</button>
</a>
<button class="button" onclick="window.print()">PRINT</button>
</body>
</html>