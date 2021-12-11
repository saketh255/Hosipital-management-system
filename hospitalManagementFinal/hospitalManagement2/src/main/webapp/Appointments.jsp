<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>
<style>
body {
	display: block;
	margin: 20px;
	background: linear-gradient(to bottom, #fffbd5, #b20a2c);
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: "century gothic", "Courier New", monospace;
}

.button {
	border: none;
	padding: 15px 32px;
	text-align: center;
	text-decoration: bold;
	display: inline-block;
	font-size: 16px;
	margin: 4px 50px;
	cursor: pointer;
	background-color: #ccc;
	width:80%;
}

.button:hover {
	background-color: #fffbd5;
	transition: 0.5s;
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
	background-color: #b20a2c;
	color: white;
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

input[type=logout]:hover {
	background-color: #b20a2c;
	transition: 0.5s;
}
.viewBtn {
background-color: #b20a2c;
color: white;
width: 5%;
height: 4%;
}

</style>
</head>
<body>
<a href="/home"><input type="logout" value="LOGOUT"></a><br><br>

<div>
<br>
<br>
<center><h1>Doctor Portal</h1></center>
<center><h2>Welcome ${username}</h2></center>
</div>
<br>
<h1>Appointments</h1>

<table id="customers">
<tr>
        <th>Appointment No.</th>
        <th>Patient Id</th>
        <th>Preferred Time</th>
	<th></th>
    </tr>
<c:forEach items="${list}" var="entry">
    <tr>
            <td>${entry.applicationId}</td>
            <td> ${entry.patientId} </td>
            <td>${entry.applicationTime}</td>
	    <td><a href="consultation?appointmentId=${entry.applicationId}"><button class="button">CONSULT</button></a></td>
    </tr>
</c:forEach>
</table>
</body>

<script type="text/javascript">

function hideView() {
	  document.getElementById("view").style.display = "none";
	}
	


</script>
</html>