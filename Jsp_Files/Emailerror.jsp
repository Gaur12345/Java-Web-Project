<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/csss.css">
<link rel="text/javascript" href="MyScript.js" >
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
</head>
<body>
	   <form action="RegistrationServlet" method="post">
		<div class="header">
			<h2>Register</h2>
		</div>
			<table align="center" cellspacing="30">
				<tr><td>Username</td><td><input type="text" name="username" required  width="300px" placeholder="Enter your full name"/></td></tr>
				<tr><td>DOB</td><td><input type="Date" name="dob" required /></td></tr>
				<tr><td>Gender</td><td><select required name="gender">
					<option>Select your option</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="other">Others</option>
	
				</select></td></tr>
				<tr><td>Email</td><td><input type="email" name="email" required placeholder="Email is also register"/></td></tr>
				<tr><td>Password</td><td><input type="password" name="password" required placeholder="Enter your password"/></td></tr>
				<tr><td>Mobile-No</td><td><input type="number" name="mobile" id="mobnumber" required placeholder="Enter your contact no."/></td><td><span id="num1" style="color:red"></span></td></tr>
				<tr><td><input type="submit" value="signup" onclick="validateNumber();" /></td><td><button><a href="Login.jsp" style="text-decoration:none;">Login</a></button></td></tr>
				
			</table>
		</form>
		
		<script src="E:\Bootstrap\js\jquery-3.3.1.js"></script>
		<script src="E:\Bootstrap\js\bootstrap.min.js"></script>
		<script>
			function validateNumber()
			{
				var num=document.getElementById("mobnumber").value;
				var patt1=/^[0]?[6789]\d{9}$/;
				if(patt1.test(num))
				{
					
				}
				else
				{
					document.getElementById("num1").innerHTML="Enter the only 10 digit number";
					const element = document.querySelector('form');
					element.addEventListener('submit', event => {	
					event.preventDefault();
					});
					
				}
			}
		</script>
		<style>
			input[type="email"]::-webkit-input-placeholder {
			color: red !important;
			}
		</style>
</body>
</html>