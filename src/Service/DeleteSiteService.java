package Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import Connection.DbConnection;

public class DeleteSiteService {
	public boolean deleteSite(String sid) {
			
			try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();
				
					String query = "DELETE FROM site WHERE sid='"+sid+"'";
				
					st.executeUpdate(query);
					
					return true;
					
				
			} 
	
				catch (SQLException e) {
							e.printStackTrace();
				}
	
			return false;
		}
	
	}
