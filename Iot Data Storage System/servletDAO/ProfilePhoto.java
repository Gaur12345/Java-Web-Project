package servletDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import connDAO.DatabaseConnection;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfilePhoto
 */
@WebServlet("/ProfilePhoto")
public class ProfilePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		File file;
		HttpSession session =request.getSession(true);
		String email=(String)session.getAttribute("email");
		int maxSize= 1024 * 1024 * 9;
		int maxFactSize= 1024 * 1024 * 10;
		PrintWriter out=response.getWriter();
		String path="E:/eclipse/iotsystem/WebContent/profileImage/";
		String type=request.getContentType();
		out.println(type);
		if(type.indexOf("multipart/form-data")>=0)
		{
			out.println("its a multipart data");
			DiskFileItemFactory disFact = new DiskFileItemFactory();
			disFact.setSizeThreshold(maxFactSize);
			disFact.setRepository(new File("C:\\tmp"));
			ServletFileUpload upload=new ServletFileUpload(disFact);
			upload.setSizeMax(maxSize);
			try
			{
				List lis=upload.parseRequest(request);
				Iterator itr=lis.iterator();
				while(itr.hasNext())
				{
					String str;
					FileItem item=(FileItem)itr.next();
					out.println(item.isFormField());
					if(!item.isFormField())
					{
						str=item.getName();
						str=email+(str.substring(str.indexOf(".")));
						out.println(str);
						file=new File(path,str);
						item.write(file);
						str="profileImage/"+str;
						PreparedStatement ps=DatabaseConnection.conn.prepareStatement("update registraion set image='"+str+"' where email='"+email+"' ");
						int num =ps.executeUpdate();
						if(num==1)
						{
							session.setAttribute("image", str);
							response.sendRedirect("Profile.jsp");
						}
						else
						{
							out.println("Image is not inserted");
						}
					}
					
				}
			
		}
		catch(Exception e)
		{
			out.println(e.getMessage());	
		}
			
		}
		
	}

}
