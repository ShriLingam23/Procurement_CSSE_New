package Service;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import Connection.DbConnection;
import Entities.User;

public class LoginService {

	public boolean checkLogin(User log) {
		try {
			Connection con = DbConnection.getDBConnection();  	
			Statement st = con.createStatement();
			ResultSet result = st.executeQuery("SELECT username,password FROM user WHERE username='"+log.getUsername()+"' AND password='"+log.getPassword()+"'");
			
			if(result.next()) {
	 			return true;
	 		}else {
	 			return false;
	 		}
			
		}
		catch(Exception e){
			System.out.println(e);
		} 
		
		
		return false;
	}
}