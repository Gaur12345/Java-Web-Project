<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connDAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.*" %>

<%
	if(request.getParameter("cemail")!=null)
	{
		PreparedStatement ps=DatabaseConnection.conn.prepareStatement("select name,gender,email,product_number,mobile,regdate from registraion where email='"+request.getParameter("cemail")+"'");
		ResultSet rs=ps.executeQuery();
		String name="",email="",gender="",pro_num="",mobile="",regdate="";
		JsonMyClass jobj=null;
		while(rs.next())
		{
			jobj=new JsonMyClass(rs.getString("name"),rs.getString("email"),rs.getString("gender"),rs.getString("product_number"),rs.getString("mobile"),rs.getString("regdate"));
		}
		Gson gson = new Gson();
		String json=gson.toJson(jobj);
		out.println(json);
	}

%>

<%
	if(request.getParameter("rec")!=null)
	{
		PreparedStatement ps=DatabaseConnection.conn.prepareStatement("update registraion set name='"+request.getParameter("name")+"',gender='"+request.getParameter("gender")+"',email='"+request.getParameter("email")+"',product_number='"+request.getParameter("prod")+"',mobile='"+request.getParameter("mobile")+"' where email='"+request.getParameter("chenage")+"' ");
		int num=ps.executeUpdate();
		if(num==1)
		{
			out.print("Record Updated");
		}
		else
		{
			out.println("Record Not Updated");
		}
	}


%>


<% 
	if(request.getParameter("emi")!=null && request.getParameter("pass")!=null)
	{
		
	
		PreparedStatement ps=DatabaseConnection.conn.prepareStatement("update registraion set password='"+PasswordEncryption.passwordEnc(request.getParameter("pass"))+"' where email='"+request.getParameter("emi")+"' ");
		int num=ps.executeUpdate();
		if(num==1)
		{
			out.print("Password Changed");
		}
		else
		{
			out.print("Password Not Changed");
		}
	}


%>