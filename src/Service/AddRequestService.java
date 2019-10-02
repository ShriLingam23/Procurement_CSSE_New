package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Request;

public class AddRequestService {
	public boolean insertRequest(Request reg) {
		
		
		try {
			Connection con = DbConnection.getDBConnection();  	
			Statement st = con.createStatement();
			int i = st.executeUpdate("INSERT INTO request(material,location,rdate,qty) VALUES('"+reg.getMaterial()+"','"+reg.getLocation()+"','"+reg.getRdate()+"','"+reg.getQty()+"')");

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