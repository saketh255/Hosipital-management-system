<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en"><head>

  <meta charset="UTF-8">


  <title>Login</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
<style>

body{
background: linear-gradient(to bottom, #ba5370, #f4e2d8);
}

.form-box{
width: 400px;
height: 240px;
position:relative;
right: 50px;
margin: 10%auto;
background: #fff;
padding: 40px;
opacity: 80%;

}

.form-box:hover{
opacity: 100%;
transition: 2s;
}

.input-field{
width: 100%;
padding: 10px 0;
margin: 5px 0;
border-left: 0;
border-top: 0;
border-right: 0;
border-bottom: 1px solid #999;
outline: none;
background: transparent;

}

.submit-btn{
width: 50%;
height: 17%;
padding: 10px 30px;
cursor: pointer;
display: block;
margin: auto;
background: #D8BFD8;
border: 0;
outline: none;
border-radius: 5px;
font-size: 15px;
transition: .2s;
}

.button {
  background-color: white; 
  color: black; 
  border: 2px solid #ba5370;
}

.button:hover {
  background-color: #ba5370;
  color: white;

}

</style>
 </head>

<body>
<div class="form-box">
<form action="/loginCheck">
<h3 style="font-family:verdana; text-align: center;"><b>LOGIN</b></h3><br>
<input type="text" class="input-field" placeholder="Username" name="username" required>
<input type="password" class="input-field" placeholder="Password" name="password" required>
<input type="hidden" class="form-control" name="siteName" value="${site.siteName}">
<br><br><br>
<input type="submit" class="submit-btn button" title="Login" value="Login"> </form>

</div>

</body>

</html>