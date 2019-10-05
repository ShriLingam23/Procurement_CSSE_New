package Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Request;

public class DeliveryNoteService {
	
	public boolean updateRequest(Request res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();
					
						String query = "UPDATE request SET status='Delivered',rqty='"+res.getRqty()+"' WHERE rid='"+res.getRid()+"'";
						st.executeUpdate(query);

							return true;

			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
	}


}
