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
<form action="ForgetPassword" method="post">
<h1 align="center">Forgot Password?</h1>
<table align="center" cellspacing="20px">
<tr><td><input type="email" name="email" required id="mob"/></td></tr>
<tr><td><input type="number" name="mobile" required id="mobnum"/></td></tr><br/><br/>
<tr><td><input type="submit" value="Reset Password" /></td><td>
</table>
</form>
</div>
<script>
 document.getElementById("mob").placeholder="Enter the valid email";
 document.getElementById("mobnum").placeholder="Enter the valid Mobile no";
</script>
<style>
::placeholder { 
  color: red; 
}
<style>

</body>
</html>