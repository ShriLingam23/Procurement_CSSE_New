package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Material;


public class EditMaterialService {
	public boolean updateMaterial(Material res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();

						String query = "UPDATE material SET supplier='"+res.getSupplier()+"',quantity='"+res.getQty()+"',price='"+res.getPrice()+"' WHERE material='"+res.getMaterial()+"'";
						st.executeUpdate(query);

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
	}


}
