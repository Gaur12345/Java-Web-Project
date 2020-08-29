<%
	String image="";
	if(session.getAttribute("email")!=null && session.getAttribute("name")!=null)
	{
		image=(String)session.getAttribute("image");
		
	}
	else
	{
		response.sendRedirect("index.html");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	if(session.getAttribute("email")!=null)
	{
		session.removeAttribute("email");
		session.removeAttribute("name");
		session.invalidate();
		response.sendRedirect("Myindex.html");
	}
	
%>
	

</body>
</html>