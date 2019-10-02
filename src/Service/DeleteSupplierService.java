package Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import Connection.DbConnection;

public class DeleteSupplierService {

	public boolean deleteSupplier(String supid) {
			
			try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();
	
						String query = "DELETE FROM supplier WHERE supid='"+supid+"'";
					
						st.executeUpdate(query);
						
						return true;
						
				
				} 
	
				catch (SQLException e) {
					e.printStackTrace();
					}
	
				return false;
			}

}
