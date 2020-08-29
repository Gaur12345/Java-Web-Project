
<%@ page import="connDAO.DatabaseConnection" %>
<%@ page import="java.sql.*" %>


<%
if(request.getParameter("foremail")!=null)
{
		String email = request.getParameter("foremail");
		try
		{
			PreparedStatement ps=DatabaseConnection.conn.prepareStatement("select email from registraion where email='"+request.getParameter("foremail")+"' ");
			ResultSet rs=ps.executeQuery();
			int flag=0;
			while(rs.next())
			{
				if(email.equals(rs.getString("email")))
				{
					flag=1;
					out.print("Email is already exites");
				}
			}
			if(flag==0)
			{
				out.print("Email Success");
			}
		}catch(Exception e)
		{
			out.print(e.getMessage());
		}
}
%>


<%
	if(request.getParameter("email")!=null)
	{
		String eemail= request.getParameter("email");
		try{
		PreparedStatement ps=DatabaseConnection.conn.prepareStatement("select email from registraion where email='"+eemail+"' ");
		ResultSet rs=ps.executeQuery();
		int flag=0;
		while(rs.next())
		{
			if(eemail.equals(rs.getString("email")))
			{
				flag=1;
				out.print("Email is already exites");	
			}
		}
		if(flag==0)
		{
			out.print("Email success");
		}
		}catch(Exception e)
		{
			out.print(e.getMessage());
		}
	}
	
%>

<%
if(request.getParameter("mobile")!=null)
{
	String emobile= request.getParameter("mobile");
	try{
	PreparedStatement ps=DatabaseConnection.conn.prepareStatement("select mobile from registraion where mobile='"+emobile+"' ");
	ResultSet rs=ps.executeQuery();
	int flag=0;
	while(rs.next())
	{
		if(emobile.equals(rs.getString("mobile")))
		{
			flag=1;
			out.print("Mobile Number is already exites ");	
		}
	}
	if(flag==0)
	{
		out.print("Mobile success");
	}
	}
	catch(Exception e)
	{
		out.print(e.getMessage());
	}
}
%>





