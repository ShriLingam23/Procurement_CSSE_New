package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.User;

public class EditUserService {
	public boolean updateUser(User res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();

						String query = "UPDATE user SET email='"+res.getEmail()+"',password='"+res.getPassword()+"',cpassword='"+res.getCpassword()+"',mobile='"+res.getMobile()+"',role='"+res.getRole()+"' WHERE username='"+res.getUsername()+"'";
						st.executeUpdate(query);

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
}

}