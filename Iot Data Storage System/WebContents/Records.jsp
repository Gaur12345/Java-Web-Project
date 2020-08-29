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
<%@ page import="java.sql.*" %>
<%@ page import="connDAO.DatabaseConnection" %>
<%@ page import="connDAO.Recodrs" %>
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
<style>
		.my-custom-scrollbar
		{
			position: relative;
			height:642px;
			overflow: auto;
		}
		.table-wrapper-scroll-y {
		display: block;
		}

	</style>
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
							<label style="color:white"><b><% out.print(session.getAttribute("name")); %></b></label>
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
				
				<div class="col-sm-10 mainBody" style="height:680px" > 
					<div style="width:100%"> 
						<table><tr><td><h2 class="text-danger">All Records </h2></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="button"  class="btn btn-primary" id="btnExport" value="Print Pdf" onclick="Export()" /></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="Search......" style="width:300px;height:35px" /></td></tr></table>
					</div>
					
					<div class="table-wrapper-scroll-y my-custom-scrollbar mytable">

						
							<table class="table table-bordered table-striped mb-0" id="tblCustomers" >
								<tr>
								<th>S.no</th>
								<th>Name</th>
								<th>Email</th>
								<th>Product Number</th>
								<th>Temp</th>
								<th>Mode</th>
								<th>Food Time</th>
								</tr>
								
								<%
									ResultSet rs=Recodrs.records(email);
									int num=1;
									while(rs.next())
									{
								%>
									<tr><td><%=num %></td><td><%=rs.getString("name") %></td><td><%=rs.getString("email") %></td><td><%=rs.getString("product_number") %></td><td><%=rs.getString("temp") %></td><td><%=rs.getString("mode") %></td><td><%=rs.getString("datetime") %></td></tr>
								<%
									num++;
									}
								%>
							</table>
				</div>
			</div>
					
					
				</div>
			</div>
		
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('tblCustomers'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Records.pdf");
                }
            });
        }
    </script>
		
	</body>
</html>