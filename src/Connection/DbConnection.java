package Connection;
import java.sql.Connection;
import java.sql.DriverManager;



public class DbConnection { 
	private static Connection con; 

	public static Connection getDBConnection(){ 
		
		
		try{  
			String driver ="com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/procurement"; 
			String username = "root"; 
			String password = "";
			  
			if(con == null || con.isClosed())
			{
				Class.forName(driver); 
				con = DriverManager.getConnection(url,username,password); 
			}
			
		} catch(Exception e){
			System.out.println(e);
		}
		return con;  
	}  
	
}