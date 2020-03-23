package servletpk;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connDAO.ProjectConnection;
import connDAO.Encryption;
import connDAO.FileCreate;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PreparedStatement ps;
		ResultSet rs;
		String email,password,name="";
		email=request.getParameter("email");
		password=request.getParameter("password");
		PrintWriter out=response.getWriter();
		String pass=null;
		try
		{
			pass=Encryption.createEncryption(password);
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
		
		try{
			String query;
			String emaild="";
			String passwordd="";
			ps=ProjectConnection.conn.prepareStatement("select * from login where email='"+email+"' AND password='"+pass+"'");
			out.println("form"+password);
			rs=ps.executeQuery();
			out.println("after query excuted");
			while(rs.next())
			{
				emaild=rs.getString(3);
				passwordd=rs.getString(4);
				out.println("databases"+passwordd);
			}	
		    if(email.equals(emaild) && pass.equals(passwordd))
			{
		    	ps=ProjectConnection.conn.prepareStatement("select * from registration where email='"+emaild+"'");
		    	rs=ps.executeQuery();
		    	while(rs.next())
		    	{
		    		name=rs.getString(2);
		    	}
		    	HttpSession session=request.getSession(true);
		    	session.setAttribute("username",name);
		    	session.setAttribute("email", email);
		    	FileCreate.createFile(emaild);
				response.sendRedirect("Home.jsp");
			}
			else
			{
				response.sendRedirect("ErrorLogin.jsp");
			}
		}catch(Exception e)
		{
			response.sendRedirect("ErrorLogin.jsp");
		}
	}
}
