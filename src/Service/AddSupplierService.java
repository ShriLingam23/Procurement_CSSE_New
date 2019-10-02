package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Supplier;

public class AddSupplierService {
	public boolean insertSupplier(Supplier reg) {
		
		
		try {
			Connection con = DbConnection.getDBConnection();  	
			Statement st = con.createStatement();
			int i = st.executeUpdate("INSERT INTO supplier(supplier,email,mobile,mtype) VALUES('"+reg.getSupplier()+"','"+reg.getEmail()+"','"+reg.getMobile()+"','"+reg.getMaterialtype()+"')");

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
