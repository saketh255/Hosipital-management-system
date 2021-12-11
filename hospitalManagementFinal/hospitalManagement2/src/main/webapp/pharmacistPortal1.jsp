<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<title>Pharmacist Portal</title>
<style>
body {
font-family: Arial, Helvetica, sans-serif;
 background: linear-gradient(to bottom, #654ea3, #eaafc8);
background-repeat: no-repeat;
background-attachment: fixed;
}

div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 180px;
  position: relative;
  margin-top: 40%;
  border-radius: 5px;
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

/* Add some padding inside the card container */
.container {
  padding: 2px 16px;
}

input[type=text], select, input[type=number] {
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
	background-color: #654ea3;
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

.form-box{
    width: 10%;
    height: 50%;
    position:relative;
    margin: 5%;
    background: #ffffff;
    padding: 3%;
    border-radius: 5px;
    text-align: center;
    margin-top: 7%;
}

.split {
  height: 54%;
  width: 34%;
  position: absolute;
  z-index: 1;
  top: 0;
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

</style>
</head>
<body>
	<a href="/home"><input type="logout" value="LOGOUT"></a><br><br>



<div class="split left form-box">
<form action="/addMedicine">
  
<h2>ADD A MEDICINE</h2>
<br>
  <input type="text" name="name" placeholder="Name" required><br>
  <input type="number" min="0" name="price" placeholder="Price" required><br>
  <input type="text" name="description" placeholder="Medicine description" required><br>
<br>
  <input type="submit" value="Submit">
</form>

</div>

<div class="split right form-box">
<form action="/removeMedicine">

<h2>REMOVE MEDICINE</h2>
  <br>
<input type="hidden"><br>
<input type="hidden"><br>
  <select name="id" required >
			<c:forEach var="listValue" items="${list}">
				<option value="${listValue.id}">${listValue.name} (${listValue.id})</option>
			</c:forEach>

<input type="hidden"><br>
<input type="hidden"><br>
<input type="hidden"><br>


  <input type="submit" value="Remove">
<br>


</form>
</div>


<c:forEach var="listValue" items="${list}">
<div class="gallery" id="gal">
<div class="card">
  <img src="photos/medicine.jpg" alt="Medicine" style="width:100%">
  <div class="container">
  		<p>Medicine id : ${listValue.id}</p> 
    <h4><b>Name : ${listValue.name}</b></h4> 
    <p>Price : Rs.${listValue.price}</p> 
    <p>${listValue.description}</p> 
  </div>
</div>
</div>
</c:forEach>
</body>
<script>
function init() {
	if(!("[[${alert}]]"==="[[]]")){
		alert("[[${alert}]]");
	}
}
init();

</script>
</html>