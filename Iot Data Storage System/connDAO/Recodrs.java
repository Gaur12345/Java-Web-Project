package connDAO;

import java.sql.*;
import connDAO.DatabaseConnection;

public class Recodrs
{
	static PreparedStatement ps;
	static ResultSet rs;
	
	public static ResultSet records(String email)
	{
		try {
			ps=DatabaseConnection.conn.prepareStatement("select * from  reccords where email='"+email+"' ");
			rs=ps.executeQuery();
		}
		catch(Exception e)
		{
			
		}
		return rs;
	}
	
	
	
	public static ResultSet profileData(String email)
	{
		try {
			ps=DatabaseConnection.conn.prepareStatement("select name,gender,email,Product_Number,mobile,regDate from  registraion where email='"+email+"' ");
			rs=ps.executeQuery();
		}
		catch(Exception e)
		{
			
		}
		return rs;
		
	}

}
