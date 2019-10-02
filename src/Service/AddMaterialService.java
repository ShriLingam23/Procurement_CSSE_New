package Service;

import java.sql.Connection;
import java.sql.Statement;
import Connection.DbConnection;
import Entities.Material;


public class AddMaterialService {
	
	public boolean insertMaterial(Material reg) {
			
			
			try {
				Connection con = DbConnection.getDBConnection();  	
				Statement st = con.createStatement();
				int i = st.executeUpdate("INSERT INTO material(material,supplier,quantity,price) VALUES('"+reg.getMaterial()+"','"+reg.getSupplier()+"','"+reg.getQty()+"','"+reg.getPrice()+"')");
	
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
