<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Admin Panel</title>

<style>
body {
	background: linear-gradient(to right, #c9d6ff, #e2e2e2);
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: "century gothic", "Courier New", monospace;
}

img {
	float: right;
}

input[type=text], select, input[type=password], input[type=number] {
	width: 75%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 50%;
	background-color: #3a6186;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #c9d6ff;
	color: black;
	transition: 0.5s;
}

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	align: center;
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
	background-color: #c9d6ff;
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

.adminBtn {
	width: 25%;
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
	background-color: #c9d6ff;
	color: black;
	transition: 0.5s;
}

.form-box {
	width: 10%;
	height: 10%;
	position: absolute;
	margin: 5%;
	background: #eee;
	padding: 1%;
	border-radius: 5px;
	text-align: center;
	margin-top: 5%;
}

.split {
	height: 54%;
	width: 34%;
	position: absolute;
	z-index: 1;
	overflow-x: hidden;
	padding-top: 20px;
}

.left {
	left: 0;
	background-color: #fff;
}

.right {
	right: 0;
	background-color: #fff;
}

.form-popup {
	display: none;
	position: relative;
	background: #eee;
	padding: 5%;
	border: 3px solid #f1f1f1;
	z-index: 9;
	text-align: center;
}
</style>

</head>
<body>

	<a href="/home"><input type="logout" value="LOGOUT"></a>

	<h1 style="color: #003366; margin-left: 34%">WELCOME
		ADMINISTRATOR!</h1>





	<div class="split left form-box">
		<form action="/addDoctor">
			<h2>ADD DOCTOR</h2>
			<input type="text" name="Name" placeholder="Name" required><br>
			<!-- <input type="text" name="departmentId" placeholder="Department ID" required><br> -->
			<select id="departmentId" name="departmentId" required>
				<c:forEach var="listValue" items="${departmentList}">
					<option value="${listValue.ID}">${listValue.name}</option>
				</c:forEach>
			</select><br> <input type="number" min="1000" name="Salary"
				placeholder="Salary" required><br> <input type="text"
				name="Contact" placeholder="Contact" pattern="[1-9]{1}[0-9]{9}"
				title="Enter contact number" required=""><br> <input
				type="text" name="Qualification" placeholder="Qualification"
				required><br> <input type="text" name="Designation"
				placeholder="Designation" required><br> <br>
				<input type="text" name="uname" placeholder="Doctor's username" required><br>
				<br>
								 <input	type="submit" value="Submit">
		</form>
	</div>

	<div class="split right form-box">
		<form action="/removeDoctor">
			<h2>REMOVE DOCTOR</h2>
			<br> <select id="doctorId" name="doctorId" required>
				<c:forEach var="listValue" items="${doctorList}">
					<option value="${listValue.doctorId}">${listValue.name}
						(${listValue.doctorId})</option>
				</c:forEach>
			</select><br>
			<br>
			<!-- <input type="text" name="doctorId" placeholder="Doctor ID" required><br><br> -->
			<br> <input type="submit" value="Remove"> <br> <br>



		</form>
	</div>

	<button style="margin-top: 30%; margin-left: 46%;" class="button1"
		onclick="openDoctor()">Doctors</button>

	<div class="form-popup" id="doctorList">
		<form class="form-container">
			<center>
				<h1>Our Doctors</h1>
			</center>

			<table id="customers">
				<tr>
					<th>Doctor Id</th>
					<th>Name</th>
					<th>Department Id</th>
					<th>Salary</th>
					<th>Phone Number</th>
					<th>Qualification</th>
					<th>Designation</th>
				</tr>
				<c:forEach items="${doctorList}" var="entry1">
					<tr>
						<td>${entry1.doctorId}</td>
						<td>${entry1.name}</td>
						<td>${entry1.departmentId}</td>
						<td>${entry1.salary}</td>
						<td>${entry1.contact}</td>
						<td>${entry1.qualification}</td>
						<td>${entry1.designation}</td>
					</tr>
				</c:forEach>
			</table>

		</form>
		<button class="button1" onclick="closeDoctor()">Close</button>
	</div>







	<div class="split left form-box">
		<form action="/addStaff">

			<h2>ADD STAFF</h2>



			<select id="departmentId" name="departmentId" required>
				<c:forEach var="listValue" items="${departmentList}">
					<option value="${listValue.ID}">${listValue.name}</option>
				</c:forEach>
			</select><br> <input type="text" name="name" placeholder="Name" required><br>
			<select name="Gender" required>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
			</select><br> <input type="text" name="address" placeholder="Address"
				required><br> <input type="text" name="contact"
				placeholder="Contact" pattern="[1-9]{1}[0-9]{9}" required=""><br>
			<input type="number" min="100" name="salary" placeholder="Salary"
				required><br> <input type="text" name="designation"
				placeholder="Designation" required><br> <br> <input
				type="submit" value="Submit">
		</form>
	</div>


	<div class="split right form-box">
		<form action="/removeStaff">
			<h2>REMOVE STAFF</h2>

			<select id="staffId" name="staffId" required>
				<c:forEach var="listValue" items="${staffList}">
					<option value="${listValue.staffId}">${listValue.name}
						(${listValue.staffId})</option>
				</c:forEach>
			</select><br>
			<br>
			<!-- <input type="text" name="staffId" placeholder="Staff ID" required>
			<br><br> -->
			<br> <input type="submit" value="Remove"><br>
			<br>





		</form>
	</div>

	<button style="margin-top: 30%; margin-left: 46%;" class="button1"
		onclick="openStaff()">Staffs</button>

	<div class="form-popup" id="staffList">
		<form class="form-container">
			<center>
				<h1>Staffs</h1>
			</center>

			<table id="customers">
				<tr>
					<th>Staff Id</th>
					<th>Department Id</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>Salary</th>
					<th>Designation</th>

				</tr>
				<c:forEach items="${staffList}" var="entry2">
					<tr>
						<td>${entry2.staffId}</td>
						<td>${entry2.departmentId}</td>
						<td>${entry2.name}</td>
						<td>${entry2.gender}</td>
						<td>${entry2.address}</td>
						<td>${entry2.contact}</td>
						<td>${entry2.salary}</td>
						<td>${entry2.designation}</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<button class="button1" onclick="closeStaff()">Close</button>
	</div>






	<div class="split left form-box">
		<form action="/addPharmacist">

			<h2>ADD PHARMACIST</h2>

			<input type="text" name="name" placeholder="Name" required><br>
			<input type="text" name="address" placeholder="Address" required><br>
			<input type="text" name="contact" placeholder="Contact"
				pattern="[1-9]{1}[0-9]{9}" required=""><br> <input
				type="number" min="100" name="salary" placeholder="Salary" required><br> <br>
				<input type="text" name="uname" placeholder="Pharmacist's username" required><br>
				<br>
			<br> <br> <input type="submit" value="Submit">
		</form>
	</div>

	<div class="split right form-box">
		<form action="/removePharmacist">
			<h2>REMOVE PHARMACIST</h2>

			<select id="id" name="id" required>
				<c:forEach var="listValue" items="${pharmacistList}">
					<option value="${listValue.id}">${listValue.name}
						(${listValue.id})</option>
				</c:forEach>
			</select><br>
			<br>
			<!-- <input type="text" name="id" placeholder="Pharmacist ID" required>
			<br><br>  -->
			<br> <input type="submit" value="Remove"><br>
			<br>





		</form>
	</div>

	<button style="margin-top: 30%; margin-left: 43%;" class="button1"
		onclick="openPharmacist()">Pharmacy staffs</button>

	<div class="form-popup" id="pharmacistList">
		<form class="form-container">
			<center>
				<h1>Pharmacy Staffs</h1>
			</center>

			<table id="customers">
				<tr>
					<th>Staff Id</th>
					<th>Name</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>Salary</th>

				</tr>
				<c:forEach items="${pharmacistList}" var="entry3">
					<tr>
						<td>${entry3.id}</td>
						<td>${entry3.name}</td>
						<td>${entry3.address}</td>
						<td>${entry3.contact}</td>
						<td>${entry3.salary}</td>
					</tr>
				</c:forEach>
			</table>
		</form>

		<button class="button1" onclick="closePharmacist()">Close</button>
	</div>
	<br>
	<br>
	<br>
	<div
		style="position: relative; padding: 2%; width: 25%; height: 65%; margin-left: 70%; text-align: center"
		class="form-popup" id="admin">
		<form class="form-container" action="/addAdmin">
			<center>
				<h1>Add Admin</h1>
			</center>

			<input type="text" name="username" placeholder="username" required><br>
			<br> <input type="password" name="password"
				placeholder="password" required><br> <br> </select><br>
			<br> <input style="width: 80%" type="submit" value="Submit">
		</form>
		<button style="width: 80%" class="button1" onclick="adminClose()">Close</button>
	</div>

	<br>
	<br>
	<button class="adminBtn" onclick="adminOpen()">Add new Admin</button>
	<br>
	<br>
	<br>
	




</body>



<script>
function init() {
	if(!("[[${alert}]]"==="[[]]")){
		alert("[[${alert}]]");
	}
}
init();
	
	function openDoctor() {
		document.getElementById("doctorList").style.display = "block";
	}

	function closeDoctor() {
		document.getElementById("doctorList").style.display = "none";
	}

	function openStaff() {
		document.getElementById("staffList").style.display = "block";
	}

	function closeStaff() {
		document.getElementById("staffList").style.display = "none";
	}

	function openPharmacist() {
		document.getElementById("pharmacistList").style.display = "block";
	}

	function closePharmacist() {
		document.getElementById("pharmacistList").style.display = "none";
	}

	function adminOpen() {
		document.getElementById("admin").style.display = "block";
	}

	function adminClose() {
		document.getElementById("admin").style.display = "none";
	}


</script>
</html>