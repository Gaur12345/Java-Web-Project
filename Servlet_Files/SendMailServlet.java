package servletpk;

import java.io.IOException;
import connDAO.AttachmentMail;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request,response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String to=request.getParameter("to");
		String subject=request.getParameter("subject");
		String msg=request.getParameter("msg");
		String path=request.getParameter("path");
		
		try {
			AttachmentMail.sendMail(to, subject, msg,path);	
		}catch(Exception e)
		{
			response.sendRedirect("SheImg.jsp");
		}
		response.sendRedirect("ComformMail.jsp");
	}

}
