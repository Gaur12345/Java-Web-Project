<%
		if(session!=null)
		{
			if(session.getAttribute("username")!=null)
			{
				String name=(String)session.getAttribute("username");
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
<link rel="stylesheet" type="text/css" href="css/home1.css" /> 
<link type="text/css" rel="stylesheet" href="css/slider.css" />
</head>
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
<!--start slider area-->
<table><tr><td>
 <div id="coter_box">
	<div id="slider_box">	
	  <img src="useImage/slider1.jpg" height="500px;" width="700px;" />
	   <img src="useImage/slider2.jpg" height="500px;" width="700px;" />
	  <img src="useImage/slider3.jpeg"  height="500px;" width="700px;"/>
	  <img src="useImage/slider4.png" height="500px;" width="700px;" />
</div>
</div>
</td>
<td><td style="font-size: 30px; color: #FFFFCC; position:relative; left:14px;">We provide a file storage system
in which your files are named and
are placed logically for
storage and retrieval.Without
a file system,stored information
wouldn't be isolated into individual files.</td></td>
</tr></table>
<!--End of slider area-->
</body>
</html>