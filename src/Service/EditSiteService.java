package Service;

import java.sql.Connection;
import java.sql.Statement;

import Connection.DbConnection;
import Entities.Site;
;

public class EditSiteService {
	public boolean updateSite(Site res) {

		try {
					Connection con = DbConnection.getDBConnection();  	
					Statement st = con.createStatement();

						String query = "UPDATE site SET location='"+res.getLocation()+"',budget='"+res.getBudget()+"',contact='"+res.getContact()+"',sdate='"+res.getSdate()+"',edate='"+res.getEdate()+"' WHERE client='"+res.getClient()+"'";
						st.executeUpdate(query);

							return true;

	
			} 

					catch(Exception e){
						System.out.println(e);
					} 

						return false;
}

}