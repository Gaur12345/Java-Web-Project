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
<tr><td style="color:red" ><b>Message Send successfully</b></td></tr>
<tr><td><a href="Home.jsp" style="text-decoration:none;">Go To Home page</a></td><td><a href="SheImg.jsp" style="text-decoration:none;">Go To Back</a></td></tr>


</table>
</form>
</div> 
</body>
</html>