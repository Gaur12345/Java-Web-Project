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
<%@ page import="java.sql.*" %>
<%@ page import="connDAO.ProjectConnection" %>
<%@ page import="connDAO.ShowFiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
<link rel="stylesheet" type="text/css" href="css/logout.css" />
</head>
<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 5px 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #008080;
}

.navbar a {
  float: right;
  color: #fff;
  font-style:italic;
  padding:0px 40px;
  text-align: center;
  height:42px;
  line-height:42px;
  text-decoration: none;
  
}

.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: #f20068;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
<body>
<tr>
	<td id="email" ><img src="useImage/emailiconex.png"  style="margin-left:600px;" height="20px" width="20px" /><label style="font-size:18px; color:white;" >info@filestorage.org</label><img src="useImage/contacticon.png" height="20px" width="20px"  /><label style="font-size:18px; color:white;" >+91-8987262019, +91-8877617734</label></td>

</tr>
<!--end of contact-->
<!--name area-->
<table id="bor" ><tr><td><img id="add" src="useImage/realfileFiles.jpg" height="120px" width="120px"  /></td><td style="font-size:35px;color:white;text-shadow:2px 4px 10px black;">File Storage System </br><span style="font-size:20px"></td></tr></table>

<!--end of contact area-->

<!-- start menu area -->
<div class="navbar">
 <a href="AboutUs.jsp">ABOUT US</a>
  <a href="Logout.jsp">LOGOUT</a>
   <div class="dropdown">
    <button class="dropbtn">DOWNLOAD FILES
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="DownloadImage.jsp">IMAGE  </a>
      <a href="DownloadPdf.jsp">PDF FILE</a>
      <a href="DownloadProgramFile.jsp">PROGRAM FILE</a>
      
    </div>
  </div> 

  <div class="dropdown">
    <button class="dropbtn">VIEW FILES 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="ViewFiles.jsp">IMAGE FILES</a>
      <a href="ShowPdf.jsp">PDF FILES</a>
      <a href="ShowProgramFile.jsp">PROGRAM FILES</a>
      
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">SHARE FILES
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="ShearImage.jsp">SHARE IMAGE </a>
      <a href="ShearPdf.jsp">SHARE PDF</a>
      <a href="ShearProgramFile.jsp">PROGRAM FILE</a>
      
    </div>
  </div>
  <a href="UploadFile.jsp">UPLOAD</a>
   <a href="Profile.jsp">PROFILE</a>
  <a href="Home.jsp">HOME</a>
</div>

<!--end of menu area-->
<div class="login-box">
<%
	ResultSet rs=null;
	rs=ShowFiles.showProgramfile(email);
	String email2=email;
	email=email+"/";
	String path;

	%>
	<br/>
	<% 
	try{
		while(rs.next())
		{
		imagepath=rs.getString("PROPATH");
		path=email+"ProgramFolder/"+imagepath;
		
	%>
	
	<object width="220" height="220" data="<%=path%>"></object>
	<a href="<%=path%>" class="button">View</a>
	

	<%	}
				
	}catch(Exception e)
	{
			e.printStackTrace();
	}
 %>
</body>
</html>