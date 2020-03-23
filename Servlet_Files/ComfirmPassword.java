package servletpk;

import connDAO.Encryption;
import connDAO.ProjectConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComfirmPassword
 */
@WebServlet("/ComfirmPassword")
public class ComfirmPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
	static String number,email;
	public static void sendData(String data,String ema)
	{
		number=data;
		email=ema;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String newPass=request.getParameter("newPassword");
		String pass=null;
		try
		{
			pass=Encryption.createEncryption(newPass);
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
	
		PreparedStatement ps;
		try
		{
			ps=ProjectConnection.conn.prepareStatement("update login set password='"+pass+"' where mobile='"+number+"'");
			ps.executeQuery();
			ps=ProjectConnection.conn.prepareStatement("update registration set password='"+pass+"' where email='"+email+"' ");
			ps.executeQuery();
			response.sendRedirect("Login.jsp");
		}catch(Exception e)
		{
			response.sendRedirect("Compass.jsp");
		}
		
	}

}
