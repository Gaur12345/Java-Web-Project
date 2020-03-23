<%! String email,name; %>
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
<link href="css/profile.css" rel="stylesheet">
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
<body bgcolor="#454545">
<%!
	String dob,gender,phoneno;
%>
<%
	ResultSet rs=null;
	rs=ShowFiles.showProfile(email);
	try{
		while(rs.next())
		{
			dob=rs.getString(3);
			gender=rs.getString(4);
			phoneno=rs.getString(7);
		}
	}catch(Exception e)
	{
		
	}
%>
<div class="profile">
<img src="useImage/profile.svg.png">
<div class="protext">
</div>
</div>
<div>
<div class="pro-box">
<form action="ChangeNumber" method="post">

	<table cellspacing="50" id="myTable" bgcolor="#008080">
	<tr><td>USERNAME</td><td><%=name %></td></tr>
	<tr><td>DOB</td><td><%=dob %></td></tr>
	<tr><td>GENDER</td><td><%=gender %></td></tr>
	<tr><td>EMAIL ID</td><td><%=email %></td></tr>
	<tr><td>PHONE NO</td><td><%=phoneno %></td></tr>
	<tr><td colspan="2"><button onclick="myFunction();" class="btn success">Change Phone Number</button></td><td><a href="Home.jsp" class="btn success" style="text-decoration:none">BACK</a></td></tr>
	
	</table>

</form>
</div>
</div>
<script>
	function myFunction()
	{
		var i=1;
		if(i==1)
		{
		var table=document.getElementById("myTable");
		var y = document.createElement("TR");
		y.setAttribute("id","mytr");
		table.appendChild(y);
		
		
		var z = document.createElement("TD");
		var t = document.createTextNode("New Phone no");
		var z1 = document.createElement("TD");
		var t1 = document.createElement("input");
		t1.setAttribute("type","number");
		t1.setAttribute("name","phone");
		t1.setAttribute("id","mobnumber");
		var z2=document.createElement("TD");
		var spnt=document.createElement("span");
		spnt.setAttribute("id","num1");
		spnt.setAttribute("style","color:red");
		
		z.appendChild(t);
		z1.appendChild(t1);
		z2.appendChild(spnt);

		document.getElementById("mytr").appendChild(z);
		document.getElementById("mytr").appendChild(z1);
		document.getElementById("mytr").appendChild(z2);
		
		table.deleteRow(5);
		
		var row=document.createElement("TR");
		
		row.setAttribute("id","srow");
		table.appendChild(row);
		
		var col = document.createElement("TD");
		col.setAttribute("colspan","2");
		var inp = document.createElement("INPUT");
		inp.setAttribute("type","submit");
		inp.setAttribute("value","Change");
		inp.setAttribute("class","btn success");
		inp.setAttribute("onclick","validateNumber()");
		
		var col2 = document.createElement("TD");
		var inp2 = document.createElement("A");
		var text = document.createTextNode("BACK");
		inp2.appendChild(text);
		inp2.setAttribute("href","Home.jsp");
		inp2.setAttribute("class","btn success");
		inp2.setAttribute("style","text-decoration:none");
		
		
		col.appendChild(inp);
		col2.appendChild(inp2);
		document.getElementById("srow").appendChild(col);
		document.getElementById("srow").appendChild(col2);
	
		}
	}
	
	function validateNumber()
	{
		var num=document.getElementById("mobnumber").value;
		var patt1=/^[0]?[6789]\d{9}$/;
		if(patt1.test(num))
		{
	
				
		}
		else
		{
			document.getElementById("num1").innerHTML="Enter the only 10 digit number";
			const element = document.querySelector('form');
			element.addEventListener('submit', event => {	
			event.preventDefault();
			});
			

		}
	}
</script>

</body>
</html>