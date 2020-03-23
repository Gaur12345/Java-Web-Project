package servletpk;

import java.sql.*;
import servletpk.ComfirmPassword;
import connDAO.ProjectConnection;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String number=request.getParameter("mobile");
		out.println(email);
		out.println(number);
		String emaild="",numberd="";
		PreparedStatement ps;
		ResultSet rs;
		
		try {
			ps=ProjectConnection.conn.prepareStatement("select * from login where email='"+email+"' AND MOBILE='"+number+"'");
			rs=ps.executeQuery();
			while(rs.next())
			{
				emaild=rs.getString(3);
				numberd=rs.getString(5);
			}
			if(email.equals(emaild) && number.equals(numberd))
			{ 
				response.sendRedirect("Compass.jsp");
				ComfirmPassword.sendData(number,email);
			}
			else
			{
				response.sendRedirect("ErrorForget.jsp");
			}
			
		}catch(Exception e)
		{
			response.sendRedirect("ErrorForget.jsp");
		}	
	}
}
