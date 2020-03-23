package servletpk;
import connDAO.SendOtp;

import java.io.IOException;
import connDAO.Encryption;
import java.io.PrintWriter;

import connDAO.ProjectConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	static String uname,email,gender,password,day,month,year,dob,number;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		PreparedStatement ps;	
		response.setContentType("text/html");
		//String uname,email,gender,password,day,month,year,dob,number;
		int count,em,mn;
		uname=request.getParameter("username");
		email=request.getParameter("email");
		gender=request.getParameter("gender");
		day=request.getParameter("day");
		month=request.getParameter("month");
		year=request.getParameter("year");
		password=request.getParameter("password");
		number=request.getParameter("mobile");
		
		PrintWriter out=response.getWriter();
		String pass = null;
		dob=day+"/"+month+"/"+year;
		try
		{	
		int v=SendOtp.sendMailOtp(email,uname);
		if(v>0)
		{	
			response.sendRedirect("Otp.jsp");
		}
		}catch(Exception e)
		{
			out.println(e.getMessage());
		}
		
	}
	
}
