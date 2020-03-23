<%! String email,name,imagepath; %>
<%
		if(session!=null)
		{
			if(session.getAttribute("username")!=null)
			{
				 name=(String)session.getAttribute("username");
				 email=(String)session.getAttribute("email");
			}
			else
			{
				response.sendRedirect("Login.jsp");
			}
		}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
<link rel="stylesheet" type="text/css" href="css/mail.css" /> 
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
<form action="SendMailServlet" method="post">
<%
	String path=request.getParameter("imgpath");
%>
<h1 align="center">Email Process</h1>
<table align="center" cellspacing="20px">


<tr><td><input type="email" name="to" placeholder="Enter the Reciver email" required /></td></tr>
<tr><td><input type="text" name="subject"  placeholder="Enter the subject" required /></td></tr>
<tr><td><textarea rows="5" cols="27" name="msg" placeholder="Enter the Message" ></textarea></td></tr>
<input type="hidden" name="path" value="<%=path %>" /><br/>
<tr><td><input type="submit" value="Send" /></td></tr>
<tr><td><a href="Home.jsp" class="btn success" style="text-decoration:none">BACK</a></td></tr>

</table>
</form>
</div> 
</body>
</html>