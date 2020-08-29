package servletDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connDAO.DatabaseConnection;
import connDAO.PasswordEncryption;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime; 
import java.util.Random;
/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try
		{
			Random random = new Random();
			int rand=random.nextInt(100000);
			String otp=Integer.toString(rand);
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM-dd-yy - HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			
			PreparedStatement ps=DatabaseConnection.conn.prepareStatement("INSERT INTO `registraion`(`Name`, `Gender`, `Email`, `Product_Number`, `Mobile`, `password`,`otp`,`regDate`) VALUES (?,?,?,?,?,?,?,?) ");
			ps.setString(1,request.getParameter("cname"));
			ps.setString(2, request.getParameter("cgender"));
			ps.setString(3, request.getParameter("cemail"));
			ps.setString(4, request.getParameter("cpronum"));
			ps.setString(5, request.getParameter("cmobile"));
			ps.setString(6,PasswordEncryption.passwordEnc(request.getParameter("cpassword")));
			ps.setString(7,otp);
			ps.setString(8,dtf.format(now));
			int num=ps.executeUpdate();
			
			Cookie ck=new Cookie("NoOfHit","1");
			int exp = (30 * 24 * 60 * 60);
			ck.setMaxAge(exp);
			response.addCookie(ck);
			ps=DatabaseConnection.conn.prepareStatement("update registraion set cookie='"+1+"', coExp='"+exp+"' where email='"+request.getParameter("cemail")+"' ");
			int n=ps.executeUpdate();
			
			if(num==1)
			{
				response.sendRedirect("index.html");
			}
			else
			{
				response.sendRedirect("Registration.jsp");
			}
		}
		catch(Exception e)
		{
			out.print("Exception is occure : "+e.getMessage());
		}
		
		
		
	}

}
