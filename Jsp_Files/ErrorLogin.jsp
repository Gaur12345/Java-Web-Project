<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/login.css" rel="stylesheet">
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
</head>
<body>
	<div class="login-box">
<img src="css/avatar.png" class="avatar">
<h1>Login Here</h1>
<form action="LoginServlet" method="post">
<p>Email</p>
<input type="email" name="email" id="email"/>
<p>Password</p>
<input type="password" name="password" placeholder="Enter your password">
<br><input type="submit" name="submit" value="login"></br>
<a href="Forgetp.jsp">Forget Password</a>
</form>
</div>
<script>
	document.getElementById("email").placeholder = "Enter the valid email or password";
</script>
<style>
::placeholder { 
  color: red; 
}
<style>
</body>
</html>