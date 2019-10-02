package Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import Connection.DbConnection;

public class DeleteAdminRequestService {
	public boolean deleteRequest(String rid) {
		
		try {
				Connection con = DbConnection.getDBConnection();  	
				Statement st = con.createStatement();
			
				String query = "DELETE FROM request WHERE rid='"+rid+"'";
			
				st.executeUpdate(query);
				
				return true;
				
			
		} 

			catch (SQLException e) {
						e.printStackTrace();
			}

		return false;
	}

}
