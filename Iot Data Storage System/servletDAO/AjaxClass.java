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

/**
 * Servlet implementation class AjaxClass
 */
@WebServlet("/AjaxClass")
public class AjaxClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/plain");
		PrintWriter out=response.getWriter();
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
							HttpSession session=request.getSession(true);
							session.setAttribute("email", email);
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
		
	}

}
