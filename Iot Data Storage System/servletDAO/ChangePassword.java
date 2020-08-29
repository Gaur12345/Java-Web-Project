package servletDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import connDAO.DatabaseConnection;
import connDAO.PasswordEncryption;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
			HttpSession session = request.getSession(false);
			PreparedStatement ps=DatabaseConnection.conn.prepareStatement("update registraion set password='"+PasswordEncryption.passwordEnc(request.getParameter("cpass"))+"' where email='"+(String)session.getAttribute("email")+"' ");
			int num=ps.executeUpdate();
			if(num==1)
			{
				response.sendRedirect("index.html");
			}
			else
			{
				response.sendRedirect("ForgotPassword.jsp");
			}
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
		
		
	}

}
