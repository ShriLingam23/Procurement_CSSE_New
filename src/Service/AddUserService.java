package Service;

import java.sql.Connection;
import java.sql.Statement;
import Connection.DbConnection;
import Entities.User;

public class AddUserService {
	
	public boolean insertRegister(User reg) {
			
			
			try {
				Connection con = DbConnection.getDBConnection();  	
				Statement st = con.createStatement();
				int i = st.executeUpdate("INSERT INTO user(username,email,password,cpassword,mobile,role) VALUES('"+reg.getUsername()+"','"+reg.getEmail()+"','"+reg.getPassword()+"','"+reg.getCpassword()+"','"+reg.getMobile()+"','"+reg.getRole()+"')");
	
				if(i>0) {
					return true;
				}
				
			}
			catch(Exception e){
				System.out.println(e);
			} 
	
			return false;
		}
	

}
