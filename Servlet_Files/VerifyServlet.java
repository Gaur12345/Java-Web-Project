package servletpk;
import connDAO.SendOtp;
import java.sql.*;
import connDAO.ProjectConnection;
import connDAO.Encryption;
import servletpk.RegistrationServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerifyServlet
 */
@WebServlet("/VerifyServlet")
public class VerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PreparedStatement ps;	
		PrintWriter out=response.getWriter();
		String otp=request.getParameter("otp");
		String otp2=SendOtp.getOtp();
		String uname,email,gender,password,day,month,year,dob,number;
		uname=RegistrationServlet.uname;
		email=RegistrationServlet.email;
		gender=RegistrationServlet.gender;
		password=RegistrationServlet.password;
		dob=RegistrationServlet.dob;
		number=RegistrationServlet.number;
		int count,em,mn;
		String pass = null;
		
		
		if(otp.equals(otp2))
		{
			try
			{
				pass=Encryption.createEncryption(password);
			}
			catch(Exception e)
			{
				out.println(e.getMessage());
			}
			try {
				ps=ProjectConnection.conn.prepareStatement("select * from login where email='"+email+"'");
				em=ps.executeUpdate();
				if(em>0)
				{
					response.sendRedirect("Emailerror.jsp");
				}
				else
				{
					ps=ProjectConnection.conn.prepareStatement("select * from registration where mobile='"+number+"'");
					mn=ps.executeUpdate();
					if(mn>0)
					{
						response.sendRedirect("NumberError.jsp");
					}
					else
					{
						ps=ProjectConnection.conn.prepareStatement("insert into registration (uname,DOB,gender,EMAIL,password,mobile) " + "values (?,?,?,?,?,?)");
						ps.setString(1,uname);
						ps.setString(2,dob);
						ps.setString(3, gender);
						ps.setString(4, email);
						ps.setString(5,pass);
						ps.setString(6, number);
						count = ps.executeUpdate();
					
						if (count>0)
						{
							response.sendRedirect("Login.jsp");		
						}
						else
						{
							response.sendRedirect("Registration.jsp");
						}
					}
				}
			}
			catch(SQLException e)
			{
				response.sendRedirect("Registration.jsp");
			}
			catch(Exception e)
			{
				response.sendRedirect("Registration.jsp");
				
			}
		}
		else
		{
			response.sendRedirect("ErrorOtp.jsp");
		}
		
	}

}
