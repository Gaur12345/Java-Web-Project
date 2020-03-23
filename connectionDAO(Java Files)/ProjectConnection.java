package connDAO;

import java.sql.*;

public class ProjectConnection
{
	public static Connection conn;
	public static ResultSet rs;
	public static PreparedStatement ps;
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver is loded");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","gaurav12345");
			System.out.println("Connection is establish");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}	
}
