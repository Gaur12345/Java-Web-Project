package servletpk;

import java.io.IOException;
import java.io.PrintWriter;
import connDAO.ProjectConnection;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangeNumber
 */
@WebServlet("/ChangeNumber")
public class ChangeNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		String phone=request.getParameter("phone");
		String email;
		int count=0;
		int count2=0;
		PrintWriter out=response.getWriter();
		PreparedStatement ps;
		
		HttpSession session=request.getSession();
		
		email=(String)session.getAttribute("email");
		
		
	
		out.println("Email is "+email);
		
		out.println(phone);
		try {
				ps=ProjectConnection.conn.prepareStatement("update login set mobile='"+phone+"' where email='"+email+"' ");
				count=ps.executeUpdate();
				if(count>0)
				{
					ps=ProjectConnection.conn.prepareStatement("update registration set mobile='"+phone+"' where email='"+email+"' ");
					count2=ps.executeUpdate();
					response.sendRedirect("UpdateNumber.jsp");
				}
				else
				{
					response.sendRedirect("Profile.jsp");
				}
			}catch(Exception e)
		   	{
				out.println(e.getMessage());
		   	}
		
		
		
	}

}
