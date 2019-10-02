package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Supplier;

public class EditSupplierService {
	public boolean updateSupplier(Supplier res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();

						String query = "UPDATE supplier SET email='"+res.getEmail()+"',mobile='"+res.getMobile()+"',mtype='"+res.getMaterialtype()+"' WHERE supplier='"+res.getSupplier()+"'";
						st.executeUpdate(query);

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
	}


}
