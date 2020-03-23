package servletpk;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import connDAO.ProjectConnection;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		String name,email,str2;
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		name=(String)session.getAttribute("username");
		email=(String)session.getAttribute("email");
		out.println(name);
		out.println(email);
		
		File file;
		int maxSize= 1024 * 1024 * 9;
		int maxFactSize= 1024 * 1024 * 10;
		String str ="";
		PreparedStatement ps;
		ResultSet rs;
		String path="E:/eclipse/CollageProject/WebContent/";
		path=path+email;
		out.println(path);
		String type=request.getContentType();
		
		out.println(type);
		if(type.indexOf("multipart/form-data")>=0)
		{
			out.println("Its a multipart data");
			DiskFileItemFactory disFact = new DiskFileItemFactory();
			disFact.setSizeThreshold(maxFactSize);
			disFact.setRepository(new File("C:\\temp"));
			ServletFileUpload upload= new ServletFileUpload(disFact);
			upload.setFileSizeMax(maxSize);
			try {
				List lis=upload.parseRequest(request);
				Iterator itr=lis.iterator();
				out.println("befoue while loop");
				while(itr.hasNext())
				{
					out.println("Gaurav kumar 1");
					FileItem item=(FileItem)itr.next();
					out.println(item.isFormField());
					if(!item.isFormField())
					{
						out.println("gaurav kumar 2");
						str=item.getName();
						out.println("Using name"+str);
						str2=str;
						str=str.substring(str.indexOf("."));
						if(str.equals(".jpg") || str.equals(".png") || str.equals(".jpeg"))
						{
							//str=str2.substring(0,5)+name+str.substring(str.indexOf("."));
							out.println("In jpg");
							out.println(str);
							path=path+"/ImageFolder/";
							out.println(path);
							file = new File(path,str2);
							item.write(file);
							String query="insert into storeFile values ('"+email+"','"+str2+"')";
							ps=ProjectConnection.conn.prepareStatement(query);
							rs=ps.executeQuery();
							out.println("jpg file is uploded");
							response.sendRedirect("SuccUploadFile.jsp");
							//out.println("use String "+str2);
							str="";
							query="";
							str2="";
						}
						else if(str.equals(".pdf") || str.equals(".txt"))
						{
								//str=str2.substring(0,5)+name+str.substring(str.indexOf("."));
								str=str2;
								out.println("In pdf folder");
								out.println(str);
								path=path+"/PdfFolder/";
								file = new File(path,str);
								item.write(file);
								
								String query1="insert into storepdf values ('"+email+"','"+str+"')";
								ps=ProjectConnection.conn.prepareStatement(query1);
								rs=ps.executeQuery();
								out.println("pdf is uploded");
								response.sendRedirect("SuccUploadFile.jsp");
								str="";
								query1="";
							}
							else
							{
								if(str.equals(".C") || str.equals(".CPP") || str.equals(".java") || str.equals(".py") || str.equals(".html") ||str.equals(".js") ||  str.equals(".zip") || str.equals(".jsp") || str.equals(".class"))
								{
									//str=str2.substring(0,5)+name+str.substring(str.indexOf("."));
									str=str2;
									out.println("In Program folder");
									out.println(str);
									path=path+"/ProgramFolder/";
									file = new File(path,str);
									item.write(file);
									
									String query3="insert into storeProgram values ('"+email+"','"+str+"')";
									ps=ProjectConnection.conn.prepareStatement(query3);
									rs=ps.executeQuery();
									out.println("Program file is uploded");
									response.sendRedirect("SuccUploadFile.jsp");
									str="";
									query3="";
								}	
			     		}			
					}
				}
				
			}catch (FileUploadException e) 
			{	
				response.sendRedirect("LimitSizeFile.jsp");
			}catch (Exception e) 
			{
				response.sendRedirect("LimitSizeFile.jsp");
			}				
		}

	}
}