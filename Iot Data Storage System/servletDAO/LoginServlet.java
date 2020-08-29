package servletDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connDAO.DatabaseConnection;
import connDAO.PasswordEncryption;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			PreparedStatement ps=DatabaseConnection.conn.prepareStatement("select email,password from `registraion` where email='"+request.getParameter("cemail")+"' AND password='"+PasswordEncryption.passwordEnc(request.getParameter("cpassword"))+"' ");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				if(request.getParameter("cemail").equals(rs.getString("email")) && PasswordEncryption.passwordEnc(request.getParameter("cpassword")).equals(rs.getString("password")))
				{
					ps=DatabaseConnection.conn.prepareStatement("select * from `registraion` where email='"+request.getParameter("cemail")+"' ");
					rs=ps.executeQuery();
					while(rs.next())
					{
						HttpSession session=request.getSession(true);
						session.setAttribute("name",rs.getString("name"));
						session.setAttribute("email",request.getParameter("cemail"));
						String image=rs.getString("image");
						if(image!=null)
						{
							session.setAttribute("image",image);
						}
						/*Cookie cok[]=request.getCookies();
						String name=cok[0].getName();
						
						String value=cok[0].getValue();
						System.out.println(name);
						System.out.println(value);
						
						if(name==null && value==null)
						{
							Cookie ck=new Cookie("NoOfHit","1");
							int exp = (30 * 24 * 60 * 60);
							ck.setMaxAge(exp);
							response.addCookie(ck);
							ps=DatabaseConnection.conn.prepareStatement("update registraion set cookie='"+1+"', coExp='"+exp+"' where email='"+request.getParameter("cemail")+"' ");
							int n=ps.executeUpdate();
						}
						else
						{
							ps=DatabaseConnection.conn.prepareStatement("select coExp from registraion  where email='"+request.getParameter("cemail")+"' ");
							ResultSet rs2=ps.executeQuery();
							int expDate=0;
							while(rs2.next())
							{
								expDate=rs.getInt("coExp");
							}
							
							
							int nu=Integer.parseInt(value);
							nu++;
							String val = Integer.toString(nu);
							Cookie ck=new Cookie("NoOfHit",val);
							ck.setMaxAge(expDate);
							response.addCookie(ck);
							ps=DatabaseConnection.conn.prepareStatement("update registraion set cookie='"+nu+"'  where email='"+request.getParameter("cemail")+"' ");
							int n=ps.executeUpdate();
							
						}*/
						response.sendRedirect("Home.jsp");
					}
				}
				else
				{
					response.sendRedirect("index.html");
				}
			}
			
		}catch(Exception e)
		{
			out.println("Exception is occure: "+e.getMessage());
		}
	}

}
