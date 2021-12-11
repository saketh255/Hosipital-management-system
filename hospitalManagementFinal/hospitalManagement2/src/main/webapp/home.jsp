<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<style>
body {
	display: block;
	margin: 0px;
	background: linear-gradient(to top, #9796f0, #ffffff);
	background-repeat: no-repeat;
	background-attachment: fixed;
	font-family: "century gothic", "Courier New", monospace;
}

/*********************************/

#main {
  transition: margin-left .5s;
  padding: 16px;
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
	width: 25%;
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
	padding: 16px;
	text-align: center;
	  background-color: transparent;
}

/********************************/

.h {
  text-decoration: none;
}
.h:hover {
  border: 1px solid #777;
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
 transition-duration: 0.5s;
/*transform: rotate(10deg);*/
 transform: scale(1.02,1.02);
transform-origin: 20% ;

}

/************************#551A8B******/

a{
  color: #003366;
  background-color: transparent;
  text-decoration: none;
}

a:hover{
color:#000;
}



/********************************/

</style>


</head>


<body>

<br> <br> 
<br> <br> 
<center><h1 style="color: #003366">Hospital Management System</h1></center>
<br> <br>
		<div class="rowbox">
			<div class="row">
				<div class="column">
					<a href='login?siteName=DoctorPortal.jsp'> <div class="card h ">
						
						<img src="photos/doctor.png" width="100%">
						<h3>Doctor Portal</h3>
					</div></a>
				</div>
				
				<div class="column">
					<a href="StaffPortal" ><div class="card h">
						
						<img src="photos/staffIcon.png" width="100%">
						<h3>Out patients(OP)</h3>
					</div></a>
				</div>


				<div class="column">
					<a href='login?siteName=Admin.jsp'><div class="card h">
						
						<img src="photos/admin.png" width="100%">
						<h3>Management Portal</h3>
					</div></a>
				</div>

				<div class="column">
					<a href='login?siteName=pharmacistPortal.jsp'><div class="card h">
						
						<img src="photos/pharmacist.png" width="100%">
						<h3>Pharmacist Portal</h3>
					</div></a>
				</div>

			</div>
		</div>



</body>
</html>