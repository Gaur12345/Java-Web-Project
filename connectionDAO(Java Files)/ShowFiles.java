package connDAO;
import connDAO.ProjectConnection;
import java.sql.*;

public class ShowFiles
{
	public static ResultSet rs;
	//ProjectConnection.conn;
	public static PreparedStatement ps;
	public static ResultSet showData(String email)
	{
		try {
			ps=ProjectConnection.conn.prepareStatement("select * from storeFile where email= '"+email+"'");
			rs=ps.executeQuery();
			return rs;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet showPdf(String email)
	{
		try {
			ps=ProjectConnection.conn.prepareStatement("select * from storepdf where email='"+email+"'");
			rs=ps.executeQuery();
			return rs;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet showProgramfile(String email)
	{
		try {
			ps=ProjectConnection.conn.prepareStatement("select * from storeProgram where email='"+email+"'");
			rs=ps.executeQuery();
			return rs;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public static ResultSet showProfile(String email)
	{
		try {
			ps=ProjectConnection.conn.prepareStatement("select * from registration where email='"+email+"'");
			rs=ps.executeQuery();
		return rs;	
		}catch(Exception e)
		{
			
		}
		return null;
		
	}
}
