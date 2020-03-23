<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
<link href="css/res.css" rel="stylesheet">
</head>
<body>
<div class="reset-box">
<form action="ComfirmPassword" method="post">
<h1 align="center">Reset Password</h1>
<table align="center" cellspacing="20px">
<tr><td><input type="password" name="" placeholder="Enter new password" id="newpass" required /></td></tr>
<tr><td><input type="password" name="newPassword" placeholder="confirm Password" id="conpass" required /></td><td><span id="notspass" style="color:red;"></span> </td></tr><br/>
<tr><td><input type="submit" value="Submit" onClick="checkPass();" /></td></tr>
</table>
</form>
</div>

<script>
	
	
	var password = document.getElementById("newpass")
	, confirm_password = document.getElementById("conpass");

function checkPass()
{
  if(password.value != confirm_password.value)
  {
    confirm_password.setCustomValidity("Passwords Don't Match");
  }
  else
  {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;	
</script>


</body>
</html>