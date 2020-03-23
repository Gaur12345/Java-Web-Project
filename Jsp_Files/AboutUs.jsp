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
<link href="css/aboutus.css" rel="stylesheet">
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Sniglet');
</style>

</head>
<style>
.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 3px 6px;
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

<body>

<div class="team-section">
<h1>Gaurav Kumar</h1>

<span class="border"></span>
<div class="ps">
<a href="#p2"><img src="css/useImage/g.jpg" alt=""></a>
</div>
<div class="section" id="p2">
<span class="name">About Me</span>
<span class="border"></span>
<p>
Doing BCA from St.Xavier's college,Patna.
</p>
<!--</div>-->
<!--<div class="section" id="p2">-->
<span class="name">Features of this Web Application</span>
<span class="border"></span>
<p>
User can upload image of any format like jpg,jpeg,png.<br/>
Same applies to the file which user can upload in the form of pdf,program files.
It is secure and compatible and interactive for users.
</p>
<p>Contact Us : 9122711791</p>
<p>Email id :  gaurav.kk566@gmail.com</p>
</div>

<a href="Home.jsp" class="btn success" style="text-decoration:none" id="homepage">GO TO HOME</a>
</div>

</body>
</html>