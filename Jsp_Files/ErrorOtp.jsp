<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Storage System</title>
<link rel="stylesheet" type="text/css" href="css/mail.css" /> 
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<style>
.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}

/* Green */
.success {
  border-color: #4CAF50;
  color: green;
}

.success:hover {
  background-color: #4CAF50;
  color: white;
}
.default:hover {
  background: #e7e7e7;
}
</style>
</head>
<body>
<div class="reset-box">
<form action="VerifyServlet" method="post">

<h1 align="center">Enter The OTP.Check On Email</h1>
<table align="center" cellspacing="20px">
<tr><td><input type="text" name="otp" placeholder="Enter the valid  OTP" required /></td></tr>
<tr><td><input type="submit" value="Verify" /></td></tr>

</table>
</form>
</div> 
<style>
::placeholder { 
  color: red; 
}
<style>

</body>
</html>