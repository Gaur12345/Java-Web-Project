<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/csss.css">
<link rel="text/javascript" href="MyScript.js" >
<link href="useImage/realfileFiles.ico" type="image" rel="icon" />
<title>File Storage Syatem</title>
</head>
<body>
	   <form action="RegistrationServlet" method="post">
		<div class="header">
			<h2>Register</h2>
		</div>
			<table align="center" cellspacing="30">
				<tr><td>USERNAME</td><td><input type="text" name="username" required id="na" onblur="validateName()" width="300px" placeholder="Enter your full name"/></td><td><span id="nam" style="color:red"></span></td></tr>
				<tr><td>DOB</td><td><select id="day" name="day" required>
											<option>Day</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
									</select>
									
									<select id="month" name="month" required>
											<option>Month</option>
											<option value="Jan">Jan</option>
											<option value="Feb">Feb</option>
											<option value="Mar">Mar</option>
											<option value="Apr">Apr</option>
											<option value="May">May</option>
											<option value="Jun">Jun</option>
											<option value="Jul">Jul</option>
											<option value="Aug">Aug</option>
											<option value="Sept">Sept</option>
											<option value="Oct">Oct</option>
											<option value="Nov">Nov</option>
											<option value="Dec">Dec</option>
									</select>
									
									<select id="year" name="year" required>
											<option>Year</option>
											<option value="1990">1990</option>
											<option value="1991">1991</option>
											<option value="1992">1992</option>
											<option value="1993">1993</option>
											<option value="1994">1994</option>
											<option value="1995">1995</option>
											<option value="1996">1996</option>
											<option value="1997">1997</option>
											<option value="1998">1998</option>
											<option value="1999">1999</option>
											<option value="2000">2000</option>
											<option value="2001">2001</option>
											<option value="2002">2002</option>
											<option value="2003">2003</option>
											<option value="2004">2004</option>
											<option value="2005">2005</option>
											<option value="2006">2006</option>
											<option value="2007">2007</option>
											<option value="2008">2008</option>
											<option value="2009">2009</option>
											<option value="2010">2010</option>
											<option value="2011">2011</option>
											<option value="2012">2012</option>
											<option value="2013">2013</option>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
									</select></td></tr>
				<tr><td>Gender</td><td><select required name="gender">
					<option>Select your option</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="other">Others</option>
	
				</select></td></tr>
				<tr><td>EMAIL</td><td><input type="email" name="email" required placeholder="Enter your email"/></td></tr>
				<tr><td>PASSWORD</td><td><input type="password" name="password" required placeholder="Enter your password"/></td></tr>
				<tr><td>MOBILE-NO</td><td><input type="number" name="mobile" id="mobnumber" required  onkeyup="validateNumber();" placeholder="Enter your contact no."/></td><td><span id="num1" style="color:red"></span></td></tr>
				<tr><td><input type="submit" value="SignUp"  /></td><td><button><a href="Login.jsp" style="text-decoration:none;">Login</a></button></td></tr>
				
			</table>
		</form>
		
		<script src="E:\Bootstrap\js\jquery-3.3.1.js"></script>
		<script src="E:\Bootstrap\js\bootstrap.min.js"></script>
		<script>
		
		var k=0;
		function validateName()
		{
			var name=document.getElementById("na").value;
			patt1 = /\d/g;
			var result = name.match(patt1);
			var j=1;
			if(result!=null)
			{
				k=1;
				document.getElementById("nam").innerHTML="Please Not Use Numbers for Name";	
			}
			else
			{
				for(var i=0;i<name.length;i++)
				{
					var s= name.substring(i,j);
					j=j+1;
					
					if(s=='`' || s=='~' || s=='!' || s=='@' || s=='#' || s=='$' || s=='%' || s=='^' || s=='&' || s=='*' || s=='(' || s==')' || s=='-' || s=='_' || s=='{' || s=='[' || s=='}' || s==']' || s=='|' || s=='"' || s==';' || s==':' || s=='/' || s=='?' )
					{
						k=1;
						document.getElementById("nam").innerHTML="Please Not Use Any Special Character In Name";
					}
					else
					{ 							
						if(k==1)
						{
							document.getElementById("nam").innerHTML="Name is valid";	
						}
						
					}
				}
		
			}
		
		}
		
			function validateNumber()
			{
				var num=document.getElementById("mobnumber").value;
				var patt1=/^[0]?[6789]\d{9}$/;
				if(patt1.test(num))
				{
					$('#submit').prop('disabled', false);
					if(m==1)
					{
						document.getElementById("num1").innerHTML="Number is valid";
						$('#submit').prop('disabled', false);
					}
				}
				else
				{
					document.getElementById("num1").innerHTML="Enter the only 10 digit number";
					$('#submit').prop('disabled', true);
					//const element = document.querySelector('form');
					//element.addEventListener('submit', event => {	
					//event.preventDefault();
					//});
					
				}
			}
		</script>
</body>
</html>