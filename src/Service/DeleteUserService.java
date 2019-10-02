package Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import Connection.DbConnection;

public class DeleteUserService {

	public boolean deleteUser(String uid) {
		
		try {
				Connection con = DbConnection.getDBConnection();  	
				Statement st = con.createStatement();

					String query = "DELETE FROM user WHERE uid='"+uid+"'";
				
					st.executeUpdate(query);
					
					return true;
					
			
			} 

			catch (SQLException e) {
				e.printStackTrace();
				}

			return false;
		}


}
