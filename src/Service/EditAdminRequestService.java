package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Request;

public class EditAdminRequestService {
	public boolean updateRequest(Request res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();

						String query = "UPDATE request SET status='"+res.getStatus()+"',odate='"+res.getOdate()+"',uprice='"+res.getUprice()+"',rqty='"+res.getRqty()+"',supplier='"+res.getSupplier()+"',payment='"+res.getPayment()+"' WHERE material='"+res.getMaterial()+"' and location='"+res.getLocation()+"'";
						st.executeUpdate(query);

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
	}


}
