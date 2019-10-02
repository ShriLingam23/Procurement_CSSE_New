package Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import Connection.DbConnection;

public class DeleteMaterialService {
	public boolean deleteMaterial(String mid) {
			
			try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();
	
						String query = "DELETE FROM material WHERE mid='"+mid+"'";
					
						st.executeUpdate(query);
						
						return true;
						
				
				} 
	
				catch (SQLException e) {
					e.printStackTrace();
					}
	
				return false;
			}
	
	
	}
