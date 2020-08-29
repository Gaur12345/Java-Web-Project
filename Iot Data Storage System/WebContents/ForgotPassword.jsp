<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="cssIOT/login.css" rel="stylesheet">
<link  rel="icon" href="image/title2.jpg" />
<title>IOT</title>
</head>
<body>

<div class="login-box">
<img src="image/avatar.png" class="avatar">
<h1>Forgot Password</h1>
<form action="ChangePassword.jsp" method="post">
<p id="p1" >Email</p>
<input type="email" name="cemail" id="email" placeholder="Enter Useremail" onblur="emailCkeck()" required autocomplete="off" />

<h1 id="capch" style="color:lightgray;background-color:white"></h1>
<input type="text"  id="captcha" onblur="validateCatcha()" placeholder="Enter number Captcha code" autocomplete="off" required />
<h4 id="h1"></h4>

<br><input type="submit" id="submit" name="submit" value="login"><br/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="index.html">Login</a>   
</form>
</div>

<script src="cssIOT/jquery.js"></script>
<script>
	var stF=0;
	$(document).ready(function(){
		$("#submit").click(function(){
			if(stF!=0)
			{
				return false;
			}
			
		});
	});
	
	// EmailCheck Function start
	function emailCkeck()
	{
		$(document).ready(function(){
			var email=$('#email').val();
			$.ajax({
				url:"AjaxClass",
				type:"post",
				data:{foremail:email},
				success:function(data,status)
				{
					if(data=="Email is already exites")
					{
						$("#p1").html("Email Success");
						$("#p1").css("color","green");
						stF=0;
					}
					else
					{
						$("#p1").html("Email does't not exist");
						$("#p1").css("color","red");
						stF=1;
						return false;
					}	
				}
			});
			
		});
		
	}
	//Function End
</script>
	
	
<script>
		var num=0;
		var count=0;
	
		$(document).ready(function(){
			num=Math.floor((Math.random() * 100000) + 1);
			$("#capch").html(num);
		});
		
		
		function validateCatcha()
		{
			$(document).ready(function(){
				var val=$("#captcha").val();
				if(num==val)
				{	
					$("#h1").html("Captcha success");
					$("#h1").css("color","green");
					count=0;
				}
				else
				{
					$("#h1").html("Incorrect Captcha");
					$("#h1").css("color","red");
					count=1;
					return false;
				}
			});
		}
	
		function formckeck()
		{
			if(count==1)
			{
				$("#h1").html("Incorrect Captcha");
				$("#h1").css("color","red");
				return false;
			}	
		}
</script>

</body>
</html>