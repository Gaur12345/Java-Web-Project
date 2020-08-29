package connDAO;

import java.sql.*;
public class DatabaseConnection
{
	public static Connection conn;
	
	static {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/iotproject","root","");
			System.out.println("Connection is done successfully ");
		}
		catch(SQLException e)
		{
			System.out.print("Exception is : "+e.getMessage());
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}	
	}
}
