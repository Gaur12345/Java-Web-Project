<%
	String image="",email="";
	if(session.getAttribute("email")!=null && session.getAttribute("name")!=null)
	{
		image=(String)session.getAttribute("image");
		email=(String)session.getAttribute("email");
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
<meta charset="ISO-8859-1">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/bootstrap.min.css" >
<link href="cssIOT/newdeshbord.css" rel="stylesheet">
<link  rel="icon" href="image/title2.jpg" />
<title>IOT</title>
</head>
<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2 Myheaderleft">
					<div>
					<img src="image/iot.jpg" height="50px" width="200px" style="margin-top:10px;" /><br>
					</div>
				</div>
				
				<div class="col-sm-10 MyheaderRight">
				</div>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2 navBac">
					<div class="navbar">
						<div>
							<%
							if(image!=null)
							{
							%>
								<img src="<%=image %>" height="80px" width="80px" style="border-radius:100%;"/><br><br> 
							<% 
							}
							else
							{
							%>
								 <img src="image\profile.jpg" height="80px" width="80px" style="border-radius:100%;"/><br><br>
							<%
							}
							%>
							<label style="color:white"><b><%out.print(session.getAttribute("name")); %></b></label>
						</div>
						<div style="margin-top:100px;">
							<img src="image/Home.jpg" height="18px" width="18px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="Home.jsp">Home</a>
						</div><br>
						<div>
							<img src="image/user.jpg" height="18px" width="18px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="Profile.jsp">Profile</a>
						</div><br>
						<div>
							<img src="image/recored.jpg" height="18px" width="18px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="Records.jsp">Records</a>
						</div><br>
						<div>
							<img src="image/about.jpg" height="18px" width="18px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#">AboutUs</a>
						</div><br>
						<div>
							<img src="image/feedback.jpg" height="18px" width="18px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="Feedback.jsp">FeedBack</a>
						</div><br>
						<div>
							<img src="image/logout.jpg" height="18px" width="18px" class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="Logout.jsp" class="text-center">Log out</a>
						</div>
					</div>
				
				</div>
				
				<div class="col-sm-10">
					<div class="container-fluid ">
					<div class="row">
					<div class="col-sm-6">
					
				
					<div class="myform">
						<form>
							<div class="form-group formfeed">
								<input type="text" name="subject" id="subject" placeholder="Enter the subject" /><br><br>
								<textarea id="messge" name="message" placeholder="Write somethins.."></textarea><br><br>
								<input type="submit" value="Submit" class="btn btn-primary">
							</div>
						</form>
					</div>
					
					
					</div>
					
					<div class="col-sm-6">
					
					</div>
					</div>
					
					</div>
					
				</div>
			</div>
		</div>	
	</body>
</html>