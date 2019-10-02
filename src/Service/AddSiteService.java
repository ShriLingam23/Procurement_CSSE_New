package Service;

import java.sql.Connection;
import java.sql.Statement;
import Connection.DbConnection;
import Entities.Site;


public class AddSiteService {
	
	public boolean insertSite(Site reg) {
			
			
			try {
				Connection con = DbConnection.getDBConnection();  	
				Statement st = con.createStatement();
				int i = st.executeUpdate("INSERT INTO site(client,location,budget,contact,sdate,edate) VALUES('"+reg.getClient()+"','"+reg.getLocation()+"','"+reg.getBudget()+"','"+reg.getContact()+"','"+reg.getSdate()+"','"+reg.getEdate()+"')");
	
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
