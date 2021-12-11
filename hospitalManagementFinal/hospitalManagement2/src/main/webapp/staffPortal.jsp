<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Portal</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>


<style>
body {
	display: block;
	margin: auto;
	background: linear-gradient(to right, #c9d6ff, #e2e2e2);
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: "century gothic", "Courier New", monospace;
}

.form-container {
  max-width: 80%;
  padding: 5%;
  background-color: white;
  text-align: center;
}

.form-container input[type=text], .form-container input[type=password], .form-container select, .form-container input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}
.form-container .btn {
  background-color: #c9d6ff;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}
/********************************/
* {
	box-sizing: border-box;
}


.rowbox{
	padding-left:10%;
	padding-right:10%;
}

/* Float four columns side by side */
.column {
	float: left;
	width: 50%;
	padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {
	margin: 10px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}

/* Style the counter cards */
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	text-align: center;
	background-color: #f1f1f1;
}

/********************************/

.h {
  text-decoration: none;
}
.h:hover {
  border: 1px solid #777;
box-shadow: 0 10px 30px 0 rgb(0 0 0 / 20%);
 transition-duration: 0.5s;
/*transform: rotate(10deg);*/
 transform: scale(1.02,1.02);
transform-origin: 20% ;

}



a{
  color: #9966CC;
  background-color: transparent;
  text-decoration: none;
}
/*a:visited {
  color: blue;
  background-color: transparent;
  text-decoration: none;
}*/
a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}
a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}

/********************************/

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
	background-color: #9966CC;
	color: black;
	transition: 0.5s;
}



#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 110%;
	align: center;
	margin: 15%;
	margin-top:0;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #3a6186;
	color: white;
}

.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 30px;
	cursor: pointer;
	background-color: #003366;
	float: right
}

.button1 {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 30px;
	cursor: pointer;
	background-color: #003366;
}

.form-popup {
  display: none;
  margin: 0;
  width:100%;
  height:100%;
  position: relative;
  background: transparent;
  z-index: 9;
  text-align: center;
}


</style>

</head>


<body>


	<div  id="main" >
		<a href="/home"><input type="logout" value="BACK"></a>
<div>
<center><h1>WELCOME</h1></center>

</div>
<br><br>

		<div class="rowbox">
			<div class="row">
				<div class="column">
					

		<form action="/addPatient" class = "form-container">
			
			<h3>New Patient</h3>
			<input type="text" name="Name" placeholder="Name" required><br>
			<input type="number" min="0" name="Age" placeholder="Age" required><br>
			<input type="text" name="Address" placeholder="Address" required><br>
			<input type="text" name="Contact" placeholder="Contact" pattern="[1-9]{1}[0-9]{9}" required=""><br> 
			<select name="Gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                </select><br>
			<!-- <input type="text" name="Gender" placeholder="Gender" required><br>  -->
			<input class = "form-container btn" type="submit" value="Add">
		</form>



	</div>

				<div class="column">

					<form class = "form-container" style = "margin-top: 45%">
					<h3>Existing patients</h3><br><br>
					<input class = "form-container btn"  onclick="openPatients()" value="BOOK APPOINTMENTS">
						</form>
						<br><br><br><br><br>
					</div>
				</div>
	
			</div>
		</div>


<div>
    <table id="customers" style ="display: none">
			<tr>
				<th>Patient Id</th>
				<th>Name</th>
				<th>Age</th>
				<th>Address</th>
				<th>Phone Number</th>
				<th>Gender</th>
				<th></th>
			</tr>
		
			<c:forEach items="${patientList}" var="entry">
				<tr>
					<td>${entry.iD}</td>
					<td>${entry.name}</td>
					<td>${entry.age}</td>
					<td>${entry.address}</td>
					<td>${entry.contact}</td>
					<td>${entry.gender}</td>
					<td><a href="bookAppointment?username=${entry.name}"><button class="button1">Book appointment</button></a></td>
				</tr>
			</c:forEach>	
</table>

<script>
function openPatients() {
  var x = document.getElementById("customers");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
}
</script>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>