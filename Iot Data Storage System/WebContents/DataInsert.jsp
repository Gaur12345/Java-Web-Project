<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="connDAO.DatabaseConnection" %>
<%
	try{
	PreparedStatement ps=DatabaseConnection.conn.prepareStatement("insert into reccords (name,email,product_number,temp,mode,datetime) values (?,?,?,?,?,?) ");
	ps.setString(1,request.getParameter("name"));
	ps.setString(2,request.getParameter("email"));
	ps.setString(3,request.getParameter("product_number"));
	ps.setString(4,request.getParameter("temp"));
	ps.setString(5,request.getParameter("mode"));
	ps.setString(6,request.getParameter("datetime"));
	
	int num=ps.executeUpdate();
	if(num==1)
	{
		out.println("Record is Inserted successfully ");
		
	}
	else
	{
		out.println("Record is Not Inserted successfully");
	}
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>

